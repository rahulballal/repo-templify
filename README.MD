# Repo Templify

## Usage

	- Open Powershell 
	- cd into the folder where you cloned repo-templify
	- execute command PS> ./templify.ps1 path-to-folder-you-want-to-templify
	- This will create a folder structure and place place holder files to guide you where to place different files.

NOTE: You may get errors because of execution policy settings on powershell run command *Set-ExecutionPolicy Unrestricted* to be able to run the templify script.

## Folder Structure

	- repo root
		- .gitignore
		- README.md
		- drop-solution-file-here.txt
		- \artifact
			- generated-NuGet-Packages-Go-here.txt
		- \logs
			- logfiles-go-here.txt
		- \src
			- drop-your-csproj-folders-here.txt
		- \build_automation
			- drop-your-build-scripts-here.txt
		- \tools
			- drop-tools-like-xunitrunner-here.txt
