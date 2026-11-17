# ==========================================
# IT HELPDESK AUTOMATION
# System Diagnostic Script
# Version: 1.0
# ==========================================

$Computer = Get-CimInstance Win32_ComputerSystem
$OS = Get-CimInstance Win32_OperatingSystem
$CPU = Get-CimInstance Win32_Processor

$TotalRAM = [math]::Round($Computer.TotalPhysicalMemory / 1GB, 2)

Write-Host "====================================="
Write-Host "       SYSTEM DIAGNOSTIC REPORT"
Write-Host "====================================="

Write-Host "Date          : $(Get-Date)"
Write-Host "Computer Name : $($Computer.Name)"
Write-Host "Current User  : $env:USERNAME"
Write-Host "Operating System : $($OS.Caption)"
Write-Host "OS Version    : $($OS.Version)"
Write-Host "Processor     : $($CPU.Name)"
Write-Host "RAM           : $TotalRAM GB"

Write-Host "====================================="
Write-Host "       DIAGNOSTIC COMPLETED"
Write-Host "====================================="