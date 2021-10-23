import {Prisma} from '@prisma/client'

export class Doctor implements Prisma.DoctorUncheckedCreateInput{
    createdAt?: string | Date;
    crm: string;
    pacients?: Prisma.PacientUncheckedCreateNestedManyWithoutDoctorInput;
    prescription?: Prisma.PrescriptionUncheckedCreateNestedManyWithoutDoctorInput;
    id?: number;
    fullName: string;
}