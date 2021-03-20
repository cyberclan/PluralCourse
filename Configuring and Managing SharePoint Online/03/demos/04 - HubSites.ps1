Register-SPOHubSite `
	-Site https://globomanticsorg.sharepoint.com/sites/thehub `
	-Principals $null

Grant-SPOHubSiteRights `
	-Identity https://globomanticsorg.sharepoint.com/sites/thehub `
	-Principals ben@globomantics.org `
	-Rights Join

Add-SPOHubSiteAssociation `
	-Site https://globomanticsorg.sharepoint.com/sites/Research `
	-HubSite https://globomanticsorg.sharepoint.com/sites/thehub