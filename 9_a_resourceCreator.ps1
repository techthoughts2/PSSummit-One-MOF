<#
.SYNOPSIS
	Used for creating a new custom resource module or adding a new resource property to an existing custom module
.DESCRIPTION
	This script assists in adding additional resource properties to an existing module and will ensure proper formatting and resource file creation. If the module is new, it will alternatively create the new custom resource.
.NOTES
	At a high level:
	Specify the module you will be adding the resource too / creating.
	The resource name and friendly name are typically the same.
	Specify the key resource property name (that will act as the primary key)
	Then specify the target module location and then specify any additional parameters
	Create the new resourece
#>
#--------------------------------------------------------------------------------
#install the required xDSCResourceDesigner module if you haven't already:
#Install-Module xDSCResourceDesigner
#--------------------------------------------------------------------------------
#import the module
Import-Module xDSCResourceDesigner
#--------------------------------------------------------------------------------
#these will change every time you create a new resource
$resourceName = 'SoftwareByFloor'
$friendlyResourceName = 'SoftwareByFloor'
$resourcePropertyName = 'Install'
#-----------------------------------------------------
#this will likely NOT change
$moduleName = 'SoftwareByFloor'
$path = 'C:\DSC'
#-----------------------------------------------------
#basic example
$intResLevelProp = New-xDscResourceProperty -Name $resourcePropertyName -Type Boolean -Attribute Key
#$cache = New-xDscResourceProperty -Name 'CSVCacheSize' -Type Uint16 -Attribute Write
New-xDscResource -ModuleName $moduleName -Name $resourceName -FriendlyName $friendlyResourceName -Property $intResLevelProp -Path $path
#-----------------------------------------------------