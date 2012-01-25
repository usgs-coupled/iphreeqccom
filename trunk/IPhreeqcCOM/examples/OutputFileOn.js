var iphreeqc = new ActiveXObject("IPhreeqcCOM.Object");
iphreeqc.LoadDatabase("phreeqc.dat");
iphreeqc.OutputFileOn = true;
iphreeqc.RunFile("ex2");
WScript.Echo("see phreeqc.out");
