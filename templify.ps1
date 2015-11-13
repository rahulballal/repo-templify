param (
    [string]
    [ValidateScript({ Test-Path $_ })]
    [Parameter(Mandatory=$true)]    
    $RepositoryPath,

    [bool]
    [ValidateSet($true,$false)]
    $DefaultMode =$true,

    [string]
    $SolutionName,

    [string]
    [ValidateSet("xunit","nunit")]
    $TestFramework="xunit",

    [string]
    [ValidateSet("opencover","dotcover")]
    $CodeCoverage="opencover", 

    [string]
    [ValidateSet("7zip")]
    $ZipUtil="7zip",

    [bool]    
    $PrintDefaults = $false
)

Import-Module ".\helper.psm1" -force

$defSlnName = Split-Path $RepositoryPath -leaf
$defSlnName = "$defSlnName-ci.sln"

$Settings= @{}
$Settings.Add("SolutionName",$defSlnName)                
$Settings.Add("TestFramework",$TestFramework)
$Settings.Add("CodeCoverage",$CodeCoverage)
$Settings.Add("ZipUtil",$ZipUtil)
$Settings.Add("BuildScripts","$RepositoryPath\build_automation")
$Settings.Add("ArtifactsPath","$RepositoryPath\artifact")
$Settings.Add("DistPath","$RepositoryPath\artifact\dist")
$Settings.Add("BuildOutputPath","$RepositoryPath\artifact\buildOutput")
$Settings.Add("ToolsPath","$RepositoryPath\tools")
$Settings.Add("LogsPath","$RepositoryPath\logs")
$Settings.Add("SourcePath","$RepositoryPath\src")

if($PrintDefaults){
    Get-Defaults -config $Settings
    Exit 0
}

#if ($DefaultMode) {
#    Invoke-RepositorySetup -repo $RepositoryPath -config $Settings
#}

