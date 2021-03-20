Get-SPOSite -Identity https://globomanticsorg.sharepoint.com/sites/CharityatGlobomantics | Select *

Set-SPOSite `
	-Identity https://globomanticsorg.sharepoint.com/sites/CharityatGlobomantics `
	-Title "EMEA Charity Initiatives" `
	-SocialBarOnSitePagesDisabled $true