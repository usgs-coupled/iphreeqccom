Dim phreeqc, wateq4f

Set phreeqc = CreateObject("IPhreeqcCOM.Object")
phreeqc.LoadDatabase("phreeqc.dat")
phreeqc.DumpStringOn = True

Set wateq4f = CreateObject("IPhreeqcCOM.Object")
wateq4f.LoadDatabase("wateq4f.dat")
wateq4f.DumpStringOn = True


input = input & "SOLUTION 1 Pure water     " & vbNewLine
input = input & "EQUILIBRIUM_PHASES 1      " & vbNewLine
input = input & "    Calcite 0 10          " & vbNewLine
input = input & "SAVE solution 1           " & vbNewLine
input = input & "SAVE equilibrium_phases 1 " & vbNewLine
input = input & "DUMP                      " & vbNewLine
input = input & "    -solution            1" & vbNewLine
input = input & "    -equilibrium_phases  1" & vbNewLine

phreeqc.RunString(input)
wateq4f.RunString(input)

WScript.Echo(phreeqc.GetDumpString())
WScript.Echo(wateq4f.GetDumpString())
