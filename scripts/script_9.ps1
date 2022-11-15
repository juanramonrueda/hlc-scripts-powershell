#--------------------------------------------------------------------------------------------------------
# Definición de variables
$script:dir_path = "C:\pruebas_scripts"

$script:file = "fichero_script_9.txt"


#--------------------------------------------------------------------------------------------------------
# Ejecución del comanado para guardar en un fichero todos los comandos que tengan el verbo set
function get_commands_set {
    Get-Command -verb set | Select-Object -Property Name > $dir_path\$file
}


#--------------------------------------------------------------------------------------------------------
# Función para crear un directorio para almacenar los archivos relacionados con los scripts si no existe
function main_s_9 {
    Invoke-Expression .\clear_display.ps1

    if (Test-Path $dir_path) {
        Write-Host 'El directorio' $dir_path "está creado"
    }
    
    else {
        New-Item -Path $dir_path -ItemType Directory
        Write-Host 'Se ha creado el directorio' $dir_path
    }

    get_commands_set
}


#--------------------------------------------------------------------------------------------------------
# Ejecución de la función principal "main"
If ($MyInvocation.InvocationName -ne '&') {
    main_s_9
}
