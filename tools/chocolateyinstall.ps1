# Main install script -- update the url on release, and the checksum.  Generate the checksum as per:
# https://github.com/PegaSysEng/homebrew-pantheon/blob/master/pantheon.rb
$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$packageArgs = @{
  PackageName = 'pantheon'
  Url64bit = 'https://consensys.bintray.com/pegasys-repo/pantheon-0.8.3.zip'
  Checksum64 = '48f5fdf7e1f8a7e460ecb86cbf3b8ac45c188af9d8b973e2d9ceab8d57b82a25'
  ChecksumType64 = 'sha256'
  UnzipLocation= $toolsDir
}
Install-ChocolateyZipPackage  @packageArgs

$binArgs = @{
  Name = 'pantheon'
  Path = "$toolsDir\pantheon-0.8.3\bin\pantheon.bat"
}

Install-BinFile @binArgs
