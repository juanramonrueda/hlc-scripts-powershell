#---------------------------------------------------------------------------------------------------------------------
# Definición de variables
$script:file = "fichero_script_16.csv"


#---------------------------------------------------------------------------------------------------------------------
# Definición de función para exportar los procesos ordenados por uso de CPU a un fichero .csv


#---------------------------------------------------------------------------------------------------------------------
# Función para comprobación de si existe un directorio para almacenar los scripts y creación del mismo si no existe
function main_s_16 {
    Invoke-Expression .\create_directory.ps1

    Get-Process | Sort-Object -Property CPU -Descending | Export-Csv -Path $dir_path\$file -Delimiter ';'
}


#---------------------------------------------------------------------------------------------------------------------
# Ejecución de la función principal "main"
if ($MyInvocation.InvocationName -ne '&') {
    main_s_16
}
