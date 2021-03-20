
$Users = Get-AzureADUser | Where {$_.UserType -eq 'Member' -and $_.AssignedLicenses -ne $null}
$NoManagerUsers = @()

foreach ($user in $Users) 
{
    $Manager = Get-AzureADUserManager -ObjectId $user.UserPrincipalName
    if ($Manager -eq $null)
    {
        $NoManagerUsers += $user
    }
}

$NoManagerUsers | Select DisplayName, UserPrincipalName | Export-Csv -Path "C:\O365Reports\UsersWithNoManager.csv" -NoTypeInformation