var iphreeqc = new ActiveXObject("IPhreeqcCOM.Object");
iphreeqc.LoadDatabase("phreeqc.dat");

// turn logging on
iphreeqc.AccumulateLine("KNOBS; -logfile true");
iphreeqc.RunAccumulated();

iphreeqc.LogFileOn = true;
iphreeqc.RunFile("ex2");
WScript.Echo("see " + iphreeqc.LogFileName);
