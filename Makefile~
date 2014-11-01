PHONY: all

### editar estos macros para el cross-compile ### CXX="g++    "
CROSS_COMPILE	= arm-poky-linux-gnueabi-
INCPATH		= -I/usr/include/opencv
#INCPATH		= -I/usr/local/include/opencv
SYSROOTFLAGS	= --sysroot=/home/fabian/Yocto/poky-dora-10.0.0/rpi-build/tmp/sysroots/raspberrypi
###           fin de la edicion               ###

APP		= main
CXX		= $(CROSS_COMPILE)g++

SRC=$(APP).cpp
OBJ=$(APP).o
BIN=$(APP)

CXXFLAGS	= -c -pipe -O2 -Wall -W  -march=armv6 -mthumb-interwork -mfloat-abi=softfp -o 
#CXXFLAGS	= -c -pipe -O2 -Wall -W -o 
LFLAGS		= -Wl,-O1 -o 

OPENCVFLAGS 	= -lopencv_core -lopencv_highgui -lopencv_imgproc

all:
		$(CXX) $(SYSROOTFLAGS) $(CXXFLAGS) $(OBJ) $(SRC)
		$(CXX) $(LFLAGS) $(APP) $(OBJ) $(INCPATH) $(OPENCVFLAGS)

