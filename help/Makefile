FILES = \
	html/inline.js \
	html/mthAccumulateLine.htm \
	html/mthClearAccumulatedLines.htm \
	html/mthGetComponentList.htm \
	html/mthGetDumpString.htm \
	html/mthGetErrorString.htm \
	html/mthGetLogString.htm \
	html/mthGetOutputString.htm \
	html/mthGetSelectedOutputArray.htm \
	html/mthGetSelectedOutputString.htm \
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
	html/proDumpFileName.htm \
	html/proDumpFileOn.htm \
	html/proDumpStringOn.htm \
	html/proErrorFileName.htm \
	html/proErrorFileOn.htm \
	html/proErrorStringOn.htm \
	html/proId.htm \
	html/proLines.htm \
	html/proLogFileName.htm \
	html/proLogFileOn.htm \
	html/proLogStringOn.htm \
	html/proOutputFileName.htm \
	html/proOutputFileOn.htm \
	html/proOutputStringOn.htm \
	html/proRowCount.htm \
	html/proSelectedOutputFileName.htm \
	html/proSelectedOutputFileOn.htm \
	html/proSelectedOutputStringOn.htm \
	html/sExpCollapse.js \
	links/mthAccumulateLine_l.htm \
	links/mthClearAccumulatedLines_l.htm \
	links/mthGetComponentList_l.htm \
	links/mthGetDumpString_l.htm \
	links/mthGetErrorString_l.htm \
	links/mthGetLogString_l.htm \
	links/mthGetOutputString_l.htm \
	links/mthGetSelectedOutputArray_l.htm \
	links/mthGetSelectedOutputString_l.htm \
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
	links/proDumpFileName_l.htm \
	links/proDumpFileOn_l.htm \
	links/proDumpStringOn_l.htm \
	links/proErrorFileName_l.htm \
	links/proErrorFileOn_l.htm \
	links/proErrorStringOn_l.htm \
	links/proId_l.htm \
	links/proLines_l.htm \
	links/proLogFileName_l.htm \
	links/proLogFileOn_l.htm \
	links/proLogStringOn_l.htm \
	links/proOutputFileName_l.htm \
	links/proOutputFileOn_l.htm \
	links/proOutputStringOn_l.htm \
	links/proRowCount_l.htm \
	links/proSelectedOutputFileName_l.htm \
	links/proSelectedOutputFileOn_l.htm \
	links/proSelectedOutputStringOn_l.htm


all: IPhreeqcCOM.chm

IPhreeqcCOM.chm : IPhreeqcCOM.hhp contents.hhc $(FILES)
	@hhc IPhreeqcCOM.hhp || exit 0

view: IPhreeqcCOM.chm
	cygstart IPhreeqcCOM.chm