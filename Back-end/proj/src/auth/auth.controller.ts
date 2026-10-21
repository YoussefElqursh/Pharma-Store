import {
  Controller,
  Request,
  UseGuards,
  Post,
  Body,
  Get,
} from '@nestjs/common';
import { LocalAuthGaurd } from './guards/local-authguard';
import { AuthService } from './auth.service';
import { creatAdminDto, updateAdminDto } from 'src/admin/dto/creatAdminDto';
import { AdminService } from 'src/admin/admin.service';
import { AuthGuard } from '@nestjs/passport';
import { RefreshJwtAuthGaurd } from './guards/refresh-jwt-authguard';
import { registerDto } from './dto/register.dto';
import { JwtAuthGaurd } from './guards/jwt-authguard';
import { AbilityGuard } from './guards/ability.guard';
import { CheckAbility } from './decorators/authorize.decorator';
import { Admin } from 'src/admin/entities/admin.entity';
import { Action } from 'src/apility/abiliti-factory/abiliti-factory';

@Controller('auth')
export class AuthController {
  constructor(private readonly AuthService: AuthService) {}
  @Post('register')
  async register(@Body() user: any) {
    return await this.AuthService.register(user);
  }

  @UseGuards(LocalAuthGaurd)
  @Post('login')
  async login(@Request() req, @Body('userType') type: string) {
    return await this.AuthService.login(req.user, type);
  }

  @UseGuards(RefreshJwtAuthGaurd)
  @Get('refreshToken') // ->>>>>>>table
  async refreshToken(@Request() req) {
    return await this.AuthService.refreshToken(req.user);
  }

  @UseGuards(JwtAuthGaurd, AbilityGuard)
  @CheckAbility({ action: Action.accessOredrStatus, subject: Admin })
  @Get('delete')
  async get(@Request() req) {
    return 'delete user';
  }

  // @Post('forget-password')
  // async forgetPassword(@Body('email') email: string) {
  //   const token = Math.random().toString(20).substring(2, 12);
  //   return await this.AuthService.forgetPassword(email, token);
  // }

  // @Post('reset-password')
  // async resetPassword(@Body() body: any) {
  //   return await this.AuthService.resetPassword(body);
  // }

  @Post('forget-password')
  async forgetPassword(@Body() body: { phone: string }): Promise<void> {
    await this.AuthService.sendPasswordResetCode(body.phone);
    // Optionally, return a success response or a message indicating that the code has been sent
  }

  @Post('reset-password')
  async resetPassword(
    @Body() body: { phoneNumber: string; code: string; newPassword: string },
  ): Promise<string> {
    try {
      await this.AuthService.resetPassword(
        body.phoneNumber,
        body.code,
        body.newPassword,
      );
      return 'success';
    } catch (error) {
      return 'error';
    }
  }
}
