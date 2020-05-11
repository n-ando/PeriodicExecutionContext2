#
# Makefile for omniNames
#
# by Noriaki Ando <n-ando@aist.go.jp>
#
# This Makefile only supports Linux.
# Please change ARCH variable for the target architecture.
#

ARCH = __x86_64__
# ARCH = __arm__
CXX_CPPFLAGS   = -c -O2 -Wall -Wno-unused -fexceptions -I.
CORBA_CPPFLAGS = -D__OMNIORB4__ -D_REENTRANT -D__OSVERSION__=2 -D__linux__ -D$(ARCH) 
CPPFLAGS       = `rtm-config --cflags`

CXXSRCS = PeriodicExecutionContext2.cpp
LIBS = `rtm-config --libs`
OBJS = $(CXXSRCS:.cpp=.o)

all: PeriodicExecutionContext2.so

clean:
	rm -f *.o *.a *.d *.so *~

#install:
#	mv -f /usr/bin/omniNames /usr/bin/omniNames.org
#	install omniNames /usr/bin

$(OBJ):
	$(CXX) $(CPPFLAGS)

PeriodicExecutionContext2.so: $(OBJS)
	$(CXX) -o $@ -O2 -Wall -fexceptions --shared $(LIBS) $(OBJS) 
