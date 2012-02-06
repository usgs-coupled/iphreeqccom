var iphreeqc = new ActiveXObject("IPhreeqcCOM.Object");
iphreeqc.LoadDatabase("phreeqc.dat");
iphreeqc.SelectedOutputStringOn = true;
if (iphreeqc.RunFile("ex2") == 0) {
    WScript.Echo(iphreeqc.GetSelectedOutputString());
}

