param(
    
    [Parameter(Mandatory=$false)]
    [ValidateSet("configure","reconfigure")]
    $Mode="configure",

    [Parameter(Mandatory=$true)]
    [ValidateScript({ Test-Path $_})]
    $PathToRepository

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



