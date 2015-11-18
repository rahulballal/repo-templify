<#
.Synopsis
  Main script for templification

.Description
  This script is the main entry point for the steps that are needed to templify
  a repository.

.Parameter PathToRepository
  Mandatory parameter.
  Default value is NULL
  Expected value is a fully qualified path to the repository to be templified

.Parameter Mode
  Optional parameter.
  Default value is "configure"
  Accepted Values are ("configure","reconfigure")
  Note: As of Nov 18th, 2015 "reconfigure" has not been implemented.

.Example
  templify.ps1 -PathToRepository c:\git\repo-to-templify -Mode configure

.Example
    $paramSplat =  @{PathToRepository = "c:\git\repo-to-templify" , Mode = "configure"}
    templify.ps1 $paramSplat
#>
param(

    [Parameter(Mandatory=$false)]
    [ValidateSet("configure","reconfigure")]
    [String]$Mode="configure",

    [Parameter(Mandatory=$true)]
    [ValidateScript({ Test-Path $_})]
    [String]$PathToRepository

)

Import-Module ".\helper.psm1" -Force

$configureMode = ($Mode -eq "configure")
$cwd = (pwd)

if($configureMode){


    Write-Message -msg "Target Dir : $PathToRepository"
    Write-Message -msg "Working Dir : $cwd"

    Invoke-CreateSln -Root $PathToRepository -Pwd $cwd

    Invoke-CreateGitIgnore -Root $PathToRepository -Pwd $cwd

    Invoke-CreateFolders -Root $PathToRepository

    Invoke-AddBuildSystem -Root $PathToRepository -Pwd $cwd

    Invoke-AddTooling -Root $PathToRepository -Pwd ($cwd)

    Show-Tree -Path $PathToRepository -Depth 4 -ShowLeaf

    Write-Message -msg "DONE :)" -type "confirm"

}
