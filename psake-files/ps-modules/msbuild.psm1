function Invoke-MsBuild
{
    [CmdletBinding()]
    Param
    (
        [String]
        [ValidateScript({Test-Path $_ })]
        $solutionPath,

        [String]
        [ValidateScript({Test-Path $_ })]
        $outputDirectoryPath,

        [String]
        [ValidateSet("Build","Clean","Rebuild")]
        $target = "Rebuild",

        [String]
        [ValidateSet("quiet","minimal","normal","detailed","diagnostic")]
        $verbosity = "minimal",

        [String]
        [ValidateSet("Debug","Release")]
        $buildConfig = "Release"
    )

    Exec {
        msbuild $solutionPath /t:$target /v:$verbosity /p:Configuration=$buildConfig /p:OutDir=$outputDirectoryPath
    }
}

#Export-ModuleMember -Function Invoke-MsBuild
