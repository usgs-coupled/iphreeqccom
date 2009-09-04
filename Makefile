# $Id: Makefile 1452 2006-11-04 04:18:32Z charlton $

DEVENV := $(shell cygpath "$(PROGRAMFILES)/Microsoft Visual Studio 8/Common7/IDE/devenv")

SLN := PhreeqcCOM.sln

CSCRIPT = cscript

PHREEQCCOM_DLL := Release/PhreeqcCOM.dll

all : $(PHREEQCCOM_DLL)

$(PHREEQCCOM_DLL) : $(SLN)
	@rm -f Release.log
	"$(DEVENV)" /out Release.log /build Release $(SLN)
	@cat Release.log
