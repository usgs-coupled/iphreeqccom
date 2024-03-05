var iphreeqc = new ActiveXObject("IPhreeqcCOM.Object");
iphreeqc.LoadDatabase("phreeqc.dat");
iphreeqc.SelectedOutputFileOn = true;

if (iphreeqc.RunFile("ex2") == 0) {
    WScript.Echo("See " + iphreeqc.SelectedOutputFileName + ".");
}
