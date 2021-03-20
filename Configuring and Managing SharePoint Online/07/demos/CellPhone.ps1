
$Users = Get-AzureADUser | Where {$_.UserType -eq 'Member' -and $_.AssignedLicenses -ne $null}
$NoCellUsers = @()

foreach ($user in $Users) 
{
    if ($user.Mobile -eq $null)
    {
        $NoCellUsers += $user
    }
}

$NoCellUsers | Select DisplayName, UserPrincipalName | Export-Csv -Path "C:\O365Reports\UsersWithNoCellInAD.csv" -NoTypeInformation

$NoCellinSPUsers = @()

foreach ($user in $Users) 
{
    $SPProfile  = Get-PnPUserProfileProperty -Account $user.UserPrincipalName -ErrorAction SilentlyContinue
        if ($SPProfile -ne $null)
        {
          if ($SPProfile.UserProfileProperties.CellPhone -eq "")
            {
               $NoCellinSPUsers += $user
            }
        }
}
$NoCellinSPUsers | Select DisplayName, UserPrincipalName | Export-Csv -Path "C:\O365Reports\UsersWithNoCellInSP.csv" -NoTypeInformation



