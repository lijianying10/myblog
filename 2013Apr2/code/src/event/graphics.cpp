#include"graphics.h"
#include<iostream>
#include <TF1.h>
#include <TCanvas.h>
using namespace std;
void  testGraphics()
{
	cout<<"hello"<<endl;
	TF1 f1("func1","sin(x)/x",0,10);
	TCanvas *c1 = new TCanvas("c1","c1",800,1000);
	c1->Divide(1,2);
	c1->cd(1);
	f1.Draw();
	c1->SaveAs("test.eps");
}
