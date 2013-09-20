var iphreeqc = WScript.CreateObject("IPhreeqcCOM.Object");
WScript.ConnectObject(iphreeqc, "iphreeqc_");

var year = 2012

iphreeqc.LoadDatabase("phreeqc.dat");

iphreeqc.AccumulateLine("SOLUTION 1-2");
iphreeqc.AccumulateLine("END");
iphreeqc.AccumulateLine("EQUILIBRIUM_PHASES 1");
iphreeqc.AccumulateLine("   CO2(g) -1.5 10");
iphreeqc.AccumulateLine("EQUILIBRIUM_PHASES 2");
iphreeqc.AccumulateLine("   Calcite 0   10");
iphreeqc.AccumulateLine("SELECTED_OUTPUT 1");
iphreeqc.AccumulateLine("   -reset false");
iphreeqc.AccumulateLine("USER_PUNCH");
iphreeqc.AccumulateLine("   -Heading  pH  SR(calcite)  Year");
iphreeqc.AccumulateLine("   10 PUNCH -LA(\"H+\"), SR(\"calcite\")");
iphreeqc.AccumulateLine("   20 PUNCH CALLBACK(cell_no, -LA(\"H+\"), \"Year\")");
iphreeqc.AccumulateLine("END");
iphreeqc.AccumulateLine("RUN_CELLS");
iphreeqc.AccumulateLine("   -cells 1-2");
iphreeqc.AccumulateLine("END");

iphreeqc.SelectedOutputFileOn = true;

if (iphreeqc.RunAccumulated() == 0) {
    WScript.Echo("see " + iphreeqc.SelectedOutputFileName + ".");
}

WScript.DisconnectObject(iphreeqc);

iphreeqc = null

function iphreeqc_Callback(x1, x2, str, value) {
	var value = -1;
	if (str == "Year") {
		value = year;
		year = year + 1;
	}
}
