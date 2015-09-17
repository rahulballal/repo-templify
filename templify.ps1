$targetFolder=$args[0]

if (Test-Path $targetFolder) {

    Write-Host "Setting up repository structure for " $targetFolder

    # Constants
    $vsGitIgnore=".gitignore"
    $readme="README.md"
    $slnTemplate="template.sln"
    $reponame= Split-Path $targetFolder -leaf


    # Script
    if ( !(Test-Path -path $targetFolder/$vsGitIgnore)) {
        Copy-Item $vsGitIgnore -Destination $targetFolder        
    }

    if (!(Test-Path -path $targetFolder/$reponame-ci.sln)) {
        Copy-Item $slnTemplate -Destination $targetFolder
        Rename-Item -path $targetFolder/$slnTemplate -newname $reponame-ci.sln
    }

    if (!(Test-Path -path $targetFolder/README.md)) {
        New-Item $targetFolder/README.md -type file
    }

    if (Test-Path -path $targetFolder/drop-solution-file-here.txt) {
        Remove-Item $targetFolder/drop-solution-file-here.txt
    }
    
    if (Test-Path -path $targetFolder/src) {
        New-Item $targetFolder/src/drop-your-csproj-folders-here.txt -type file -force        
    }
    else {
        mkdir $targetFolder/src
        New-Item $targetFolder/src/drop-your-csproj-folders-here.txt -type file
    }
    
    if (Test-Path -path $targetFolder/build_automation/) {
        New-Item $targetFolder/build_automation/drop-your-build-scripts-here.txt -type file -force       
    }
    else {
        mkdir $targetFolder/build_automation
        New-Item $targetFolder/build_automation/drop-your-build-scripts-here.txt -type file
    }

    
    if (Test-Path -path $targetFolder/tools ) {
        New-Item $targetFolder/tools/drop-tools-like-xunitrunner-here.txt -type file -force        
    }
    else {
        mkdir $targetFolder/tools                
        New-Item $targetFolder/tools/drop-tools-like-xunitrunner-here.txt -type file
    }

    if (Test-Path -path $targetFolder/logs) {
        New-Item $targetFolder/logs/logfiles-go-here.txt -type file -force             
    }
    else {
        mkdir $targetFolder/logs
        New-Item $targetFolder/logs/logfiles-go-here.txt -type file -force 
    }
    

    if (Test-Path $targetFolder/artifact) {
        New-Item $targetFolder/artifact/generated-NuGet-Packages-Go-here.txt -type file -force         
    }
    else {
        mkdir $targetFolder/artifact
        New-Item $targetFolder/artifact/generated-NuGet-Packages-Go-here.txt -type file -force 
    }
    
}


