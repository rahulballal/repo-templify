function Write-Message{
    param(
            [Parameter(ValueFromPipeline=$true)]
            [string]$msg,
            [string]$type="info")

    if($type -eq "confirm"){
        Write-Host "---------------------------------------------" -ForegroundColor Green -BackgroundColor Black
        Write-Host "$msg"  -ForegroundColor Green -BackgroundColor Black
        Write-Host "---------------------------------------------" -ForegroundColor Green -BackgroundColor Black
    }

    if($type -eq "info"){
        Write-Host "++++++++++++++++++++++++++++++++++++++++++++++" -ForegroundColor Yellow -BackgroundColor Black
        Write-Host "$type : $msg"  -ForegroundColor Yellow -BackgroundColor Black
        Write-Host "++++++++++++++++++++++++++++++++++++++++++++++" -ForegroundColor Yellow -BackgroundColor Black
    }

    if($type -eq "space"){
        Write-Host "$msg $msg $msg $msg $msg $msg $msg $msg $msg $msg $msg $msg $msg $msg $msg $msg" -ForegroundColor Cyan -BackgroundColor Black
    }
    

}

function Invoke-CreateSln {
    [CmdletBinding()]
    param(
        [string]
        [ValidateScript({Test-Path $_})]
        $Root,
        [string]
        [ValidateScript({Test-Path $_})]
        $Pwd
    )
     
    $slnName = Read-Host "What would you like to name the default solution (.sln) file ?" 
    
    $source = (Join-Path -Path $Pwd -ChildPath repo\template.sln)
    $dest = (Join-Path -Path $Root -ChildPath $slnName)
    Write-Message " Copying $source to $dest"
    Copy-Item -Path $source -Destination $dest 
}

function Invoke-CreateGitIgnore {
    [CmdletBinding()]
    param(
        [string]
        [ValidateScript({Test-Path $_})]
        $Root,
        [string]
        [ValidateScript({Test-Path $_})]
        $Pwd
    )

    $wantGitIgnore = "y"
    
    $wantGitIgnore =  Read-Host "Add a .gitignore file? [y/n]"
    
     if($wantGitIgnore -eq "y"){
        Write-Message "Creating default .gitignore file"
        Copy-Item -Path (Join-Path -Path $Pwd -ChildPath repo\gitignore.txt) -Destination  (Join-Path -Path $Root -ChildPath ".gitignore") -Force
    }else{
        Write-Message "Not creating default .gitignore file...."
    }
}

function Invoke-CreateFolders {
    
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$true)]
        $Root
    )

    $path = @((Join-Path -Path $Root -ChildPath src),
    (Join-Path -Path $Root -ChildPath build_automation),
    (Join-Path -Path $Root -ChildPath tools),
    (Join-Path -Path $Root -ChildPath logs),
    (Join-Path -Path $Root -ChildPath artifact))

    $placeholders = @((Join-Path -Path $Root -ChildPath src\csproj-here.txt),
    (Join-Path -Path $Root -ChildPath build_automation\build-scripts-here.txt),
    (Join-Path -Path $Root -ChildPath artifact\build-artifacts-here.txt),
    (Join-Path -Path $Root -ChildPath logs\logs-reports-here.txt),
    (Join-Path -Path $Root -ChildPath tools\tools-here.txt))
    
    foreach($i in $path){
        if((Test-Path $i) -eq $false){
            New-Item -ItemType Directory -Path $i
        }
    }
    
    foreach($j in $placeholders){
        if((Test-Path $j) -eq $false){
            New-Item -ItemType File -Path $j
        }
    }

}

function Invoke-AddBuildSystem {

    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$true)]
        $Root,
        [Parameter(Mandatory=$true)]
        $Pwd
    )

    $addPsake = "y"
    
    $addPsake = Read-Host "Would you like to add PSake as your build system ?[y/n]"
    

    if($addPsake -eq "y"){
        Write-Message "Setting up psake dependencies..."
        Copy-Item -Path (Join-Path -Path $Pwd -ChildPath repo\build_automation) -Destination $Root -Container -Recurse -Force
    }
}

function Invoke-AddTooling {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$true)]
        $Root,
        [Parameter(Mandatory=$true)]
        $Pwd
    )    

    Write-Message "Setting up xunit.commandline, nuget.commandline, 7z.commandline, BuildInfo.Generator.Commandline tools ..."
    Copy-Item -Path (Join-Path -Path $Pwd -ChildPath repo\tools) -Destination $Root -Container -Recurse -Force    
}

function Write-NextSteps {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$true)]
        $Root,
        [Parameter(Mandatory=$true)]
        $Pwd
    )

    Get-Content "$Root\next.txt"
}
