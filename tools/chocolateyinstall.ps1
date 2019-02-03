# Main install script -- update the url on release, and the checksum.  Generate the checksum as per:
# https://github.com/PegaSysEng/homebrew-pantheon/blob/master/pantheon.rb
$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$chocoJavaDir = "c:\Program Files\OpenJDK\jdk-11.0.2"
$packageArgs = @{
  PackageName = 'pantheon'
  Url64bit = 'https://consensys.bintray.com/pegasys-repo/pantheon-0.9.1.zip'
  Checksum64 = '21adc39f04b3fb16d66d2e254a9915c2201234af60a79925ad4f980f2de3d052'
  ChecksumType64 = 'sha256'
  UnzipLocation= $toolsDir
}
$javaHomeArgs = @{
  VariableType = 'Machine'
  VariableValue = $chocoJavaDir
  VariableName = "JAVA_HOME"
}
Install-ChocolateyZipPackage  @packageArgs

Install-ChocolateyEnvironmentVariable @javaHomeArgs
Update-SessionEnvironment

$binArgs = @{
  Name = 'pantheon'
  Path = "$toolsDir\pantheon-0.9.1\bin\pantheon.bat"
}

Install-BinFile @binArgs
