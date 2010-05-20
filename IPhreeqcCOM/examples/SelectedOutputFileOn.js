var iphreeqc = new ActiveXObject("IPhreeqcCOM.Object");
iphreeqc.LoadDatabase("phreeqc.dat");
iphreeqc.SelectedOutputFileOn = true;
iphreeqc.RunFile("ex2");
WScript.Echo("see ex2.sel");
