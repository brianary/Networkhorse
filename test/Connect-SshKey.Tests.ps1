<#
.SYNOPSIS
Tests using OpenSSH to generate a key and connect it to an ssh server.
#>

if(!(&"$PSScriptRoot/../scripts/Test-RelevantTest.ps1")) {return}
BeforeAll {
	Set-StrictMode -Version Latest
	&"$PSScriptRoot/../scripts/Import-ThisModule.ps1"
	$dotssh = Join-Path $HOME .ssh
	if(!(Test-Path $dotssh -Type Container)) {New-Item $dotssh -Type Directory |Out-Null}
}
Describe 'Connect-SshKey' -Tag Connect-SshKey {
	BeforeEach {
		# see https://pester.dev/docs/usage/modules#-modulename
		Mock ssh-keygen {
			Write-Information 'ssh-keygen called' -infa Continue
			$dotssh = Join-Path $HOME .ssh
			New-Item $dotssh -ErrorAction Ignore
			"$(New-Guid)" |Out-File (Join-Path $dotssh id_rsa.pub) ascii
			"$(New-Guid)" |Out-File (Join-Path $dotssh id_rsa._x_) ascii
		} -ModuleName Networkhorse
		Mock ssh -ModuleName Networkhorse {Write-Information "ssh $args" -infa Continue}
	}
	AfterEach {
		$dotssh = Join-Path $HOME .ssh
		if(Test-Path (Join-Path $dotssh id_rsa._x_))
		{
			Join-Path $dotssh id_rsa.* |Remove-Item -Force
		}
	}
	Context 'Uses OpenSSH to generate a key and connect it to an ssh server' -Tag ConnectSshKey,Connect,SshKey {
		It 'Should set up an SSH key to a server using ssh' {
			Connect-SshKey crowpi -UserName pi
			Should -Invoke -ModuleName Networkhorse -CommandName ssh -ParameterFilter {
				$args.Count -eq 2 -and $args[0] -eq 'pi@crowpi' -and $args[1] -eq 'cat >> .ssh/authorized_keys'
			}
		}
	}
}
AfterAll {
	&"$PSScriptRoot/../scripts/Remove-ThisModule.ps1"
}
