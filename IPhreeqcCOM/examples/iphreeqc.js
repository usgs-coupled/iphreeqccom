var iphreeqc = new ActiveXObject("IPhreeqcCOM.Object");
iphreeqc.LoadDatabase("phreeqc.dat");
iphreeqc.OutputFileOn = true;
if (iphreeqc.RunFile("ex1") == 0) {
    WScript.Echo("see " + iphreeqc.OutputFileName + ".");
}