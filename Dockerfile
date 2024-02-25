FROM ubuntu:22.04

RUN apt update && apt install -y make clang llvm

WORKDIR /build
ADD elk.c .
ADD elk.h .
ADD main.cpp .
ADD Makefile .

RUN make 