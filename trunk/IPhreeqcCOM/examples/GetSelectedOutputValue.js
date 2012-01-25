var iphreeqc = new ActiveXObject("IPhreeqcCOM.Object");
iphreeqc.LoadDatabase("phreeqc.dat");
iphreeqc.RunFile("ex2");

var selout = "selected-output:\n";
for (i = 0; i < iphreeqc.RowCount; ++i) {
    for (j = 0; j < iphreeqc.ColumnCount; ++j) {
        selout += iphreeqc.GetSelectedOutputValue(i, j) + " ";
    }
    selout += "\n"
}
WScript.Echo(selout);
