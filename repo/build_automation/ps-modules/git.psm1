function Get-GitBranchName
{
  $branch = git rev-parse --symbolic-full-name --abbrev-ref HEAD 2> $null
  if (!$branch)
  {
    $branch = hg branch 2> $null
  }

  return $branch
}

function Invoke-GitMerge
{
	[CmdletBinding()]
	param
	(
		[String]
		[Parameter(Manadatory=$true)]
		$branchToMerge,
		
		[String]
		[Parameter(Manadatory=$true)]
		[String]$branchToBeMeregedInto
	)
	
	git checkout $branchToBeMeregedInto
	git merge $branchToMerge --no-ff
}