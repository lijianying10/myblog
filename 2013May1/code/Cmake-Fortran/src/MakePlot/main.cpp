#include <iostream>
#include <fstream>
#include <vector>
#include <stdlib.h>
#include <graphics.h>

int main(int argc,char ** args)
{

	//std::vector<std::string> StringData;
	double *datas;
	std::string tempdata;

	//output parameters
	std::cout<<"input argument numbers:"<<argc<<std::endl;
	if(argc != 2)
	{
		std::cout<<"Wrong argument use : makeplot.exe <filename>"<<std::endl;
	}
	std::cout<<"file name:"<<args[1]<<std::endl;

	//file open
	std::ifstream FILE;
	FILE.open(args[1]);
	if(!FILE)
	{
		std::cout<<"File not exist"<<std::endl;
	}
	else
	{
		std::cout<<"File open success"<<std::endl;
	}

	//start readfile
	double data;
	int dataLength;

	//get datalength
	FILE>>data;
	FILE>>dataLength;
	FILE>>data;
	FILE>>data;
	getline(FILE,tempdata);//read string from file

	//malloc data
	datas = new double[dataLength];

	for(int i = 0 ; i < dataLength ; ++i)
	{
		getline(FILE,tempdata);//read string from file
		datas[i] = atof(tempdata.c_str());//convert it to doubele
	}

	for(int i = 0 ; i < dataLength ; ++i)
	{
		std::cout<<datas[i]<<std::endl;
	}
	double *datax = new double[dataLength];
	for(int i = 0 ; i < dataLength ; ++i)
	{
		datax[i] = i;
	}

	singleLineoutput(dataLength,datax,datas);

	FILE.close();
}
