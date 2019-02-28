# Main install script -- update the url on release, and the checksum.  Generate the checksum as per:
# https://github.com/PegaSysEng/homebrew-pantheon/blob/master/pantheon.rb
$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$packageArgs = @{
  PackageName = 'pantheon'
  Url64bit = 'https://consensys.bintray.com/pegasys-repo/pantheon-1.0.0.zip'
  Checksum64 = '6e53e75a26c7b6db50aea7d6deef3bac1ff20b1da8851b847fddf6350261b161'
  ChecksumType64 = 'sha256'
  UnzipLocation= $toolsDir
}
Install-ChocolateyZipPackage  @packageArgs

Update-SessionEnvironment

$binArgs = @{
  Name = 'pantheon'
  Path = "$toolsDir\pantheon-1.0.0\bin\pantheon.bat"
}

Install-BinFile @binArgs
