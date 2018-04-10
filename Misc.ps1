Get-DscResource -Module PSDesiredStateConfiguration
Get-DscResource -Module PSDesiredStateConfiguration | ? {$_.Name -eq "File"} | Format-List *
Get-DscResource -Module PSDesiredStateConfiguration | Select-Object Name,Properties | Format-Table -AutoSize
(Get-DscResource -Module PSDesiredStateConfiguration).Path


Get-DscResource -Module xNetworking | Select-Object Name,Properties | Format-Table -AutoSize
(Get-DscResource -Module xNetworking).Path