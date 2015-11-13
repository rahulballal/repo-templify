function Get-Defaults([hashtable]$config) {
    Write-Host "Printing Default Settings :" -foregroundcolor "black" -backgroundcolor "yellow"

    foreach($key in $config.Keys){
        $val =  $config.Get_Item($key)
        Write-Host "$key ---> $val" -foregroundcolor "black" -backgroundcolor "yellow"
    }
}

function Set-RepositoryStructure([string]$paths) {
    foreach($item in $paths){
        if(-not Test-Path -path $item){
            New-Item -path $item -itemtype Directory -Verbose
            New-Item -path "placeholder.txt" -itemtype File
        }
    }
}

function Invoke-Setup($config,$source,$interactive){
    $key = "SolutionName"
    $val = $config.Get_Item($key)

    Write-Host "Creating : $val" -foregroundcolor "black" -backgroundcolor "yellow"

    

}

<#
function Set-AllBuildAutomation([string]$source,[string]$target){
    Copy-Item $source -destination $target -recurse -container  
}

function Set-Tool([string]$source,[string]$target){
    Copy-Item $source -destination $target -recurse -container 

}

#>