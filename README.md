```markdown
# Invoke-ReconEnumeration.ps1

Invoke-ReconEnumeration es un script de PowerShell diseñado para automatizar las fases iniciales de reconocimiento (recon) y enumeración contra un objetivo específico (IP o dominio). Es ideal para profesionales de ciberseguridad y sysadmins que buscan centralizar hallazgos en un solo lugar.

---

## 🚀 Características

- **Resolución DNS:** Obtiene registros A, AAAA, MX, etc., y los exporta a CSV.
- **Escaneo de Puertos:**
  - Utiliza Nmap si está instalado (escaneo rápido de puertos comunes).
  - Si Nmap no está presente, usa el cmdlet nativo `Test-NetConnection` de PowerShell.
- **Reportes Automáticos:** Crea una carpeta con marca de tiempo en el Escritorio para organizar los resultados.
- **Escalabilidad:** Preparado para activar escaneos profundos (`DeepScan`), auditorías web (`WebScan`) y de Active Directory (`ADScan`).

---

## 📋 Requisitos Previos

Aunque el script funciona de forma nativa con PowerShell, se recomienda tener instalado lo siguiente en el PATH del sistema para máxima eficacia:

- **Nmap** (Para escaneo avanzado de puertos).
- **Whois** (Opcional, parte de Sysinternals).

---

## 🛠️ Instalación y Uso

### Cargar la función

Copia y pega el código del script en tu terminal de PowerShell o guárdalo en un archivo `.ps1` y ejecútalo con:

```powershell
. .\Invoke-ReconEnumeration.ps1
```

_Usa el código con precaución._

### Ejecución básica

```powershell
Invoke-ReconEnumeration -Target "google.com"
```

_Usa el código con precaución._

### Ejecución con escaneo profundo

```powershell
Invoke-ReconEnumeration -Target "192.168.1.1" -DeepScan
```

_Usa el código con precaución._

---

## 📂 Estructura de Salida

Cada ejecución crea una carpeta en tu escritorio con el formato: `Recon_YYYYMMDD_HHMMSS`. Dentro encontrarás:

- `dns.csv`: Resultados de la resolución de nombres.
- `nmap_fast.txt`: Resultado del escaneo rápido de puertos.
- Otros archivos de texto según los módulos activados.

---

## ⚠️ Advertencia

Este script debe utilizarse únicamente con fines educativos o en entornos donde se tenga autorización explícita para realizar pruebas de penetración. El uso no autorizado es ilegal.
```