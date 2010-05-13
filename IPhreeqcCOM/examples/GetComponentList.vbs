Dim IPhreeqc, comp, comps, str
Set IPhreeqc = CreateObject("IPhreeqcCOM.Object")
IPhreeqc.LoadDatabase("phreeqc.dat")
IPhreeqc.RunFile("ex2")
str = ""
comps = IPhreeqc.GetComponentList()
For Each comp in comps
    str = str & comp & vbNewLine
Next
WScript.Echo(str)

