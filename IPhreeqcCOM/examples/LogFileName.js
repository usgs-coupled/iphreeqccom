var iphreeqc = new ActiveXObject("IPhreeqcCOM.Object");
iphreeqc.LoadDatabase("phreeqc.dat");
iphreeqc.LogFileOn = true;

var input = new String("");
input += "SOLUTION 1 Pure water     \n";
input += "EQUILIBRIUM_PHASES 1      \n";
input += "    Calcite 0 10          \n";
input += "KNOBS                     \n";
input += "    -logfile TRUE         \n";

if (iphreeqc.RunString(input) == 0) {
    WScript.Echo("See " + iphreeqc.LogFileName + ".");
}
