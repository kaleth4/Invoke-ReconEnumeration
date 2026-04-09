function Invoke-ReconEnumeration {
    param(
        [Parameter(Mandatory=$true)]
        [string]$Target,
        
        [string]$OutputDir = "$env:USERPROFILE\Desktop\Recon_$(Get-Date -Format 'yyyyMMdd_HHmmss')",
        
        [switch]$DeepScan,
        
        [switch]$WebScan,
        
        [switch]$ADScan
    )

    # 1. Crear directorio
    if (!(Test-Path $OutputDir)) {
        New-Item -ItemType Directory -Path $OutputDir -Force | Out-Null
    }

    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    Write-Host "[$timestamp] Iniciando reconocimiento: $Target" -ForegroundColor Cyan

    # 2. Fase DNS
    try {
        $dns = Resolve-DnsName -Name $Target -ErrorAction Stop
        $dns | Export-Csv -Path "$OutputDir\dns.csv" -NoTypeInformation
        Write-Host "[+] DNS resuelto y guardado." -ForegroundColor Green
    } catch {
        Write-Host "[-] Error DNS: $_" -ForegroundColor Red
    }

    # 3. Escaneo de Puertos (Nmap o PowerShell)
    if (Get-Command nmap -ErrorAction SilentlyContinue) {
        Write-Host "[*] Ejecutando Nmap..." -ForegroundColor Yellow
        nmap -sS -T4 -F -oN "$OutputDir\nmap_fast.txt" $Target
    } else {
        Write-Host "[!] Nmap no encontrado. Probando puertos 80/443..." -ForegroundColor Yellow
        80,443 | ForEach-Object { 
            $res = Test-NetConnection -ComputerName $Target -Port $_ -WarningAction SilentlyContinue
            if($res.TcpTestSucceeded) { Write-Host "[+] Puerto $_ abierto" -ForegroundColor Green }
        }
    }

    Write-Host "`n[!] Proceso terminado. Carpeta: $OutputDir" -ForegroundColor Cyan
} # <--- ESTA LLAVE ES LA QUE FALTABA
