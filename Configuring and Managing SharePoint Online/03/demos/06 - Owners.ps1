Set-SPOSite `
	-Identity https://globomanticsorg.sharepoint.com/sites/thehub `
	-Owner ben@globomantics.org
	
Set-SPOUser `
	-Site https://globomanticsorg.sharepoint.com/sites/thehub `
	-LoginName vanessa.le@globomantics.org `
	-IsSiteCollectionAdmin $True