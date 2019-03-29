<#
Reset User Password.
JP Erasmus
29/03/2019
USE AT OWN RISK!
#>

#Import AD module
Import-Module activedirectory

$username = Read-Host -Prompt 'Enter the username you want to change password for'
$newpassword = Read-Host -Prompt 'Enter new password' -AsSecureString 

do {
    $passwordknown = Read-Host -Prompt 'Do you know the current account password? Input yes or no'
} until ($passwordknown -match '[yes|no]')

if ($passwordknown -eq 'yes') {
    $oldpassword = Read-Host -Prompt 'Enter old password' -AsSecureString
    Set-ADAccountPassword -Identity $username -OldPassword $oldpassword -NewPassword $newpassword
}

else {
    $admincredential = Get-Credential -Message 'Without the existing password, Admin access is required. Please enter admin account Credentials.'
    Set-ADAccountPassword -Identity $username -NewPassword $newpassword -Reset -Credential $admincredential
}
write-host 'Password for', $username 'has been changed.' -BackgroundColor Green
Pause
