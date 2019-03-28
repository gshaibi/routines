#!/bin/bash

cat > $1.cpp <<FIN
#include <iostream>

using namespace std;

struct Demo
{
	
};

void foo()
{
		
}

int main() 
{
	foo();
	return 0;
}
FIN
code $1.cpp
