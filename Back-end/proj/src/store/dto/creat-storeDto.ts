import { PartialType } from '@nestjs/mapped-types';
import { IsNumber, IsNumberString, IsString } from 'class-validator';

export class creatStoreDto {
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
  companyName?: string;
}

export class updateStoreDto extends PartialType(creatStoreDto) {}
