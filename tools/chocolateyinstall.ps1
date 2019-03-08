# Main install script -- update the url on release, and the checksum.  Generate the checksum as per:
# https://github.com/PegaSysEng/homebrew-pantheon/blob/master/pantheon.rb
$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$packageArgs = @{
  PackageName = 'pantheon'
  Url64bit = 'https://consensys.bintray.com/pegasys-repo/pantheon-1.0.1.zip'
  Checksum64 = 'acb015f6467f623fec96de876b274eaccf08951c298e2c5eaf15d45784e3dbf8'
  ChecksumType64 = 'sha256'
  UnzipLocation= $toolsDir
}
Install-ChocolateyZipPackage  @packageArgs

Update-SessionEnvironment

$binArgs = @{
  Name = 'pantheon'
  Path = "$toolsDir\pantheon-1.0.1\bin\pantheon.bat"
}

Install-BinFile @binArgs
