Configuration Demo4 {
	Param ()
	Import-DscResource -ModuleName PSDesiredStateConfiguration
    Import-DscResource -ModuleName xNetworking
    
	node localhost {
		#------------------------------------
		WindowsFeature 'Telnet-Client' {
			#DependsOn = "[WindowsFeature]Failover-Clustering"
			Ensure = "Absent"
			Name = "Telnet-Client"
        } #clusterPowerShell
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
            InterfaceAlias = "Public"
            IPAddress = "192.168.1.5"
            AddressFamily = "IPv4"
		} #ipAddress
        #------------------------------------
    } #localhost
} #close configuration

Demo4 -OutputPath C:\DSC\Test