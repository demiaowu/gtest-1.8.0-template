CXXFLAGS =	-O2 -g -Wall -fmessage-length=0 -pthread

GTEST_DIR = ./gtest-1.8.0/googletest

OBJS =

USER_DIR = ./src

TESTS = sample1_unittest

LDFLAGS += -L$(GTEST_DIR)/libs

LIBS += -lpthread -lgtest_main

GTEST_INCLUDE = -I$(GTEST_DIR)/include/

TARGET = $(TESTS)

CPPFLAGS += $(GTEST_INCLUDE)
CPPFLAGS += -I./src
CPPFLAGS += -I./test

vpath %.h src:test
vpath %.hpp src:test
	
vpath %.cpp src:test		
vpath %.cc src:test
		
.PHONY: clean all

all:	$(TARGET) clean

#$(TEST):	$(OBJS)
#	$(CXX) -o $(TARGET)  $(LIBS) $(LDFLAGS) 

#sample1.o : sample1.cc sample1.h
#	$(CXX) $(CPPFLAGS) $(CXXFLAGS) -c $(USER_DIR)/sample1.cc

#sample1_unittest.o : sample1_unittest.cc sample1.h
#	$(CXX) $(CPPFLAGS) $(CXXFLAGS) -c $(USER_DIR)/sample1_unittest.cc

sample1_unittest : sample1.o sample1_unittest.o
	$(CXX) $(CPPFLAGS) $(CXXFLAGS) $(LIBS) $(LDFLAGS)  $^ -o $@ 


clean: 
	-rm -f *.o

cleanall:
	rm -f $(TESTS)
	
