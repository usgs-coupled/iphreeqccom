var ForReading = 1

var fso = new ActiveXObject("Scripting.FileSystemObject");
var ts = fso.OpenTextFile("phreeqc.dat", ForReading);
var strDB = ts.ReadAll();

var iphreeqc = new ActiveXObject("IPhreeqcCOM.Object");
if (iphreeqc.LoadDatabaseString(strDB) == 0) {
    WScript.Echo("database ok");
} else {
    WScript.Echo("database contains errors");
}
