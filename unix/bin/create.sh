#!/bin/bash

mkdir $1
cd $1

cat > $1.c <<END
#include <stdlib.h> /* malloc, free */
#include <string.h> /* memset */
#include <assert.h>
#include <stdio.h>

#include "debug.h"
#include "$1.h"

END

cat > $1_test.c <<END 
#include "$1.h"
#include "unit_test.h"

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
GC=gcc
CFLAGS=-I\$(INCS) -ansi -pedantic-errors -Wall -Wextra -DNDEBUG -O0 -g3
INCS=../include/
TARGETS=$1 $1_test
OBJS=\$(patsubst %, %.o, \$(TARGETS))
SHLIBS=-lpthread

a.out: \$(OBJS)
	\$(GC) \$(CFLAGS) $^ \$(SHLIBS)

clean:
	-rm *.o *.out *.so

.PHONY: clean 

END

cat > $1.h <<END
#ifndef $1
#define $1



#endif
END

git add $1* Makefile
git commit -m "$1 initial"
