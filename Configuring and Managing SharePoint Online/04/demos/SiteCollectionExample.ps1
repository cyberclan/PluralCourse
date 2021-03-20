Set-SPOSite `
	-Identity https://globomanticsorg.sharepoint.com/sites/DronesatGlobomantics `
	-DefaultLinkPermission Edit `
	-DefaultSharingLinkType Internal `
	-SharingCapability ExternalUserAndGuestSharing  `
	-ShowPeoplePickerSuggestionsForGuestUsers $false 





Set-SPOSite `
    -Identity https://globomanticsorg.sharepoint.com/sites/DronesatGlobomantics `
    -SharingDomainRestrictionMode "AllowList" `
    -SharingAllowedDomainList "globomantics.org"