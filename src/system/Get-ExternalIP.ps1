Function Get-ExternalIP {
    $json = Invoke-WebRequest -UseBasicParsing -Uri 'https://ipinfo.io' | ConvertFrom-Json
    return $json
}

Set-Alias -Name ip -Value Get-ExternalIP