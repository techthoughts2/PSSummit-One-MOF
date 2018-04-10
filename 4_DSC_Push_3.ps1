Configuration Demo3 {
	Param ()
	Import-DscResource -ModuleName PSDesiredStateConfiguration
	
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
    } #localhost
} #close configuration

Demo3 -OutputPath C:\DSC\Test