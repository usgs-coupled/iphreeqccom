Const ForReading = 1

Dim fso, ts, strDB, Phreeqc

Set fso = CreateObject("Scripting.FileSystemObject")
Set ts = fso.OpenTextFile("phreeqc.dat", ForReading)
strDB = ts.ReadAll()

Set iphreeqc = CreateObject("IPhreeqcCOM.Object")
If (iphreeqc.LoadDatabaseString(strDB) = 0) Then
    WScript.Echo("database ok")
Else
    WScript.Echo("database contains errors")
End If
