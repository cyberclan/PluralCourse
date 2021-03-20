
$Users = Get-AzureADUser | Where {$_.UserType -eq 'Member' -and $_.AssignedLicenses -ne $null}
$NoCountryUsers = @()

foreach ($user in $Users) 
{
    if ($user.Country -eq $null)
    {
        $NoCountryUsers += $user
    }
}

$NoCountryUsers | Select DisplayName, UserPrincipalName | Export-Csv -Path "C:\O365Reports\UsersWithNoCountry.csv" -NoTypeInformation