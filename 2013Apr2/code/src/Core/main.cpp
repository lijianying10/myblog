#include <iostream>
#include <lib1.h>
#include <graphics.h>
#include <FFT.h>
using namespace std;
int main()
{
	testGraphics();
	cout<<add(5,9)<<endl;
	#ifdef DEBUG
	cout<<"this is debug mode output"<<endl;
	#endif
	FFT();
}
