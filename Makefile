# $Id: Makefile 1452 2006-11-04 04:18:32Z charlton $

PHREEQCCOM_DLL := Release/PhreeqcCOM.dll

all : $(PHREEQCCOM_DLL)

$(PHREEQCCOM_DLL) : $(SLN)
	MsBuild.exe PhreeqcCOM.sln /t:PhreeqcCOM /p:Configuration=Release
