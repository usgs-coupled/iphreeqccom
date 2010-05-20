Dim iphreeqc, comp, comps, str
Set iphreeqc = CreateObject("IPhreeqcCOM.Object")
iphreeqc.LoadDatabase("phreeqc.dat")
iphreeqc.RunFile("ex2")
str = "components:" & vbNewLine
comps = iphreeqc.GetComponentList()
For Each comp in comps
    str = str & comp & vbNewLine
Next
WScript.Echo(str)

