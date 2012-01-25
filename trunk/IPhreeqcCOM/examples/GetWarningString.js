var iphreeqc = new ActiveXObject("IPhreeqcCOM.Object");
iphreeqc.LoadDatabase("phreeqc.dat");
iphreeqc.AccumulateLine("DATABASE wateq4f.dat");
iphreeqc.AccumulateLine("SOLUTION 1");
iphreeqc.RunAccumulated();
if (iphreeqc.GetWarningString().length != 0) {
    WScript.Echo(iphreeqc.GetWarningString());
}
