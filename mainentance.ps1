# Windows Maintenance Toolkit
# Autor: Johnata Rodrigues
# Versão: 1.0

Clear-Host
Write-Host "===============================" -ForegroundColor Cyan
Write-Host " Windows Maintenance Toolkit"
Write-Host "===============================" -ForegroundColor Cyan

# Criar arquivo de log
$logPath = "$env:USERPROFILE\Desktop\maintenance_log.txt"
Start-Transcript -Path $logPath -Append

Write-Host "`n[1] Limpando arquivos temporários..." -ForegroundColor Yellow
Remove-Item -Path "$env:TEMP\*" -Recurse -Force -ErrorAction SilentlyContinue

Write-Host "[2] Limpando cache do Windows..." -ForegroundColor Yellow
Remove-Item -Path "C:\Windows\Temp\*" -Recurse -Force -ErrorAction SilentlyContinue

Write-Host "[3] Liberando IP..." -ForegroundColor Yellow
ipconfig /release

Write-Host "[4] Renovando IP..." -ForegroundColor Yellow
ipconfig /renew

Write-Host "[5] Verificando status da rede..." -ForegroundColor Yellow
Test-Connection google.com -Count 2

Write-Host "[6] Verificando espaço em disco..." -ForegroundColor Yellow
Get-PSDrive -PSProvider FileSystem

Write-Host "`nManutenção finalizada!" -ForegroundColor Green

Stop-Transcript
Write-Host "Log salvo em: $logPath" -ForegroundColor Cyan