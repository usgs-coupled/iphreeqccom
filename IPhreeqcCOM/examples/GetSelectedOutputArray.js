// JScript source code
var IPhreeqc = new ActiveXObject("IPhreeqcCOM.Object");
IPhreeqc.LoadDatabase("phreeqc.dat");
IPhreeqc.RunFile("ex2");

// Note: JScript doesn't support multi-dimensional arrays
var arr = IPhreeqc.GetSelectedOutputArray().toArray();

for (var i = 0; i < IPhreeqc.RowCount; ++i)
{
    for (var j = 0; j < IPhreeqc.ColumnCount; ++j)
    {
        WScript.Stdout.Write(arr[i + j*IPhreeqc.RowCount]);
        WScript.Stdout.Write(" ");
    }
    WScript.Stdout.WriteLine();
}

