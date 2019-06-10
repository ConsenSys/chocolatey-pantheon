# Main install script -- update the url on release, and the checksum.  Generate the checksum as per:
# https://github.com/PegaSysEng/homebrew-pantheon/blob/master/pantheon.rb
$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$packageArgs = @{
  PackageName = 'pantheon'
  Url64bit = 'https://consensys.bintray.com/pegasys-repo/pantheon-1.1.2.zip'
  Checksum64 = '84db61abd9d2df588174a2e1de40d473734bea200b440a9d848f3f167ca18dac'
  ChecksumType64 = 'sha256'
  UnzipLocation= $toolsDir
}
Install-ChocolateyZipPackage  @packageArgs

Update-SessionEnvironment

$binArgs = @{
  Name = 'pantheon'
  Path = "$toolsDir\pantheon-1.1.2\bin\pantheon.bat"
}

Install-BinFile @binArgs
