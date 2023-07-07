param (
	[switch]$NoArchive,
	[string]$OutputDirectory = $PSScriptRoot
)

Set-Location "$PSScriptRoot"

$DistDir = "$OutputDirectory/dist"
if ($NoArchive)
{
	$ZipWorkDir = "$OutputDirectory"
}
else
{
	$ZipWorkDir = "$DistDir/tmp"
}
$ZipRootDir = "$ZipWorkDir/BepInEx"
$ZipInnerDir = "$ZipRootDir/plugins/MOD_NAME/"
$BuildDir = "build"
$LicenseFile = "LICENSE"
$AssemblyFile = "$BuildDir/MOD_NAME.dll"

New-Item "$ZipInnerDir" -ItemType Directory -Force
Copy-Item -Force -Path "$LicenseFile", "$AssemblyFile" -Destination "$ZipInnerDir"

if (!$NoArchive)
{
	$VERSION = (Select-String -Pattern '<Version>([0-9]+\.[0-9]+\.[0-9]+)</Version>' -Path MOD_NAME/MOD_NAME.csproj).Matches.Groups[1]
	$FILE_NAME = "$DistDir/MOD_NAME_v$VERSION.zip"
	Compress-Archive -Update -CompressionLevel Fastest -Path "$ZipRootDir" -DestinationPath "$FILE_NAME"
	Remove-Item -LiteralPath "$ZipWorkDir" -Force -Recurse
}
