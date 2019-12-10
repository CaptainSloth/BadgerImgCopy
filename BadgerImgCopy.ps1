$SourceFolders = @('C:\Projects\My Pictures','C:\Projects\Test')
$NewFolder = 'C:\Projects\New'
$Dimensions = { $_.Width -gt 1280 -or $_.Height -gt 1280 } 

Get-ChildItem $SourceFolders -Include *.jpg, *.png -Recurse | Get-Image | ? $Dimensions | % {
	"Copy image '$($_.Name)' from '$(Split-Path -Path $_.FullName )' to '$NewFolder'"
	Copy-Item -Path $_.FullName -Destination "$NewFolder " -Force -Confirm:$false
}

Write-Host -foregroundcolor Green "									";
Write-Host -foregroundcolor Green "              _.---._    /\\		";
Write-Host -foregroundcolor Green "           ./'       '--`\//		";
Write-Host -foregroundcolor Green "         ./              o \		";
Write-Host -foregroundcolor Green "        /./\  )______   \__ \	";
Write-Host -foregroundcolor Green "       ./  / /\ \   | \ \  \ \	";
Write-Host -foregroundcolor Green "          / /  \ \  | |\ \  \7	";
Write-Host -foregroundcolor Green "           "     "    "  "		";
Write-Host -foregroundcolor Green "									";

# Get-ChildItem -Path 'C:\Projects\My Pictures' -include *.jpg, *.png -Recurse | Get-Image | ? { $_.Width -gt 1280 -or $_.Height -gt 1280 } | select -expa Fullname | get-item