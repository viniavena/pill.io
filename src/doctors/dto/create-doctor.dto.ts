import { Doctor } from '../entities/doctor.entity';

import {IsString} from 'class-validator'
export class CreateDoctorDto extends Doctor {

    @IsString()
    fullName: string;

    @IsString()
    
    crm: string;
}