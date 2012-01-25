Dim iphreeqc
Set iphreeqc = CreateObject("IPhreeqcCOM.Object")
iphreeqc.LoadDatabase("phreeqc.dat")
iphreeqc.OutputFileOn = True
iphreeqc.RunFile("ex2")
WScript.Echo("see phreeqc.out")
