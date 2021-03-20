New-SPOSite `
	-Url https://globomanticsorg.sharepoint.com/sites/TeamSiteWithoutAGroup `
	-Owner vlad@globomantics.org `
	-Title "Modern Stand Alone Team Site" `
	-Template STS#3 `
	-StorageQuota 10240
	
New-SPOSite `
	-Url https://globomanticsorg.sharepoint.com/sites/CommSiteDemo `
	-Owner vlad@globomantics.org `
	-Title "Communication Site" `
	-Template SITEPAGEPUBLISHING#0 `
	-StorageQuota 10240

New-PnPSite `
	-Type TeamSite `
	-Title "Modern Team Site with An O365 Group" `
	-Alias "ModernTeamSiteWithO365Group"
	
New-PnPSite `
	-Type CommunicationSite `
	-Title "Communication Site with PnP" `
	-Url https://globomanticsorg.sharepoint.com/sites/Research `
	-SiteDesign Showcase