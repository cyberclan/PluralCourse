﻿

$Users = Get-AzureADUser | Where {$_.UserType -eq 'Member' -and $_.AssignedLicenses -ne $null}
$NoPictureUsers = @()

foreach ($user in $Users) 
{
    $Picture = Get-UserPhoto -Identity $user.UserPrincipalName -ErrorAction SilentlyContinue
    if ($Picture -eq $null)
    {
        $NoPictureUsers += $user
    }
}

$NoPictureUsers | Select DisplayName, UserPrincipalName | Export-Csv -Path "C:\O365Reports\UsersWithNoPicture.csv" -NoTypeInformation

