var iphreeqc = new ActiveXObject("IPhreeqcCOM.Object");
iphreeqc.LoadDatabase("phreeqc.dat");
iphreeqc.RunFile("ex2");
WScript.Echo("The current selected-output array contains " +
    iphreeqc.ColumnCount + " columns.");
