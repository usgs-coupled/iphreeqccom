# set date
if ([string]::IsNullOrEmpty($Env:DATE)) {
  $Env:DATE = date +%x
}
Write-Output "0 LastExitCode=$LastExitCode"
${Env:RELEASE_DATE} = date -d ${Env:DATE} "+%B %e, %G"

# set ver
${PPK}="${Env:PUBLIC}\rsa-key-20151119.ppk"
if ([string]::IsNullOrEmpty($Env:VER)) {
  $SRC_FILE=(plink -i ${PPK} charlton@parkplace `
            "cd ftp/iphreeqc; ls -t IPhreeqcCOM-*-*.msi | awk '{if (NR == 1) {print}}'")
  $v = ($SRC_FILE -replace "^IPhreeqcCOM-", "" -replace "-.*msi$", "") -split "\."
  if ([string]::IsNullOrEmpty($v[2])) {
    $v[2] = 0
  }
  $v[2] = 1 + $v[2]
  $Env:ver_major = $v[0]
  $Env:ver_minor = $v[1]
  $Env:ver_patch = $v[2]
  $Env:VER = $v -join "."
}
else {
  $v = ($Env:VER) -split "\."  
  $Env:ver_major = $v[0]
  $Env:ver_minor = $v[1]
  $Env:ver_patch = $v[2]
}
Write-Output "1 LastExitCode=$LastExitCode"
# set HEAD
[string]$HEAD=(-split (svn --config-dir C:\Users\jenkins\svn-jenkins st -v IPhreeqcCOM.2005.sln))[0]
if ([string]::IsNullOrEmpty($Env:REL) -or $Env:REL.CompareTo('HEAD') -eq 0) {
  $Env:REL = $HEAD
}

${Env:VER_TAG}="r$Env:REL"
${Env:VER_NUMTAG}="-$Env:REL"
${Env:VERSION_LONG}="$Env:ver_major.$Env:ver_minor.$Env:ver_patch.$Env:REL"
${Env:VER_UC}="$Env:ver_major.$Env:ver_minor.$Env:ver_patch.$Env:REL"
${Env:MSI_VERSION}="$Env:ver_major.$Env:ver_minor.$Env:REL"
${Env:FULLPKG}="$Env:NAME-$Env:VER-$Env:REL"
${Env:DOWNLOADS}="${Env:PUBLIC}\Downloads"

Write-Output "HEAD=$HEAD"
Write-Output "Env:DATE=$Env:DATE"
Write-Output "Env:RELEASE_DATE=$Env:RELEASE_DATE"
Write-Output "Env:ver_major=$Env:ver_major"
Write-Output "Env:ver_major=$Env:ver_minor"
Write-Output "Env:ver_major=$Env:ver_patch"
Write-Output "Env:VER=$Env:VER"
Write-Output "Env:REL=$Env:REL"
Write-Output "Env:VER_TAG=$Env:VER_TAG"
Write-Output "Env:VER_NUMTAG=$Env:VER_NUMTAG"
Write-Output "Env:VERSION_LONG=$Env:VERSION_LONG"
Write-Output "Env:MSI_VERSION=$Env:MSI_VERSION"
Write-Output "Env:FULLPKG=$Env:FULLPKG"
Write-Output "Env:DOWNLOADS=${Env:DOWNLOADS}"

Write-Output "2 LastExitCode=$LastExitCode"

# duplicate build/dist.sh
$sed_files=@('build/version.h', `
             'msi/examples/c/advect/README.txt', `
             'msi/examples/fortran/advect/README.txt', `
             'phreeqc3-doc/RELEASE.TXT')

foreach ($file in $sed_files) {
  (Get-Content $file) | Foreach-Object {
    $_ -replace "(#define *VER_MAJOR\s*)[0-9]*",        "`${1}$Env:ver_major" `
       -replace "(#define *VER_MINOR\s*)[0-9]*",        "`${1}$Env:ver_minor" `
       -replace "(#define *VER_PATCH\s*)[0-9]*",        "`${1}$Env:ver_patch" `
       -replace "(#define *VER_REVISION\s*)[0-9]*",     "`${1}$Env:REL" `
       -replace "@RELEASE_DATE@",                       "$Env:RELEASE_DATE" `
       -replace "@PHREEQC_VER@",                        "$Env:VER" `
       -replace "@PHREEQC_DATE@",                       "$Env:RELEASE_DATE" `
       -replace "@VERSION_LONG@",                       "$Env:VERSION_LONG" `
       -replace "@VER_DATE@",                           "$Env:RELEASE_DATE" `
       -replace "@VERSION@",                            "$Env:VER" `
       -replace "@REVISION@",                           "$Env:REL" `
  } | Set-Content $file
}

# build IPhreeqcCOM.chm
Set-Location help
Invoke-Expression "hhc .\IPhreeqcCOM.hhp"
Set-Location ..

# build IPhreeqcCOM.dll (32-bit)
[string]${MsBuild}="c:\WINDOWS\Microsoft.NET\Framework\v2.0.50727\MsBuild.exe"
[string]$opts_win32="IPhreeqcCOM.2005.sln /t:IPhreeqcCOM /p:Configuration=Release /p:Platform=Win32"
Invoke-Expression "$MsBuild $opts_win32"

# build IPhreeqcCOM.dll (64-bit)
[string]$opts_x64="IPhreeqcCOM.2005.sln /t:IPhreeqcCOM /p:Configuration=Release /p:Platform=x64"
Invoke-Expression "$MsBuild $opts_x64"

# build IPhreeqcCOM.msi
[string]$opts_msi="IPhreeqcCOM.2005.sln /t:msi /p:Configuration=Release /p:Platform=Win32 /p:TargetName=$Env:FULLPKG-win32 /p:Major=$Env:ver_major /p:Minor=$Env:ver_minor /p:Patch=$Env:ver_patch /p:Build=$Env:REL /p:ExampleDir=examples"
Invoke-Expression "$MsBuild $opts_msi"

# build IPhreeqcCOMx64.msi
[string]$opts_msi_x64="IPhreeqcCOM.2005.sln /t:msi /p:Configuration=Release /p:Platform=x64 /p:TargetName=$Env:FULLPKG-x64 /p:Major=$Env:ver_major /p:Minor=$Env:ver_minor /p:Patch=$Env:ver_patch /p:Build=$Env:REL /p:ExampleDir=examples"
Invoke-Expression "$MsBuild $opts_msi_x64"