import { IsEmail, IsNumberString, IsString } from 'class-validator';

export class registerDto {
  @IsString()
  name: string;
  @IsEmail()
  email: string;
  @IsString()
  password: string;

  @IsNumberString()
  phone: string;

  @IsString()
  userType: string;
}
