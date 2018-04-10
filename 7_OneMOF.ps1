Configuration OneMOF {
	Param ()
	Import-DscResource -ModuleName PSDesiredStateConfiguration
    Import-DscResource -ModuleName xNetworking
    
	node localhost {
		#------------------------------------
		WindowsFeature 'Telnet-Client' {
			#DependsOn = "[WindowsFeature]Failover-Clustering"
			Ensure = "Absent"
			Name = "Telnet-Client"
        } #telnet
        #------------------------------------
		File RequiredDirectory {
			Ensure = 'Present'
			Type = 'Directory'
			DestinationPath = "C:\RequiredDirectory"
		} #requiredDirectory
		#------------------------------------
		File NewBossRequest {
			Ensure = 'Present'
			Type = 'Directory'
			DestinationPath = "C:\NewDirectory"
		} #newBossDirectory
        #------------------------------------
        xIPAddress SetIP{
            AddressFamily = "IPv4"
		} #ipAddress
        #------------------------------------
    } #localhost
} #close configuration