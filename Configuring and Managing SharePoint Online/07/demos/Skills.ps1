
$Users = Get-AzureADUser | Where {$_.UserType -eq 'Member' -and $_.AssignedLicenses -ne $null}
$NoSkillsUsers = @()

foreach ($user in $Users) 
{
    $SPProfile  = Get-PnPUserProfileProperty -Account $user.UserPrincipalName -ErrorAction SilentlyContinue
        if ($SPProfile -ne $null)
        {
          if ($SPProfile.UserProfileProperties.'SPS-Skills' -eq "")
            {
               $NoSkillsUsers += $user
            }
        }
}
$NoSkillsUsers | Select DisplayName, UserPrincipalName | Export-Csv -Path "C:\O365Reports\UsersWithNoSkills.csv" -NoTypeInformation