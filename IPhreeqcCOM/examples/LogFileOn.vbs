Dim iphreeqc
Set iphreeqc = CreateObject("IPhreeqcCOM.Object")
iphreeqc.LoadDatabase("phreeqc.dat")

' turn logging on
iphreeqc.AccumulateLine("KNOBS; -logfile true")
iphreeqc.RunAccumulated()

iphreeqc.LogFileOn = True
iphreeqc.RunFile("ex2")
WScript.Echo("see phreeqc.log")
