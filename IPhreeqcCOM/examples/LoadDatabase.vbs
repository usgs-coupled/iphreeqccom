On Error Resume Next

'Dim IPhreeqc
'Dim arr

'Set IPhreeqc = CreateObject("IPhreeqcCOM.Object")

'If (IPhreeqc.LoadDatabase("phreeqc.dat") <> 0) Then
'    WScript.Echo("Unable to LoadDatabase")    
'End If

'IPhreeqc.OutputOn = true
'IPhreeqc.LogOn = true
'IPhreeqc.ErrorOn = true
'IPhreeqc.SelectedOutputOn = true
'IPhreeqc.DumpOn = true

'If (IPhreeqc.RunFile("ex2") <> 0) Then
'    WScript.Echo(IPhreeqc.GetLastErrorString)
'End If

'arr = IPhreeqc.GetSelectedOutputArray()
'For i = LBound(arr, 1) To UBound(arr, 1)
'    For j = LBound(arr, 2) To UBound(arr, 2)
'        If (IsObject(WScript.Stdout)) Then
'            WScript.Stdout.Write(arr(i, j) & " ")
'        End If
'    Next
'    If (IsObject(WScript.Stdout)) Then
'        WScript.Stdout.WriteLine
'    End If
'Next


'Dim IPhreeqc, sInput
'Set IPhreeqc = CreateObject("IPhreeqcCOM.Object")
'errs = IPhreeqc.LoadDatabase("phreeqc.dat")
'If (errs <> 0) Then
'    WScript.Echo(IPhreeqc.GetLastErrorString)
'End If


'sInput = "SOLUTION 1"         & vbNewLine
'sInput = sInput & "temp 25.0" & vbNewLine
'sInput = sInput & "pH   7.0"  & vbNewLine
'sInput = sInput & "Ca   1.2"  & vbNewLine
'sInput = sInput & "Cl   1.2"  & vbNewLine

'IPhreeqc.OutputOn = True
'IPhreeqc.RunString(sInput)

'comps = IPhreeqc.GetComponentList()
'For Each c In comps
'    WScript.Echo(c)
'Next

'WScript.Echo("LBound(comps, 1)=" & LBound(comps, 1))
'WScript.Echo("UBound(comps, 1)=" & UBound(comps, 1))

'For i=LBound(comps) to UBound(comps)
'    WScript.Echo(comps(i))
'Next

'IPhreeqc = vbNull

'IPhreeqc.DumpOn = true


Dim IPhreeqc, arr, i, j
Set IPhreeqc = CreateObject("IPhreeqcCOM.Object")
IPhreeqc.LoadDatabase("phreeqc.dat")
IPhreeqc.RunFile("ex2")

arr = IPhreeqc.GetSelectedOutputArray()
For i = LBound(arr, 1) To UBound(arr, 1)
    For j = LBound(arr, 2) To UBound(arr, 2)
        If (IsObject(WScript.Stdout)) Then
            WScript.Stdout.Write(arr(i, j) & " ")
        End If
    Next
    If (IsObject(WScript.Stdout)) Then
        WScript.Stdout.WriteLine
    End If
Next
