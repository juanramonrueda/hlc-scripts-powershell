#---------------------------------------------------------------------------------------------------------------------
# Definición de variables
$script:dir_path = "C:\pruebas_scripts"

$script:file = "fichero_script_16.csv"


#---------------------------------------------------------------------------------------------------------------------
# Definición de función para exportar los procesos ordenados por uso de CPU a un fichero .csv
function csv_export_processes {
    Get-Process | Sort-Object -Property CPU -Descending | Export-Csv -Path $dir_path\$file -Delimiter ';'
}


#---------------------------------------------------------------------------------------------------------------------
# Función para comprobación de si existe un directorio para almacenar los scripts y creación del mismo si no existe
function main_s_16 {
    Invoke-Expression .\clear_display.ps1

    if (Test-Path $dir_path) {
        Write-Host 'El directorio' $dir_path "está creado"
    }
    
    else {
        New-Item -Path $dir_path -ItemType Directory
        Write-Host 'Se ha creado el directorio' $dir_path
    }

    csv_export_processes
}


#---------------------------------------------------------------------------------------------------------------------
# Ejecución de la función principal "main"
if ($MyInvocation.InvocationName -ne '&') {
    main_s_16
}