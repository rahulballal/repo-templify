function Invoke-7Zip
{
    [CmdletBinding()]
    Param
    (
        [String]
        [ValidateScript({ Test-Path $_ })]
        $pathTo7ZipExe,

        [String]
        [ValidateScript({ Test-Path $_ })]
        $outputPath,
        [Hashtable]
        $zipAndContents=@{}
    )

  foreach ($key in $zipAndContents.Keys)
  {
    $list = $zipAndContents[$key]
    foreach ($item in $list)
    {
      Exec { &$pathTo7ZipExe a -t7z -mmt -o$outputPath $key $item }
    }
  }
}

function Invoke-AppendFilesTo7Zip
{
    [CmdletBinding()]
    Param
    (
        [String]
        [ValidateScript({ Test-Path $_ })]
        $pathTo7ZipExe,

        [String]
        [ValidateScript({ Test-Path $_ })]
        $zipFileToAppend,

        [String]
        [ValidateScript({ Test-Path $_ })]
        $fileToAppend
    )

    Exec { &$pathTo7ZipExe a $zipFileToAppend $item }


}

#Export-ModuleMember -Function Invoke-7Zip, Invoke-AppendFilesTo7Zip
