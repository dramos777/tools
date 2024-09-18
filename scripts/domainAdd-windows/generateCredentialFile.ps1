# Generate credential.cred file
$credential = Get-Credential
$credential | Export-Clixml -Path ".\credential.cred"
