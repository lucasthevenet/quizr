/*
  Warnings:

  - You are about to drop the `Post` table. If the table is not empty, all the data it contains will be lost.

*/
-- CreateEnum
CREATE TYPE "MessageerSource" AS ENUM ('RAW', 'GITHUB');

-- DropTable
DROP TABLE "Post";

-- DropEnum
DROP TYPE "PosterSource";

-- CreateTable
CREATE TABLE "Message" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "text" TEXT NOT NULL,
    "source" "MessageerSource" NOT NULL DEFAULT E'RAW',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Message_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Message_createdAt_key" ON "Message"("createdAt");

-- CreateIndex
CREATE UNIQUE INDEX "Message_updatedAt_key" ON "Message"("updatedAt");
