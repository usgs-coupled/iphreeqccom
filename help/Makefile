FILES = \
	html/inline.js \
	html/mthAccumulateLine.htm \
	html/mthGetComponentList.htm \
	html/mthGetDumpString.htm \
	html/mthGetErrorString.htm \
	html/mthGetSelectedOutputArray.htm \
	html/mthGetSelectedOutputColumnCount.htm \
	html/mthGetSelectedOutputRowCount.htm \
	html/mthGetSelectedOutputValue.htm \
	html/mthGetWarningString.htm \
	html/mthLoadDatabase.htm \
	html/mthLoadDatabaseString.htm \
	html/mthRunAccumulated.htm \
	html/mthRunFile.htm \
	html/mthRunString.htm \
	html/objIPhreeqc.htm \
	html/office10.css \
	html/ofvbanl.js \
	html/proColumnCount.htm \
	html/proDumpFileOn.htm \
	html/proDumpStringOn.htm \
	html/proErrorFileOn.htm \
	html/proLines.htm \
	html/proLogFileOn.htm \
	html/proOutputFileOn.htm \
	html/proRowCount.htm \
	html/proSelectedOutputFileOn.htm \
	html/sExpCollapse.js \
	links/mthAccumulateLine_l.htm \
	links/mthGetComponentList_l.htm \
	links/mthGetDumpString_l.htm \
	links/mthGetErrorString_l.htm \
	links/mthGetSelectedOutputArray_l.htm \
	links/mthGetSelectedOutputValue_l.htm \
	links/mthGetWarningString_l.htm \
	links/mthLoadDatabaseString_l.htm \
	links/mthLoadDatabase_l.htm \
	links/mthRunAccumulated_l.htm \
	links/mthRunFile_l.htm \
	links/mthRunString_l.htm \
	links/objIPhreeqc_l.htm \
	links/ofvbanli.js \
	links/ofvbareuse.txt \
	links/proColumnCount_l.htm \
	links/proDumpFileOn_l.htm \
	links/proDumpStringOn_l.htm \
	links/proErrorFileOn_l.htm \
	links/proLines_l.htm \
	links/proLogFileOn_l.htm \
	links/proOutputFileOn_l.htm \
	links/proRowCount_l.htm \
	links/proSelectedOutputFileOn_l.htm


all: IPhreeqcCOM.chm

IPhreeqcCOM.chm : IPhreeqcCOM.hhp contents.hhc $(FILES)
	@hhc IPhreeqcCOM.hhp || exit 0

view: IPhreeqcCOM.chm
	cygstart IPhreeqcCOM.chm