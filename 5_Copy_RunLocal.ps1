#-------------------------------------------------------
#add a trusted source - only if required
#winrm s winrm/config/client '@{TrustedHosts="783721-hyp41,10.127.57.25"}'
#-------------------------------------------------------
#specify test device details and load up credentials
$s1 = "SERVER1"
$creds = Get-Credential -Message "Enter Credentials"
#-------------------------------------------------------
#create remote session with the appropriate options for your environment
$so = New-PSSessionOption -SkipCACheck -SkipCNCheck -SkipRevocationCheck
$session = New-PSSession -ComputerName $s1 -Credential $creds -SessionOption $so -UseSSL
#-------------------------------------------------------
#copy the localhost mof to the test device using previously established session
$params = @{
    Path = 'C:\DSC\Test\localhost.mof'
    Destination = 'C:\rs-pkgs\localhost.mof'
    ToSession = $session
}
Copy-Item @params -Recurse -Force
#-------------------------------------------------------
#invoke a Start-DSCConfiguration command that will run *locally* on the destination device using the localhost.mof just copied
Invoke-Command -Session $session `
    -ScriptBlock {Start-DSCConfiguration -Path C:\rs-pkgs -Wait -Verbose -Force}
#*******************************************************
#-------------------------------------------------------
#establish new session to second server and repeat process
$s2 = "SERVER2"
$session = New-PSSession -ComputerName $s2 -Credential $creds -SessionOption $so -UseSSL
#-------------------------------------------------------
#copy the localhost mof to the test device using previously established session
$params = @{
    Path = 'C:\DSC\Test\localhost.mof'
    Destination = 'C:\rs-pkgs\localhost.mof'
    ToSession = $session
}
Copy-Item @params -Recurse -Force
#-------------------------------------------------------
#invoke a Start-DSCConfiguration command that will run *locally* on the destination device using the localhost.mof just copied
Invoke-Command -Session $session `
    -ScriptBlock {Start-DSCConfiguration -Path C:\rs-pkgs -Wait -Verbose -Force}
#-------------------------------------------------------