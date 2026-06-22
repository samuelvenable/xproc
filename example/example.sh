#!/bin/sh
# Some platforms do not accept the -o flag for uname; any warnings printed to the terminal concerning this can be safely ignored...
cd "${0%/*}/../";
if [ `uname -o` = "Msys" ]; then
  g++ example/example.cpp apiprocess/process.cpp -o xproc.exe -I. -std=c++17 -DNULLIFY_STDERR -Wall -static-libgcc -static-libstdc++ -static -lntdll -Wl,--subsystem,console; ./xproc.exe;
elif [ `uname` = "Darwin" ]; then
  clang++ example/example.cpp apiprocess/process.cpp -o xproc -I. -std=c++17 -DNULLIFY_STDERR -Wall -mmacos-version-min=10.13 -arch arm64 -arch x86_64; ./xproc;
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
    g++ example/example.cpp apiprocess/process.cpp -o xproc -I. -std=c++17 -DNULLIFY_STDERR -D__illumos__ -Wall -static-libgcc -lkvm -lproc; ./xproc;
  else
    g++ example/example.cpp apiprocess/process.cpp -o xproc -I. -std=c++17 -DNULLIFY_STDERR -Wall -static-libgcc -lkvm -lproc; ./xproc;
  fi;
fi;
