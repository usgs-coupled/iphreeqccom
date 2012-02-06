var iphreeqc = new ActiveXObject("IPhreeqcCOM.Object");
iphreeqc.LoadDatabase("phreeqc.dat");
iphreeqc.DumpFileOn = true;

var input = new String("");
input += "SOLUTION 1 Pure water     \n";
input += "EQUILIBRIUM_PHASES 1      \n";
input += "    Calcite 0 10          \n";
input += "SAVE solution 1           \n";
input += "SAVE equilibrium_phases 1 \n";
input += "DUMP                      \n";
input += "    -solution 1           \n";
input += "    -equilibrium_phases  1\n";

if (iphreeqc.RunString(input) != 0) {
    WScript.Echo(iphreeqc.GetErrorString());
}
WScript.Echo("see " + iphreeqc.DumpFileName + ".");
