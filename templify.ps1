$targetFolder=$args[0]

Write-Host "Setting up repository structure for " $targetFolder

# Constants
$vsGitIgnore=".gitignore"
$readme="README.md"


# Script
Copy-Item $vsGitIgnore -Destination $targetFolder
New-Item $targetFolder/README.md -type file
New-Item $targetFolder/drop-solution-file-here.txt -type file


mkdir $targetFolder/src
New-Item $targetFolder/src/drop-your-csproj-folders-here.txt -type file

mkdir $targetFolder/build_automation
New-Item $targetFolder/build_automation/drop-your-build-scripts-here.txt -type file

mkdir $targetFolder/tools
New-Item $targetFolder/tools/drop-tools-like-xunitrunner-here.txt -type file

mkdir $targetFolder/logs
New-Item $targetFolder/logs/logfiles-go-here.txt -type file

mkdir $targetFolder/artifact
New-Item $targetFolder/artifact/generated-NuGet-Packages-Go-here.txt -type file
