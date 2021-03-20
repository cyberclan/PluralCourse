$cred = get-Credential
Connect-AzureAD -Credential $cred
Connect-PnpOnline -Url https://globomanticsorg-admin.sharepoint.com/ -Credentials $cred

$Users = Get-AzureADUser | Where {$_.UserType -eq 'Member' -and $_.AssignedLicenses -ne $null}
$NoBirthdayUsers = @()

foreach ($user in $Users) 
{
    $SPProfile  = Get-PnPUserProfileProperty -Account $user.UserPrincipalName -ErrorAction SilentlyContinue
        if ($SPProfile -ne $null)
        {
          if ($SPProfile.UserProfileProperties.'SPS-Birthday' -eq "")
            {
               $NoBirthdayUsers += $user
            }
        }
}
$NoBirthdayUsers | Select DisplayName, UserPrincipalName | Export-Csv -Path "C:\O365Reports\UsersWithNoBirthday.csv" -NoTypeInformation

