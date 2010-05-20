var iphreeqc = new ActiveXObject("IPhreeqcCOM.Object");
iphreeqc.LoadDatabase("phreeqc.dat");

var sInput = "SOLUTION 1\n";
sInput += "temp 25.0\n";
sInput += "pH   7.0\n";

iphreeqc.OutputFileOn = true;
iphreeqc.RunString(sInput);
WScript.Echo("see phreeqc.out");
