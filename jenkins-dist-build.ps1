#
# To get the Invoke-WebRequest to work under the 'nt authority\system' account, the DOIRootCA2.cer
# CA needs to be installed by running internet explorer as system using 'psexec -sid cmd' from
# Sysinternals.  The -UseBasicParsing flag may also be required.
#

#
# set DATE
#
if ([string]::IsNullOrEmpty($Env:DATE)) {
  $Env:DATE = date +%x
}
$Env:DATE = date -d $Env:DATE +%x
$Env:RELEASE_DATE = date -d $Env:DATE "+%B %e, %G"

# prep for calls to Invoke_WebRequest
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

#
# set VER
#
if ([string]::IsNullOrEmpty($Env:VER)) {
  $request = Invoke-WebRequest https://raw.githubusercontent.com/usgs-coupled/phreeqc-version/main/phreeqc-version.txt -UseBasicParsing
  $v = ($request.Content.Trim()) -split "\."
  if ([string]::IsNullOrEmpty($v[2])) {
    # append a new element to the array
    $v += 0
  }
  else {
    $v[2] = 1 + $v[2]
  }
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
if ([string]::IsNullOrEmpty($v[0]) -or [string]::IsNullOrEmpty($v[1]) -or [string]::IsNullOrEmpty($v[2])) {
  throw "Bad VER"
}

#
# set REL
#
Invoke-WebRequest https://raw.githubusercontent.com/usgs-coupled/phreeqc-version/main/rel.py -OutFile rel.py -UseBasicParsing
$HEAD=$(python rel.py)
if ([string]::IsNullOrEmpty($Env:REL)) {
  $Env:REL = $HEAD
}

${Env:MSI_PATCH}=$Env:REL -replace '-.*', ''
${Env:VER_TAG}="r$Env:REL"
${Env:VER_NUMTAG}="-$Env:REL"
${Env:VERSION_LONG}="$Env:ver_major.$Env:ver_minor.$Env:ver_patch.$Env:REL"
${Env:VER_UC}="$Env:ver_major.$Env:ver_minor.$Env:ver_patch.$Env:REL"
${Env:MSI_VERSION}="$Env:ver_major.$Env:ver_minor.$Env:MSI_PATCH"
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
Write-Output "Env:MSI_PATCH=$Env:MSI_PATCH"
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
       -replace "(#define *VER_REVISION\s*)[0-9]*",     "`${1}$Env:MSI_PATCH" `
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