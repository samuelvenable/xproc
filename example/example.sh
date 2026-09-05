#!/bin/sh
cd "${0%/*}/../";
if [ "$OS" = "Windows_NT" ]; then
  g++ example/example.cpp apiprocess/process.cpp -o xproc.exe -I. -std=c++17 -DNULLIFY_STDERR -static-libgcc -static-libstdc++ -static -lntdll -Wl,--subsystem,console; ./xproc.exe;
elif [ `uname -s` = "Darwin" ]; then
  clang++ example/example.cpp apiprocess/process.cpp -o xproc -I. -std=c++17 -DNULLIFY_STDERR -mmacos-version-min=10.13 -arch arm64 -arch x86_64; ./xproc;
elif [ `uname -s` = "Linux" ]; then
  if [ -f "/bin/g++" ]; then
    g++ example/example.cpp apiprocess/process.cpp -o xproc -I. -std=c++17 -DNULLIFY_STDERR -static-libgcc -static-libstdc++ -static; ./xproc;
  else
    clang++ example/example.cpp apiprocess/process.cpp -o xproc -I. -std=c++17 -DNULLIFY_STDERR; ./xproc;
  fi;
elif [ `uname -s` = "FreeBSD" ]; then
  clang++ example/example.cpp apiprocess/process.cpp -o xproc -I. -std=c++17 -DNULLIFY_STDERR -lelf -lkvm -lpthread -static; ./xproc;
elif [ `uname -s` = "DragonFly" ]; then
  g++ example/example.cpp apiprocess/process.cpp -o xproc -I. -std=c++17 -DNULLIFY_STDERR -static-libgcc -lkvm -lpthread -static; ./xproc;
elif [ `uname -s` = "NetBSD" ]; then
  g++ example/example.cpp apiprocess/process.cpp -o xproc -I. -std=c++17 -DNULLIFY_STDERR -static-libgcc -static-libstdc++ -lkvm -lpthread -static; ./xproc;
elif [ `uname -s` = "OpenBSD" ]; then
  clang++ example/example.cpp apiprocess/process.cpp -o xproc -I. -std=c++17 -DNULLIFY_STDERR -lkvm -lpthread -static; ./xproc;
elif [ `uname -s` = "SunOS" ]; then
  if [ `uname -o` = "illumos" ]; then
    g++ example/example.cpp apiprocess/process.cpp -o xproc -I. -std=c++17 -DNULLIFY_STDERR -D__illumos__ -static-libgcc -lkvm -lproc; ./xproc;
  else
    g++ example/example.cpp apiprocess/process.cpp -o xproc -I. -std=c++17 -DNULLIFY_STDERR -static-libgcc -lkvm -lproc; ./xproc;
  fi;
fi;
