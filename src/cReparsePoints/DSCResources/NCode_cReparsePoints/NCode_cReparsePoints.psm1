function Get-TargetResource
{
	[CmdletBinding()]
	[OutputType([System.Collections.Hashtable])]
	param
	(
		[parameter(Mandatory = $true)]
		[ValidateNotNullOrEmpty()]
		[System.String]
		$Path,

		[Parameter(Mandatory = $true)]
		[ValidateNotNullOrEmpty()]
		[System.String]
		$Target

		[Parameter(Mandatory = $true)]
		[ValidateNotNullOrEmpty()]
		[System.String]
		$Type
	)
	Write-Verbose "Checking ReparsePoint: Path=$Path; Target=$Target; Type=$Type"

	$instance = [ADSI]$Path
	$actual = $instance.Properties[$Name].Value

	$result = @{
		Path = $Path
		Name = $Name
		Value = $actual
	}

	$result
}

function Set-TargetResource
{
	[CmdletBinding()]
	param
	(
		[parameter(Mandatory = $true)]
		[ValidateNotNullOrEmpty()]
		[System.String]
		$Path,

		[Parameter(Mandatory = $true)]
		[ValidateNotNullOrEmpty()]
		[System.String]
		$Target

		[Parameter(Mandatory = $true)]
		[ValidateNotNullOrEmpty()]
		[System.String]
		$Type
	)
	Write-Verbose "Setting $Path for $Name to $Value"

	$instance = [ADSI]$Path
	$instance.Properties[$Name].Value = $Value
	$instance.SetInfo()
}

function Test-TargetResource
{
	[CmdletBinding()]
	[OutputType([System.Boolean])]
	param
	(
		[parameter(Mandatory = $true)]
		[ValidateNotNullOrEmpty()]
		[System.String]
		$Path,

		[Parameter(Mandatory = $true)]
		[ValidateNotNullOrEmpty()]
		[System.String]
		$Target

		[Parameter(Mandatory = $true)]
		[ValidateNotNullOrEmpty()]
		[System.String]
		$Type
	)
	Write-Verbose "Checking $Path for $Name"

	$instance = [ADSI]$Path
	$actual = $instance.Properties[$Name].Value
	$result = $actual -eq $Value

	Write-Verbose "Actual value was $actual"

	$result
}

Export-ModuleMember -Function *-TargetResource
