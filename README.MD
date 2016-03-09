# Repo Templify

## Usage

	- Install latest powershell and Powershell Community Extentions (https://pscx.codeplex.com/)
	- Open Powershell 
	- cd into the folder where you cloned repo-templify
	- Execute command **PS> .\templify.ps1 -Mode configure -PathToRepository c:\repo-to-setup **
	- Execute command **PS> Get-Help .\templify.ps1 -detailed to get detailed usage help **
	- This will create a folder structure and place place holder files to guide you where to place different files.

NOTE: You may get errors because of execution policy settings on powershell run command **Set-ExecutionPolicy Unrestricted** to be able to run the templify script.

## Folder Structure

	├──artifact
	│  └──build-artifacts-here.txt
	├──build_automation
	│  ├──ps-modules
	│  │  ├──7zip.psm1
	│  │  ├──git.psm1
	│  │  ├──misc.psm1
	│  │  ├──msbuild.psm1
	│  │  ├──nuget.psm1
	│  │  ├──opencover.psm1
	│  │  ├──teamcity.psm1
	│  │  ├──topshelf.psm1
	│  │  └──xunit.psm1
	│  ├──build-scripts-here.txt
	│  ├──default.ps1
	│  ├──drop-your-build-scripts-here.txt
	│  ├──handlers.ps1
	│  ├──init.ps1
	│  ├──properties.ps1
	│  ├──psake-config.ps1
	│  ├──psake.cmd
	│  ├──psake.ps1
	│  └──psake.psm1
	├──logs
	│  └──logs-reports-here.txt
	├──src
	│  └──csproj-here.txt
	├──tools
	│  ├──7-Zip.CommandLine.9.20.0
	│  │  └──tools
	│  │     ├──7-zip.chm
	│  │     ├──7za.exe
	│  │     ├──license.txt
	│  │     └──readme.txt
	│  ├──BuildInfo.Generator.CommandLine.0.0.2
	│  │  └──tools
	│  │     ├──BuildInfo.Generator.CommandLine.exe
	│  │     ├──BuildInfo.Generator.CommandLine.vshost.exe
	│  │     ├──CliParse.dll
	│  │     └──Newtonsoft.Json.dll
	│  ├──NuGet.CommandLine.2.8.6
	│  │  └──tools
	│  │     └──NuGet.exe
	│  ├──xunit.runner.console.2.1.0
	│  │  ├──tools
	│  │  │  ├──HTML.xslt
	│  │  │  ├──NUnitXml.xslt
	│  │  │  ├──xunit.abstractions.dll
	│  │  │  ├──xunit.console.exe
	│  │  │  ├──xunit.console.exe.config
	│  │  │  ├──xunit.console.x86.exe
	│  │  │  ├──xunit.console.x86.exe.config
	│  │  │  ├──xunit.runner.reporters.desktop.dll
	│  │  │  ├──xunit.runner.utility.desktop.dll
	│  │  │  └──xUnit1.xslt
	│  │  └──xunit.runner.console.2.1.0.nupkg
	│  ├──drop-tools-like-xunitrunner-here.txt
	│  └──tools-here.txt
	├──.gitignore
	└──temp.sln

