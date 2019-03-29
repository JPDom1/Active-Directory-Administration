<#
Provide a list of Computers to check last logondate
JP Erasmus
29/03/2019
USE AT OWN RISK!
#>
#Import AD Module
import-module activedirectory  

#Provide list of computers to check last logondate
Get-Content "C:\path\to\computers\txt"| 
Get-ADComputer -Properties * | 
Format-Table Name, lastlogondate 