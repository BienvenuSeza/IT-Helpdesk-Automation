# ==========================================
# IT HELPDESK AUTOMATION
# Network Diagnostic Script
# Version: 1.0
# ==========================================

Write-Host "====================================="
Write-Host "        NETWORK DIAGNOSTIC"
Write-Host "====================================="

# 1. IP Configuration
Write-Host "`n[1] IP CONFIGURATION"

Get-NetIPConfiguration |
Format-Table InterfaceAlias, IPv4Address, IPv4DefaultGateway -AutoSize

# 2. Internet Connectivity
Write-Host "`n[2] INTERNET CONNECTIVITY"

$Ping = Test-Connection -ComputerName 8.8.8.8 -Count 2 -Quiet

if ($Ping) {
    Write-Host "Internet connectivity: SUCCESS" -ForegroundColor Green
}
else {
    Write-Host "Internet connectivity: FAILED" -ForegroundColor Red
}

# 3. DNS Resolution
Write-Host "`n[3] DNS RESOLUTION"

try {
    $DNS = Resolve-DnsName google.com -ErrorAction Stop |
    Where-Object { $_.Type -eq "A" }

    if ($DNS) {
        Write-Host "DNS Resolution: SUCCESS" -ForegroundColor Green
        $DNS | Select-Object Name, IPAddress
    }
    else {
        Write-Host "DNS Resolution: FAILED" -ForegroundColor Red
    }
}
catch {
    Write-Host "DNS Resolution: FAILED" -ForegroundColor Red
}

# 4. Default Gateway
Write-Host "`n[4] DEFAULT GATEWAY"

$Gateway = Get-NetIPConfiguration |
Where-Object { $_.IPv4DefaultGateway } |
Select-Object -First 1 -ExpandProperty IPv4DefaultGateway

if ($Gateway) {
    Write-Host "Default Gateway: $($Gateway.NextHop)"
}
else {
    Write-Host "No default gateway configured" -ForegroundColor Red
}

Write-Host "`n====================================="
Write-Host "       NETWORK CHECK COMPLETED"
Write-Host "====================================="