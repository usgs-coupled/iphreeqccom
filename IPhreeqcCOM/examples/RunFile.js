var iphreeqc = new ActiveXObject("IPhreeqcCOM.Object");
if (iphreeqc.LoadDatabase("phreeqc.dat") != 0) {
    WScript.Echo(iphreeqc.GetErrorString());
    WScript.Exit(1);
}
iphreeqc.OutputFileOn = true;
if (iphreeqc.RunFile("ex19") == 0) {
    WScript.Echo("see " + iphreeqc.OutputFileName + ".");
}
