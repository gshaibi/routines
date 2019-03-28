#!/bin/bash

mkdir $1
cd $1

cat > $1.cpp <<END
#include <iostream>
#include <cassert>

#include "routines.hpp"
#include "$1.hpp"

END

cat > $1_test.cpp <<END 
#include "$1.hpp"
#include "unit_test.hpp"

TestResult Overall()
{
  
  return SUCCESS;
}

int main()
{
  RUNTEST(Overall);
  return 0;
}
END

cat > Makefile <<END
CC=g++
CPPFLAGS=-I\$(INCS) -ansi -std=c++98 -pedantic-errors -Wall -Wextra -O0 -g3
INCS=../include/
TARGETS=$1 $1_test
OBJS=\$(patsubst %, %.o, \$(TARGETS))
SHLIBS=-lpthread

a.out: \$(OBJS)
	\$(CC) \$(CPPFLAGS) $^ \$(SHLIBS)
	-rm *.o *.gch

clean:
	-rm *.o *.out *.so

.PHONY: clean 

END

cat > $1.hpp <<END
#ifndef $1_hpp
#define $1_hpp



#endif // $1_hpp
END

git add $1* Makefile
git commit -m "$1 initial"
