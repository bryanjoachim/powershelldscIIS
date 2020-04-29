Configuration MyWebServerCfg {
 
    Import-DscResource -ModuleName PsDesiredStateConfiguration
 
    Node 'localhost' {
 
      
        WindowsFeature IIS {
            Ensure = "Present"
            Name   = "Web-Server"
        }
 
        
        WindowsFeature IIS-Tools {
            Ensure    = "Present"
            Name      = "Web-Mgmt-Tools"
            DependsOn = "[WindowsFeature]IIS"
        }
 
    }
}
MyWebServerCfg -OutputPath "C:\Dsc"
Start-DscConfiguration -Path "C:\DSC"