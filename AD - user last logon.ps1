<#
Provide a list of users to display last logon date and time
JP Erasmus
02/04/2019
Use at own risk
#>
#Import the AD Module
Import-Module activedirectory

#Provide path to TXT with list of users
$users= Get-Content -Path 'C:\path\to\txt'

#foreach will run and output list of users with lastlogondate
foreach ($user in $users){
Get-ADUser $user -Properties lastlogondate |

select name, lastlogondate
}