function Invoke-InstallTopShelfService
{
    [CmdletBinding()]
    Param
    (
        [String]
        [ValidateScript({ Test-Path $_ })]
        $pathToServiceExe
    )
    exec { &$pathToServiceExe install}
}

function Invoke-UninstallTopShelfService
{
    [CmdletBinding()]
    Param
    (
        [String]
        [ValidateScript({ Test-Path $_ })]
        $pathToServiceExe
    )
    exec {&$pathToServiceExe uninstall}
}

function Invoke-StopTopShelfService
{
    [CmdletBinding()]
    Param
    (
        [String]
        [ValidateScript({ Test-Path $_ })]
        $pathToServiceExe
    )
    exec { &$pathToServiceExe start}
}

#Export-ModuleMember -Function Invoke-InstallTopShelfService, Invoke-RunTopShelfService, Invoke-UninstallTopShelfService
