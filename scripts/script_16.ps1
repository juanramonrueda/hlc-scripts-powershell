#-------------------------------------------------------------------------------------------------------------------------------------
# Definición de función para exportar los procesos ordenados por uso de CPU a un fichero .csv
function exportar_procesos_csv {
    Get-Process | Sort-Object -Property CPU -Descending | Export-Csv -Path C:\pruebas_scripts\procesos_cpu_descen.csv -Delimiter ';'
}


#-------------------------------------------------------------------------------------------------------------------------------------
# Función para comprobación de si existe un directorio para almacenar los scripts y creación del mismo si no existe
function comprobar_directorio {
    if (Test-Path C:\pruebas_scripts) {
        Write-Host 'El directorio existe'
        
    } else {
        New-Item -Path C:\pruebas_scripts -ItemType Directory
        Write-Host 'Directorio creado'
    }
}


#-------------------------------------------------------------------------------------------------------------------------------------
# Ejecución de las funciones de forma ordenada
comprobar_directorio

exportar_procesos_csv