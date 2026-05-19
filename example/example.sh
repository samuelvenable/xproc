#!/bin/sh
cd "${0%/*}"
if [ $(uname) = "Darwin" ]; then
  clang++ example.cpp ../process.cpp -o ../xproc -std=c++17 -DNULLIFY_STDERR -Wall -arch arm64 -arch x86_64; ../xproc;
elif [ $(uname) = "Linux" ]; then
  if [ -f "/bin/g++" ]; then
    g++ example.cpp ../process.cpp -o ../xproc -std=c++17 -DNULLIFY_STDERR -Wall -static-libgcc -static-libstdc++ -static; ../xproc;
  else
    clang++ example.cpp ../process.cpp -o ../xproc -std=c++17 -DNULLIFY_STDERR -Wall; ../xproc;
  fi
elif [ $(uname) = "FreeBSD" ]; then
  clang++ example.cpp ../process.cpp -o ../xproc -std=c++17 -DNULLIFY_STDERR -Wall -lelf -lkvm -lpthread -static; ../xproc;
elif [ $(uname) = "DragonFly" ]; then
  g++ example.cpp ../process.cpp -o ../xproc -std=c++17 -DNULLIFY_STDERR -Wall -static-libgcc -static-libstdc++ -lkvm -lpthread -static; ../xproc;
elif [ $(uname) = "NetBSD" ]; then
  g++ example.cpp ../process.cpp -o ../xproc -std=c++17 -DNULLIFY_STDERR -Wall -static-libgcc -static-libstdc++ -lkvm -lpthread -static; ../xproc;
elif [ $(uname) = "OpenBSD" ]; then
  clang++ example.cpp ../process.cpp -o ../xproc -std=c++17 -DNULLIFY_STDERR -Wall -lkvm -lpthread -static; ../xproc;
elif [ $(uname) = "SunOS" ]; then
  if [ $(uname -o) = "illumos" ]; then
    export SOLARIS=0;
  else
    export SOLARIS=1;
  fi
  if [ $SOLARIS = 0 ]; then 
    c++ example.cpp ../process.cpp -o ../xproc -std=c++17 -DNULLIFY_STDERR -D__illumos__ -Wall -lkvm -lproc; ../xproc;
  else
    c++ example.cpp ../process.cpp -o ../xproc -std=c++17 -DNULLIFY_STDERR -Wall -lkvm -lproc; ../xproc;
  fi
else
  g++ example.cpp ../process.cpp -o ../xproc.exe -std=c++17 -DNULLIFY_STDERR -Wall -static-libgcc -static-libstdc++ -static -lntdll -Wl,--subsystem,console; ../xproc.exe;
fi
