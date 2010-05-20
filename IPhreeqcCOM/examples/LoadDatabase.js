var iphreeqc = new ActiveXObject("IPhreeqcCOM.Object");
if (iphreeqc.LoadDatabase("phreeqc.dat") == 0) {
    WScript.Echo("database ok");
} else {
    WScript.Echo("database contains errors");
}
