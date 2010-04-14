Dim IPhreeqc, comp, comps
Set IPhreeqc = CreateObject("IPhreeqcCOM.Object")
IPhreeqc.LoadDatabase("phreeqc.dat")
IPhreeqc.RunFile("ex2")
comps = IPhreeqc.GetComponentList()
For Each comp in comps
	WScript.Stdout.WriteLine(comp)
Next

