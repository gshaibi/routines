#!/bin/bash

g++ -std=c++98 -pedantic-errors -Wall -Wextra -ansi -O0 -g3 $1 -o $1.out
./$1.out
