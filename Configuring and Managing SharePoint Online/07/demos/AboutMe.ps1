
$Users = Get-AzureADUser | Where {$_.UserType -eq 'Member' -and $_.AssignedLicenses -ne $null}
$NoAboutMeUsers = @()

foreach ($user in $Users) 
{
    $SPProfile  = Get-PnPUserProfileProperty -Account $user.UserPrincipalName -ErrorAction SilentlyContinue
        if ($SPProfile -ne $null)
        {
          if ($SPProfile.UserProfileProperties.AboutMe -eq "")
            {
               $NoAboutMeUsers += $user
            }
        }
}
$NoAboutMeUsers | Select DisplayName, UserPrincipalName | Export-Csv -Path "C:\O365Reports\UsersWithNoAboutMe.csv" -NoTypeInformation