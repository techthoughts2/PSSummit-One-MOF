#-------------------------------------------------------
#specify test device details and load up credentials
$s1 = "SERVER1"
$creds = Get-Credential -Message "Enter Credentials"
#-------------------------------------------------------
#create remote CIM session with the appropriate options for your environment
$sop = New-CimSessionOption –UseSSL -SkipCACheck -SkipCNCheck -SkipRevocationCheck
$cim = New-CimSession -ComputerName $s1 -Credential $creds -SessionOption $sop
#-------------------------------------------------------
#push the configuration
Start-DSCConfiguration -CimSession $cim -Path C:\DSC\Test -Wait -Verbose -Force
#*******************************************************
#-------------------------------------------------------
#establish new session to second server and repeat process
$s2 = "SERVER2"
#-------------------------------------------------------
#create remote CIM session with the appropriate options for your environment
$cim = New-CimSession -ComputerName $s2 -Credential $creds -SessionOption $sop
#-------------------------------------------------------
#push the configuration
Start-DSCConfiguration -CimSession $cim -Path C:\DSC\Test -Wait -Verbose -Force
#-------------------------------------------------------