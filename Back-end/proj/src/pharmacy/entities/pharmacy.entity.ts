import {
  BeforeInsert,
  Column,
  Entity,
  PrimaryGeneratedColumn,
  CreateDateColumn,
  UpdateDateColumn,
  JoinTable,
  ManyToMany,
  ManyToOne,
} from 'typeorm';
import * as bcrypt from 'bcrypt';
import { Pharmacist } from './pharmacist.entity';

@Entity()
export class Pharmacy {
  @PrimaryGeneratedColumn()
  id: number;

  @Column({ nullable: false })
  name: string;

  @Column({ nullable: false, unique: true })
  license: number;

  @Column({ nullable: false, default: false })
  activeAccount: Boolean;

  @Column({ nullable: false })
  password: string;

  @Column({ nullable: false, unique: true, length: 11 })
  phone: string;

  @Column({ nullable: true })
  code: string;

  @Column({ nullable: false })
  city: string;

  @Column({ nullable: false })
  regeion: string;
  @Column({ nullable: false, unique: true })
  street: string;

  @ManyToOne((type) => Pharmacist, (Pharmacist) => Pharmacist.pharmacy)
  pharmacist: Pharmacist; // remove table roles

  @BeforeInsert()
  async hashPassword() {
    this.password = await bcrypt.hash(this.password, 10);
  }
}
