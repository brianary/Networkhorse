# see https://docs.microsoft.com/powershell/scripting/developer/module/how-to-write-a-powershell-module-manifest
# and https://docs.microsoft.com/powershell/module/microsoft.powershell.core/new-modulemanifest
@{
RootModule = 'Networkhorse.psm1'
ModuleVersion = '0.0.0.0' # placeholder to be overridden
CompatiblePSEditions = @('Core')
GUID = 'f8251a20-b0b6-4590-afa0-b042408e6d3b'
Author = 'Brian Lalonde'
CompanyName = 'Unknown'
Copyright = 'Copyright © 2026 Brian Lalonde'
Description = 'Useful https and network utilities.'
PowerShellVersion = '7.0'
# RequiredModules = ,'Microsoft.PowerShell.Utility'
FunctionsToExport = @('*') # '*'
CmdletsToExport = @() # '*'
VariablesToExport = @() # '*'
# AliasesToExport = @()
FileList = @('Networkhorse.psd1','Networkhorse.psm1')
PrivateData = @{
	PSData = @{
		Tags = @('Network','HTTPS','HTTP','DNS','Download','Authentication')
		LicenseUri = 'https://github.com/brianary/Networkhorse/blob/master/LICENSE'
		ProjectUri = 'https://github.com/brianary/Networkhorse/'
		IconUri = 'http://webcoder.info/images/Networkhorse.svg'
		# ReleaseNotes = ''
		# PS7: A list of external modules that this module is dependent upon.
		# ExternalModuleDependencies = ,'Microsoft.PowerShell.Utility'
	}
}
}
