#include"graphics.h"
#include<iostream>
#include <TF1.h>
#include <TCanvas.h>
#include <TGraph.h>
#include <TAxis.h>
#include <TFrame.h>
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

void singleLineoutput(int length ,double *datax, double *datay)
{
   //Draw a simple graph
   // To see the output of this macro, click begin_html <a href="gif/graph.gif">here</a>. end_html
   //Author: Rene Brun

   TCanvas *c1 = new TCanvas("c1","A Simple Graph Example",200,10,700,500);

   c1->SetFillColor(42);
   c1->SetGrid();

   const Int_t n = length;
   Double_t x[n] ;
   Double_t y[n] ;
   for(int i = 0 ; i < length ; ++i)
   {
	   x[i] = datax[i];
	   y[i] = datay[i];
   }
   //Double_t y[n] = {5.1,7.2,7.9,9.1,10.2,14.7,14.7,14.7,14,15.7,15.9,16.6,15.9,16.7,16.2,16.5,15.5,16.2,15.5,15.1,14.9,13,14.8,15.3,14.6,14.6,14.6};//b
   //Double_t y[n] = {1.06,2.07,2.35,2.8,3.68,6.29,6.35,6.38,6.16,6.68,6.69,6.79,6.71,6.94,6.76,6.83,6.62,6.77,6.5,6.24,6.27,5.93,6.08,6.51,5.97,6.35,6.24};//c

   TGraph  *gr = new TGraph(n,x,y);
   gr->SetLineColor(2);
   gr->SetLineWidth(4);
   gr->SetMarkerColor(4);
   gr->SetMarkerStyle(21);
   gr->SetTitle("Ex??");
   gr->GetXaxis()->SetTitle("XXXXXXX");
   gr->GetYaxis()->SetTitle("XXXXXXX");
   gr->Draw("ACP");

   // TCanvas::Update() draws the frame, after which one can change it
   c1->Update();
   c1->GetFrame()->SetFillColor(21);
   c1->GetFrame()->SetBorderSize(12);
   c1->Modified();
   c1->SaveAs("Ex.C");
}
