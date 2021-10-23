import { Injectable } from '@nestjs/common';
import { PrismaService } from 'src/prisma/prisma.service';
import { CreateDoctorDto } from './dto/create-doctor.dto';
import { UpdateDoctorDto } from './dto/update-doctor.dto';


@Injectable()
export class DoctorsService {

  constructor(private readonly prisma: PrismaService){}

  create(createDoctorDto: CreateDoctorDto) {
    return this.prisma.doctor.create({data:createDoctorDto});
  }

  findAll() {
    return this.prisma.doctor.findMany();
  }

  findOne(id: number) {
    return this.prisma.doctor.findUnique({where: {id}})
  }

  update(id: number, updateDoctorDto: UpdateDoctorDto) {
    return this.prisma.doctor.update({where: {id}, data:updateDoctorDto});
  }

  remove(id: number) {
    return this.prisma.doctor.delete({where: {id}});
  }
}
