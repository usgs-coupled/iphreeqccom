var iphreeqc = new ActiveXObject("IPhreeqcCOM.Object");
iphreeqc.LoadDatabase("phreeqc.dat");
iphreeqc.RunFile("ex2");

// Note: JScript doesn't support multi-dimensional arrays
var arr = iphreeqc.GetSelectedOutputArray().toArray();
var selout = "selected-output:\n";
for (var i = 0; i < iphreeqc.RowCount; ++i) {
    for (var j = 0; j < iphreeqc.ColumnCount; ++j) {
        selout += arr[i + j*iphreeqc.RowCount] + " ";
    }
    selout += "\n";
}
WScript.Echo(selout);
