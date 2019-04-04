<#
Delete AD users from list.
JP Erasmus 04/04/2019
Use at own Risk!
#>


#Prompt for administration credentials with write access to AD

$credentials = Get-Credential -Credential 

#Path to file with users to delete
$users = Get-Content -Path "c:\scripts\userstodelete.txt"

#Loop to delete each user.
foreach ($user in $users) {

Remove-ADUser -Credential $credentials -Identity $user -Verbose 

Write-Host "$user has been deleted from AD" -BackgroundColor "Green" -ForegroundColor "Black"
}

