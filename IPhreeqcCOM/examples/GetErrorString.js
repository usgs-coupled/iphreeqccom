try {
    var iphreeqc = new ActiveXObject("IPhreeqcCOM.Object");
    iphreeqc.RunFile("ex1");
}
catch (e) {
    WScript.Echo(iphreeqc.GetErrorString());  // could also use e.message
}
