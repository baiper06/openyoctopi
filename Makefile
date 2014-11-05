PHONY: all

### Macros correspondiente a los macros para compilar en el raspberry pi
CROSS_COMPILE	= arm-poky-linux-gnueabi-
INCPATH		= -I/usr/include/opencv
SYSROOTFLAGS	= --sysroot=/home/fabian/Yocto/poky-dora-10.0.0/rpi-build/tmp/sysroots/raspberrypi

APP		= main
CXX		= $(CROSS_COMPILE)g++

SRC=$(APP).cpp
OBJ=$(APP).o
BIN=$(APP)

CXXFLAGS	= -c -pipe -O2 -Wall -W  -march=armv6 -mthumb-interwork -mfloat-abi=softfp -o 
LFLAGS		= -Wl,-O1 -o 

### Macros correspondiente a los macros para compilar en la pc

CXX_PC		= g++

CXXFLAGS_PC	= -c -pipe -O2 -Wall -W -o

### Flags correspondientes a las bibliotecas de opencv

OPENCVFLAGS 	= -lopencv_core -lopencv_highgui -lopencv_imgproc

pc:
		$(CXX_PC) $(CXXFLAGS_PC) $(OBJ) $(SRC)
		$(CXX_PC) $(LFLAGS) $(APP) $(OBJ) $(INCPATH) $(OPENCVFLAGSuo)

embedded:
		$(CXX) $(SYSROOTFLAGS) $(CXXFLAGS) $(OBJ) $(SRC)
		$(CXX) $(LFLAGS) $(APP) $(OBJ) $(INCPATH) $(OPENCVFLAGS)

