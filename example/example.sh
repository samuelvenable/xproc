#!/bin/sh
cd "${0%/*}/../"
if [ `uname -o` = "Msys" ]; then
  g++ example/example.cpp apiprocess/process.cpp -o xproc.exe -I. -std=c++17 -DNULLIFY_STDERR -Wall -static-libgcc -static-libstdc++ -static -lntdll -Wl,--subsystem,console; ./xproc.exe;
elif [ `uname` = "Darwin" ]; then
  clang++ example/example.cpp apiprocess/process.cpp -o xproc -I. -std=c++17 -DNULLIFY_STDERR -Wall -arch arm64 -arch x86_64; ./xproc;
elif [ `uname -o` = "GNU/Linux" ]; then
  if [ -f "/bin/g++" ]; then
    g++ example/example.cpp apiprocess/process.cpp -o xproc -I. -std=c++17 -DNULLIFY_STDERR -Wall -static-libgcc -static-libstdc++ -static; ./xproc;
  else
    clang++ example/example.cpp apiprocess/process.cpp -o xproc -I. -std=c++17 -DNULLIFY_STDERR -Wall; ./xproc;
  fi;
elif [ `uname` = "FreeBSD" ]; then
  clang++ example/example.cpp apiprocess/process.cpp -o xproc -I. -std=c++17 -DNULLIFY_STDERR -Wall -lelf -lkvm -lpthread -static; ./xproc;
elif [ `uname` = "DragonFly" ]; then
  g++ example/example.cpp apiprocess/process.cpp -o xproc -I. -std=c++17 -DNULLIFY_STDERR -Wall -static-libgcc -static-libstdc++ -lkvm -lpthread -static; ./xproc;
elif [ `uname` = "NetBSD" ]; then
  g++ example/example.cpp apiprocess/process.cpp -o xproc -I. -std=c++17 -DNULLIFY_STDERR -Wall -static-libgcc -static-libstdc++ -lkvm -lpthread -static; ./xproc;
elif [ `uname` = "OpenBSD" ]; then
  clang++ example/example.cpp apiprocess/process.cpp -o xproc -I. -std=c++17 -DNULLIFY_STDERR -Wall -lkvm -lpthread -static; ./xproc;
elif [ `uname` = "SunOS" ]; then
  if [ `uname -o` = "illumos" ]; then
    g++ example/example.cpp apiprocess/process.cpp -o xproc -I. -std=c++17 -DNULLIFY_STDERR -D__illumos__ -Wall -lkvm -lproc -static-libgcc; ./xproc;
  else
    g++ example/example.cpp apiprocess/process.cpp -o xproc -I. -std=c++17 -DNULLIFY_STDERR -Wall -lkvm -lproc -static-libgcc; ./xproc;
  fi;
fi;
