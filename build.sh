#!/bin/bash

v=3.1.0
p=wxWidgets-${v}.tar.bz2

URL="https://github.com/wxWidgets/wxWidgets/releases/download/v${v}/${p}"

wget $URL \
  && tar -xvjf ${p} \
  && cd wxWidgets-${v} \
  && mkdir build_w64 \
  && cd build_w64 && \
  ../configure \
    --prefix=/usr/x86_64-w64-mingw32/ \
    --host=x86_64-w64-mingw32  \
    --build=x86_64-linux \
    --disable-unicode \
    --enable-monolithic \
    --disable-shared \
    CFLAGS=-m64 CXXFLAGS=-m64 LDFLAGS=-m64 \
  && make

exit 0
