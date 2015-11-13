function Invoke-XUnit
{
    [CmdletBinding()]
    Param
    (
        [String]
        [ValidateScript({Test-Path $_ })]
        [Parameter(Mandatory=$true)]
        $pathToXUnitExe,

        [String[]]
        [Parameter(Mandatory=$true)]
        $testAssemblies,

        [String]
        [Parameter(Mandatory=$true)]
        [ValidateScript({Test-Path $_ })]
        $pathForTestReports
    )

    $assemblies = $testAssemblies -join ";"
    $xmlReport = Join-Path -path $pathForTestReports -childpath "xunit-report.xml"
    $htmlReport = Join-Path -path $pathForTestReports -childpath "xunit-report.html"
    Exec {
        &$pathToXUnitExe $assemblies -parallel all -xml $xmlReport -html $htmlReport
    }

    Write-Host "Generated: $xmlReport"
    Write-Host "Generated: $htmlReport"
}
