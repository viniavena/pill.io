-- CreateTable
CREATE TABLE "Doctor" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "fullName" TEXT NOT NULL,
    "crm" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Pacient" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "fullName" TEXT NOT NULL,
    "cpf" TEXT NOT NULL,
    "doctorId" INTEGER NOT NULL,
    CONSTRAINT "Pacient_doctorId_fkey" FOREIGN KEY ("doctorId") REFERENCES "Doctor" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Prescription" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL,
    "doctorId" INTEGER NOT NULL,
    "pacientId" INTEGER NOT NULL,
    CONSTRAINT "Prescription_doctorId_fkey" FOREIGN KEY ("doctorId") REFERENCES "Doctor" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Prescription_pacientId_fkey" FOREIGN KEY ("pacientId") REFERENCES "Pacient" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Pill" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "dosage" TEXT NOT NULL,
    "quantity" TEXT NOT NULL,
    "frequency" INTEGER NOT NULL,
    "obs" TEXT,
    "prescriptionId" INTEGER NOT NULL,
    CONSTRAINT "Pill_prescriptionId_fkey" FOREIGN KEY ("prescriptionId") REFERENCES "Prescription" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateIndex
CREATE UNIQUE INDEX "Doctor_crm_key" ON "Doctor"("crm");

-- CreateIndex
CREATE UNIQUE INDEX "Pacient_cpf_key" ON "Pacient"("cpf");
