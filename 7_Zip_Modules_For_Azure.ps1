#used for zipping up custom dsc resources prior to upload to Azure automation
#--------------------------------------------------------------------------------
#install the required xPSDesiredStateConfiguration module if you haven't already:
#Install-Module xPSDesiredStateConfiguration
#--------------------------------------------------------------------------------
#import the module
Import-Module xPSDesiredStateConfiguration
#--------------------------------------------------------------------------------
#create the module .zip for Azure uploading
Publish-ModuleToPullServer -Name xNetworking -OutputFolderPath C:\DSC\Uploads `
    -ModuleBase 'c:\Program Files\WindowsPowerShell\Modules\xNetworking' -Version 5.6.0.0
#--------------------------------------------------------------------------------
#rename the zip file to not include the version number
#Rename-Item .\xNetworking_5.6.0.0.zip -NewName xNetworking.zip
#--------------------------------------------------------------------------------