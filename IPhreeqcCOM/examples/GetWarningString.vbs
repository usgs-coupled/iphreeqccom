Dim iphreeqc
Set iphreeqc = CreateObject("IPhreeqcCOM.Object")
iphreeqc.LoadDatabase("phreeqc.dat")
iphreeqc.AccumulateLine("DATABASE wateq4f.dat")
iphreeqc.AccumulateLine("SOLUTION 1")
iphreeqc.RunAccumulated()
If (Len(iphreeqc.GetWarningString()) <> 0) Then
    WScript.Echo(iphreeqc.GetWarningString())
End If
