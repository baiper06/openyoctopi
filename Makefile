PHONY: all

### editar estos macros para el cross-compile ###
CROSS_COMPILE	=#i586-poky-linux-
INCPATH		= -I/usr/local/include/opencv
###           fin de la edicion               ###

APP		= main
CXX		= $(CROSS_COMPILE)g++

SRC=$(APP).cpp
OBJ=$(APP).o
BIN=$(APP)

CXXFLAGS	= -c -pipe -O2 -Wall -W -o 
LFLAGS		= -Wl,-O1 -o 
OPENCVFLAGS 	= -lopencv_core -lopencv_highgui -lopencv_imgproc

all:
		$(CXX) $(CXXFLAGS) $(OBJ) $(SRC)
		$(CXX) $(LFLAGS) $(APP) $(OBJ) $(INCPATH) $(OPENCVFLAGS)

