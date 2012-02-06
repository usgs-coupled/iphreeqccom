Dim iphreeqc, sInput

Set iphreeqc = CreateObject("IPhreeqcCOM.Object")
iphreeqc.LoadDatabase("phreeqc.dat")
iphreeqc.DumpFileOn = True

sInput = ""
sInput = sInput & "SOLUTION 1 Pure water     " & vbNewLine
sInput = sInput & "EQUILIBRIUM_PHASES 1      " & vbNewLine
sInput = sInput & "    Calcite 0 10          " & vbNewLine
sInput = sInput & "SAVE solution 1           " & vbNewLine
sInput = sInput & "SAVE equilibrium_phases 1 " & vbNewLine
sInput = sInput & "DUMP                      " & vbNewLine
sInput = sInput & "    -solution 1           " & vbNewLine
sInput = sInput & "    -equilibrium_phases  1" & vbNewLine

If (iphreeqc.RunString(sInput) <> 0) Then
    WScript.Echo(iphreeqc.GetErrorString())
End If
WScript.Echo("see " & iphreeqc.DumpFileName & ".")
