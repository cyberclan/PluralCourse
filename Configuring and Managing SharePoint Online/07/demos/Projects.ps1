
$Users = Get-AzureADUser | Where {$_.UserType -eq 'Member' -and $_.AssignedLicenses -ne $null}
$NoProjectsUsers = @()

foreach ($user in $Users) 
{
    $SPProfile  = Get-PnPUserProfileProperty -Account $user.UserPrincipalName -ErrorAction SilentlyContinue
        if ($SPProfile -ne $null)
        {
          if ($SPProfile.UserProfileProperties.'SPS-PastProjects' -eq "")
            {
               $NoProjectsUsers += $user
            }
        }
}
$NoProjectsUsers | Select DisplayName, UserPrincipalName | Export-Csv -Path "C:\O365Reports\UsersWithNoProjects.csv" -NoTypeInformation
