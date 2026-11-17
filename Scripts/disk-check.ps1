# ==========================================
# IT HELPDESK AUTOMATION
# Disk Diagnostic Script
# Version: 1.0
# ==========================================

$Disks = Get-CimInstance Win32_LogicalDisk -Filter "DriveType=3"

Write-Host "====================================="
Write-Host "          DISK HEALTH CHECK"
Write-Host "====================================="

foreach ($Disk in $Disks) {

    $TotalSize = [math]::Round($Disk.Size / 1GB, 2)
    $FreeSpace = [math]::Round($Disk.FreeSpace / 1GB, 2)
    $UsedSpace = [math]::Round($TotalSize - $FreeSpace, 2)

    $FreePercent = [math]::Round(($Disk.FreeSpace / $Disk.Size) * 100, 2)

    Write-Host ""
    Write-Host "Drive        : $($Disk.DeviceID)"
    Write-Host "Total Size   : $TotalSize GB"
    Write-Host "Used Space   : $UsedSpace GB"
    Write-Host "Free Space   : $FreeSpace GB"
    Write-Host "Free Percent : $FreePercent %"

    if ($FreePercent -lt 15) {
        Write-Host "Status       : WARNING - LOW DISK SPACE" -ForegroundColor Red
    }
    else {
        Write-Host "Status       : OK" -ForegroundColor Green
    }
}

Write-Host ""
Write-Host "====================================="
Write-Host "       DISK CHECK COMPLETED"
Write-Host "====================================="