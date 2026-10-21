import { PartialType } from '@nestjs/mapped-types';
import { IsEmail, IsNumber, IsNumberString, IsString } from 'class-validator';

export class creatPharmacyDto {
  @IsString()
  name: string;

  @IsString()
  password: string;

  @IsNumberString()
  phone: string;

  @IsNumber()
  license: number;

  @IsString()
  city: string;

  @IsString()
  regeion: string;
  @IsString()
  street: string;

  @IsString()
  pharmacistFName: string;
  @IsString()
  pharmacistLName: string;
  @IsString()
  pharmacistPhone: string;

  @IsString()
  pharmacistEmail: string;
}

export class updatePharmacyDto extends PartialType(creatPharmacyDto) {}
