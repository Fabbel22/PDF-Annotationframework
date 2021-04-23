# Unzip the application to "C:\DocumentServices"

Expand-Archive -Path DS-0100-XB.zip -DestinationPath C:\DocumentServices 

# Install IIS

Enable-WindowsOptionalFeature -Online -FeatureName IIS-WebServerRole
Enable-WindowsOptionalFeature -Online -FeatureName IIS-WebServer
Enable-WindowsOptionalFeature -Online -FeatureName IIS-CommonHttpFeatures
Enable-WindowsOptionalFeature -Online -FeatureName IIS-WebSockets

# Download and install Visual C++ Redistributable Packages for Visual Studio 2013

Invoke-WebRequest -OutFile vc_redist.x64.exe https://download.microsoft.com/download/2/E/6/2E61CFA4-993B-4DD4-91DA-3737CD5CD6E3/vcredist_x64.exe
Start-Process "vc_redist.x64.exe" -ArgumentList "/passive" -wait -Passthru
del vc_redist.x64.exe
        
# Download and install Visual C++ Redistributable Packages for Visual Studio 2015

Invoke-WebRequest -OutFile vc_redist.x64.exe https://download.microsoft.com/download/6/A/A/6AA4EDFF-645B-48C5-81CC-ED5963AEAD48/vc_redist.x64.exe
Start-Process "vc_redist.x64.exe" -ArgumentList "/passive" -wait -Passthru
del vc_redist.x64.exe
        
# Install ASP.NET Core Runtime
# Checksum and direct link from: https://dotnet.microsoft.com/download/dotnet-core/thank-you/runtime-aspnetcore-3.1.11-windows-hosting-bundle-installer

Invoke-WebRequest -OutFile dotnet-hosting-3.1.11-win.exe https://download.visualstudio.microsoft.com/download/pr/d8b046b7-c812-4200-905d-d2e0242be9d5/53d5698d79013be0232152ae1b43c86b/dotnet-hosting-3.1.11-win.exe
Start-Process "dotnet-hosting-3.1.11-win.exe" -ArgumentList "/passive" -wait -Passthru
Remove-Item -Force dotnet-hosting-3.1.11-win.exe

# Create a new IIS ApplicationPool
        
$appPoolName = 'DSServer'
New-WebAppPool $appPoolName
Import-Module WebAdministration
$appPool = Get-Item IIS:\AppPools\$appPoolName
$appPool.managedRuntimeVersion = ''
$appPool | set-item

$appPoolName = 'DSServer'
$appName = 'DocumentServices'
New-WebApplication -Name $appName -Site 'Default Web Site' -PhysicalPath C:\DocumentServices -ApplicationPool $appPoolName
