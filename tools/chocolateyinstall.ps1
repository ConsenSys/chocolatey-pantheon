# Main install script -- update the url on release, and the checksum.  Generate the checksum as per:
# https://github.com/PegaSysEng/homebrew-pantheon/blob/master/pantheon.rb
$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$packageArgs = @{
  PackageName = 'pantheon'
  Url64bit = 'https://consensys.bintray.com/pegasys-repo/pantheon-0.8.2.zip'
  Checksum64 = '9636ecb0d559a179ffaec4c283a4bd00319c8d744e3b0a7d0db7deee809238f0'
  ChecksumType64 = 'sha256'
  UnzipLocation= $toolsDir
}
Install-ChocolateyZipPackage  @packageArgs

$binArgs = @{
  Name = 'pantheon'
  Path = "$toolsDir\pantheon-0.8.2\bin\pantheon.bat"
}

Install-BinFile @binArgs
