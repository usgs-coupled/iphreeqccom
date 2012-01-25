var iphreeqc = new ActiveXObject("IPhreeqcCOM.Object");
iphreeqc.AccumulateLine("SOLUTION 1");
iphreeqc.AccumulateLine("END");
WScript.Echo("The accumulated input is:\n" + iphreeqc.Lines);
iphreeqc.ClearAccumulatedLines();
WScript.Echo("The accumulated input now is:\n" + iphreeqc.Lines);
