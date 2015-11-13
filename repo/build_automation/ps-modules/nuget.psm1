function Invoke-NugetRestore
{
    [CmdletBinding()]
    Param
    (
        [String]
        [ValidateScript({Test-Path $_ })]
        [Parameter(Mandatory=$true)]
        $nugetExePath,

        [String]
        [ValidateScript({Test-Path $_ })]
        [Parameter(Mandatory=$true)]
        $restoreSlnPath,

        [String[]]
        $packageSources = @("https://www.nuget.org/api/v2/")
    )

    $nugetPackageSources = $packageSources -join ";"

    Exec {
        &$nugetExePath restore $restoreSlnPath -source $nugetPackageSources
    }
}

function Invoke-NugetPackDll
{
    [CmdletBinding()]
    Param
    (
        [String]
        [ValidateNotNullOrEmpty]
        [Parameter(Mandatory=$true)]
        [ValidateScript({Test-Path $_ })]
        $nugetExePath,

        [String[]]
        [ValidateNotNullOrEmpty]
        [Parameter(Mandatory=$true)]
        [ValidateScript({Test-Path $_ })]
        $nuspecOrCsprojPaths,

        [String]
        [ValidateNotNullOrEmpty]
        [Parameter(Mandatory=$true)]
        [ValidateScript({Test-Path $_ })]
        $outputDirectory
    )

    foreach ($item in $nuspecOrCsprojPaths)
    {
       &$nugetExePath pack $item -IncludeReferencedProjects -Build -OutputDirectory $outputDirectory
    }
}

function Invoke-NugetPackTool
{
    [CmdletBinding()]
    Param
    (
        [String]
        [ValidateNotNullOrEmpty]
        [ValidateScript({Test-Path $_ })]
        [Parameter(Mandatory=$true)]
        $nugetExePath,

        [String[]]
        [ValidateNotNullOrEmpty]
        [Parameter(Mandatory=$true)]
        [ValidateScript({Test-Path $_ })]
        $nuspecOrCsprojPaths,

        [String]
        [ValidateNotNullOrEmpty]
        [Parameter(Mandatory=$true)]
        [ValidateScript({Test-Path $_ })]
        $outputDirectory
    )

    foreach ($item in $nuspecOrCsprojPaths)
    {
       &$nugetExePath pack $item -IncludeReferencedProjects -Build -Tool -OutputDirectory $outputDirectory
    }

}

#Export-ModuleMember -Function Invoke-NugetRestore, Invoke-NugetPackDll, Invoke-NugetPackTool
