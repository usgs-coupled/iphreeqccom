Dim iphreeqc, sInput
Set iphreeqc = CreateObject("IPhreeqcCOM.Object")
iphreeqc.LoadDatabase("phreeqc.dat")

sInput = "SOLUTION 1" & vbNewLine
sInput = sInput & "temp 25.0" & vbNewLine
sInput = sInput & "pH   7.0" & vbNewLine

iphreeqc.OutputFileOn = True
iphreeqc.RunString(sInput)
WScript.Echo("see phreeqc.out")
