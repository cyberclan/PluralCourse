Remove-SPOSite `
	-Identity https://globomanticsorg.sharepoint.com/sites/CommSiteWiththeUI

Restore-SPODeletedSite `
	-Identity https://globomanticsorg.sharepoint.com/sites/CommSiteWiththeUI

Remove-SPOSite `
	-Identity https://globomanticsorg.sharepoint.com/sites/CommSiteWiththeUI `
    -Confirm:$false 
	
Remove-SPODeletedSite `
	-Identity https://globomanticsorg.sharepoint.com/sites/CommSiteWiththeUI