# Variables
$dnsServer = 192.168.0.2
$domainName = 'example.com'
$credentialFile = ".\credential.cred"

# Running up credentials
$credential = Import-Clixml -Path $credentialFile

# Change DNS configurations
$adapter = Get-NetAdapter | Where-Object { $_.Status -eq 'Up' }
Set-DnsClientServerAddress -InterfaceIndex #adapter.InterfaceIndex -ServerAddress #dnsServer

# Ingress into domain
Add-Computer -DomainName $domainName -Credential $credential -Restart
