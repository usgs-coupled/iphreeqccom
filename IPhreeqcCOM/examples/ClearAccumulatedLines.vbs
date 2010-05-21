Dim iphreeqc
Set iphreeqc = CreateObject("IPhreeqcCOM.Object")
iphreeqc.AccumulateLine("SOLUTION 1")
iphreeqc.AccumulateLine("END")
WScript.Echo("The accumulated input is:" & vbNewLine & iphreeqc.Lines)
iphreeqc.ClearAccumulatedLines()
WScript.Echo("The accumulated input is:" & vbNewLine & iphreeqc.Lines)
