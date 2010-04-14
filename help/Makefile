FILES = \
	links/ofvbareuse.txt \
	html/inline.js \
	html/sExpCollapse.js \
	html/objIPhreeqc.htm \
	links/objIPhreeqc_l.htm \
	html/mthLoadDatabase.htm \
	links/mthLoadDatabase_l.htm \
	html/proOutputOn.htm \
	links/proOutputOn_l.htm \
	html/proErrorOn.htm \
	links/proErrorOn_l.htm \
	html/proLogOn.htm \
	links/proLogOn_l.htm \
	html/mthRunFile.htm \
	links/mthRunFile_l.htm \
	html/mthRunAccumulated.htm \
	links/mthRunAccumulated_l.htm \
	html/proSelectedOutputOn.htm \
	links/proSelectedOutputOn_l.htm \
	html/mthRunString.htm \
	links/mthRunString_l.htm \
	html/mthAccumulateLine.htm \
	links/mthAccumulateLine_l.htm \
	html/proColumnCount.htm \
	links/proColumnCount_l.htm \
	html/proRowCount.htm \
	links/proRowCount_l.htm \
	html/proLines.htm \
	links/proLines_l.htm \
	html/mthLoadDatabaseString.htm \
	links/mthLoadDatabaseString_l.htm \
	html/mthGetLastErrorString.htm \
	links/mthGetLastErrorString_l.htm \
	html/mthGetSelectedOutputArray.htm \
	links/mthGetSelectedOutputArray_l.htm \
	html/mthGetSelectedOutputValue.htm \
	links/mthGetSelectedOutputValue_l.htm \
	html/proDumpOn.htm \
	links/proDumpOn_l.htm


all: IPhreeqcCOM.chm

IPhreeqcCOM.chm : IPhreeqcCOM.hhp contents.hhc $(FILES)
	@hhc IPhreeqcCOM.hhp || exit 0
