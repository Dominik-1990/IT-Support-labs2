# sysreport.ps1 - einfache Systeminfo als JSON
$info = [ordered]@{
  ComputerName = $env:COMPUTERNAME
  OS = (Get-CimInstance Win32_OperatingSystem).Caption
  IP = (Get-NetIPAddress -AddressFamily IPv4 | Where-Object {$_.InterfaceAlias -notlike "*Virtual*" -and $_.IPAddress -ne $null} | Select-Object -First 1).IPAddress
  LastBoot = (Get-CimInstance Win32_OperatingSystem).LastBootUpTime
  Services = (Get-Service | Where-Object {$_.Status -eq 'Running'} | Select-Object -First 10).Name
}
$path = "$env:USERPROFILE\Desktop\sysreport.json"
$info | ConvertTo-Json -Depth 4 | Out-File -FilePath $path -Encoding utf8
Write-Host "Report saved to $path"
