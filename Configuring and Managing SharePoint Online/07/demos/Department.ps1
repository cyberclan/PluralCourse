
$Users = Get-AzureADUser | Where {$_.UserType -eq 'Member' -and $_.AssignedLicenses -ne $null}
$NoDeptUsers = @()

foreach ($user in $Users) 
{
    if ($user.Department -eq $null)
    {
        $NoDeptUsers += $user
    }
}

$NoDeptUsers | Select DisplayName, UserPrincipalName | Export-Csv -Path "C:\O365Reports\UsersWithNoDepartment.csv" -NoTypeInformation