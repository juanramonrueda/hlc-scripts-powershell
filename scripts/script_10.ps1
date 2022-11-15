#-----------------------------------------------------------------------------------------------------------
# Definición de variables
$script:dir_path = "C:\pruebas_scripts"

$script:file = "fichero_script_10.txt"


#-----------------------------------------------------------------------------------------------------------
# Ejecución del comando para guardar en un fichero los comandos que empiezen por Process
function get_command_process {
    Get-Command -Name *-Process* | Select-Object -Property Name > $dir_path\$file
}


#-----------------------------------------------------------------------------------------------------------
# Creación de un directorio para almacenar los archivos relacionados con los scripts si no existe
function main_s_10 {
    Invoke-Expression .\clear_display.ps1

    if (Test-Path $dir_path) {
        Write-Host 'El directorio' $dir_path "esta creado"
    }
    
    else {
        New-Item -Path $dir_path -ItemType Directory
        Write-Host 'Se ha creado el directorio' $dir_path
    }


    get_command_process
}


#-----------------------------------------------------------------------------------------------------------
# Ejecución de la función principal "main"
if ($MyInvocation.InvocationName -ne '&') {
    main_s_10
}
