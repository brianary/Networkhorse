<#
.SYNOPSIS
Uses OpenSSH to generate a key and connect it to an ssh server.

.EXAMPLE
Connect-SshKey crowpi -UserName pi
#>

[CmdletBinding()] Param(
# The ssh server to connect to.
[Parameter(Position=0,Mandatory=$true)][string] $HostName,
# The remote username to use to connect.
[Alias('AsUserName')][string] $UserName = $env:UserName
)

$pubkeyfile = Join-Path $HOME .ssh id_rsa.pub
if(!(Test-Path $pubkeyfile -Type Leaf) -or !((Get-Item $pubkeyfile).Length))
{
	if(!(Get-Command ssh-keygen -Type Application -ErrorAction Ignore))
	{
		if($IsWindows)
		{
			if(Test-Path "$env:SystemRoot\system32\openssh\ssh-keygen.exe" -Type Leaf)
			{
				Set-Alias ssh-keygen "$env:SystemRoot\system32\openssh\ssh-keygen.exe"
			}
			else
			{
				throw 'Required "ssh-keygen" not found. To install, maybe run "Install-WindowsFeature OpenSSH.Client~~~~0.0.1.0"'
			}
		}
		throw 'Required "ssh-keygen" not found, install it to continue.'
	}
	ssh-keygen
}
Get-Content $pubkeyfile |
	ssh "$UserName@$HostName" 'cat >> .ssh/authorized_keys'
