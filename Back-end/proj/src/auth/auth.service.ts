import {
  Injectable,
  BadRequestException,
  NotFoundException,
} from '@nestjs/common';

import { Admin } from 'src/admin/entities/admin.entity';
import { JwtService } from '@nestjs/jwt';
import { Repository } from 'typeorm';
import { InjectRepository } from '@nestjs/typeorm';
import { ConfigService } from '@nestjs/config';
import { Twilio } from 'twilio';
import { registerDto } from './dto/register.dto';
import { Pharmacy } from 'src/pharmacy/entities/pharmacy.entity';
import { Store } from 'src/store/entities/store.entity';
@Injectable()
export class AuthService {
  private twilioClient: Twilio;
  constructor(
    private readonly JwtService: JwtService,
    private configService: ConfigService,
    @InjectRepository(Admin)
    private adminRepository: Repository<Admin>,
    @InjectRepository(Pharmacy)
    private PharmacyRepository: Repository<Pharmacy>,
    @InjectRepository(Store)
    private StoreRepository: Repository<Store>,
  ) {
    const twilioConfig = this.configService.get('twilio');
    this.twilioClient = new Twilio(
      twilioConfig.accountSid,
      twilioConfig.authToken,
    );
  }

  async register(user: any) {
    switch (user.userType) {
      case 'admin': {
        const u = await this.adminRepository.findOne({
          where: { email: user.email },
        });
        if (u) {
          return 'already exist';
        }
        const { userType, ...result } = user;
        const use = await this.adminRepository.create(result);
        return await this.adminRepository.save(use);

        //not exist ,creat
      }
      case 'store': {
        const u = await this.StoreRepository.findOne({
          where: { license: user.license }, //name ==Pharmacy-license
        });
        if (u) {
          return 'already exist';
        }
        const { userType, ...result } = user;
        const use = await this.StoreRepository.create(result);
        return await this.StoreRepository.save(use);
      }
      case 'pharmacy': {
        const u = await this.PharmacyRepository.findOne({
          where: { license: user.license }, //name ==Pharmacy-license
        });
        if (u) {
          return 'already exist';
        }
        const { userType, ...result } = user;
        const use = await this.PharmacyRepository.create(result);
        return await this.adminRepository.save(use);
      }
    }
  }

  async login(user: any, type: string) {
    const payload = {
      email: user.email,
      sub: {
        name: user.name,
        type: type,
      },
    };
    console.log(payload);
    return {
      ...user,
      accessToken: await this.JwtService.signAsync(payload),
      refreshToken: await this.JwtService.signAsync(payload, {
        expiresIn: '7d',
      }),
    };
  }

  async refreshToken(user: any) {
    const payload = {
      email: user.email,
      sub: user.sub,
    };
    console.log(payload + 'refreshToken-----');
    return {
      accessToken: await this.JwtService.signAsync(payload),
    };
  }
  //reset password email ....
  // async forgetPassword(email: string, token: string) {
  //   const password = await this.RepositoryPassword.create({ email, token });

  //   await this.RepositoryPassword.save(password);

  //   const url = `http://localhost:3000/resetpassword/${token}`;

  //   this.MailerService.sendMail({
  //     to: email,
  //     subject: 'reset your password',
  //     html: `click <a href="${url}">here</a> to reset password`,
  //   });

  //   return {
  //     message: 'check your email',
  //   };
  // }

  // async resetPassword(body: any) {
  //   const { password, passwordConfirm, token } = body;
  //   if (password != passwordConfirm) {
  //     throw new BadRequestException('passwords not matche');
  //   }
  //   const passwordObj = await this.RepositoryPassword.findOne({
  //     where: { token: token },
  //   });

  //   const user = await this.AdminService.findByemail(passwordObj.email);

  //   if (!user) {
  //     throw new NotFoundException('use not found');
  //   }
  //   const hashedPass = await bcrypt.hash(password, 10);
  //   user.password = password;
  //   await this.AdminService.update(user.id, { ...user });

  //   return 'success';
  // }

  private generateRandomCode(): string {
    // Generate a random code using a library or custom logic
    // For example, you can use the 'randomstring' package:
    // const randomstring = require('randomstring');
    // return randomstring.generate({
    //   length: 6,
    //   charset: 'numeric',
    // });
    return Math.random().toString(20).substring(2, 12);
  }

  async sendPasswordResetCode(phoneNumber: string): Promise<void> {
    const code = this.generateRandomCode();
    await this.twilioClient.messages.create({
      body: `Your password reset code is: ${code}`,
      from: this.configService.get('twilio.phoneNumber'),
      to: phoneNumber,
    });

    // Store the code and the associated phone number in your database

    //const resetCode = new PasswordResetCode();
    // resetCode.phoneNumber = phoneNumber;
    // resetCode.code = code;
    //await this.passwordResetCodeRepository.save(resetCode);
    const resetCode = await this.adminRepository.findOne({
      where: { phone: phoneNumber },
    });
    resetCode.code = code;
    await this.adminRepository.save(resetCode);
  }

  async resetPassword(
    phoneNumber: string,
    code: string,
    newPassword: string,
  ): Promise<void> {
    const resetCode = await this.adminRepository.findOne({
      where: { phone: phoneNumber, code },
    });
    // const resetCode = await this.passwordResetCodeRepository.findOne({
    //   where: { phoneNumber, code },
    // });

    if (!resetCode) {
      // Code or phone number is invalid
      // Handle the error and return an appropriate response
      throw new Error('Invalid reset code');
    }

    // Code is valid, update the password for the user with the new password
    // Update the password for the user associated with the provided phone number
    // Example pseudocode:
    // const user = await this.adminRepository.findOne({
    //   where: { phone: phoneNumber },
    // });
    resetCode.password = newPassword;

    await this.adminRepository.save(resetCode);

    // Delete the used reset code from the database
    // await this.passwordResetCodeRepository.delete(resetCode.id);
  }
}
