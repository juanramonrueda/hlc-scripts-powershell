#-------------------------------------------------------------------------------------------------------------------------------------
# Definición de función para exportar los procesos ordenados por uso de CPU a un fichero .csv
function csv_export_processes {
    Get-Process | Sort-Object -Property CPU -Descending | Export-Csv -Path C:\pruebas_scripts\procesos_cpu_descen.csv -Delimiter ';'
}


#-------------------------------------------------------------------------------------------------------------------------------------
# Función para comprobación de si existe un directorio para almacenar los scripts y creación del mismo si no existe
function main_s_16 {
    Invoke-Expression .\clear_display.ps1

    if (Test-Path C:\pruebas_scripts) {
        Write-Host 'El directorio existe'
        
    } else {
        New-Item -Path C:\pruebas_scripts -ItemType Directory
        Write-Host 'Directorio creado'
    }

    csv_export_processes
}


#-------------------------------------------------------------------------------------------------------------------------------------
# Ejecución de la función principal "main"
if ($MyInvocation.InvocationName -ne '&') {
    main_s_16
}