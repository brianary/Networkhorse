# VHS https://github.com/charmbracelet/vhs
Output demo.gif
Hide
Set Shell pwsh
Type "Import-Module ../.publish/Networkhorse.psd1"
Enter
Type "Clear-Host"
Enter
Show
Type "Get-Dns bbc.co.uk"
Enter
Sleep 2s
Type "Get-ServerCertificate dataelemental.dev"
Enter
Sleep 2s
#Type "Get-SslDetails dataelemental.dev"
#Enter
#Sleep 2s
Type "Show-HttpStatus 307"
Enter
Sleep 2s
Type "Save-WebRequest https://webcoder.info/MLK.ics"
Enter
#Sleep 2s
#Type "Trace-WebRequest https://webcoder.info/ -SkipHeaders -SkipContent"
#Enter
Sleep 9s
