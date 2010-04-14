// JScript source code
var IPhreeqc = new ActiveXObject("IPhreeqcCOM.Object");
IPhreeqc.LoadDatabase("phreeqc.dat");
IPhreeqc.RunFile("ex2");
var comps = IPhreeqc.GetComponentList().toArray();
for (var i in comps)
{
    WScript.Stdout.WriteLine(comps[i]);
}
