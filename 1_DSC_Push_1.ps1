Configuration Demo1 {
	Param ()
	Import-DscResource -ModuleName PSDesiredStateConfiguration
	
    node Server1 {
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
    } #server1
    node Server2{
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
    } #server2
} #close configuration

Demo1 -OutputPath C:\DSC\Test