#--------------------------------------------------------------------------------------------------------
# Definición de variables
$script:dir_path = "C:\pruebas_scripts"

$script:file = "fichero_script_9.txt"


#--------------------------------------------------------------------------------------------------------
# Ejecución del comanado para guardar en un fichero todos los comandos que tengan el verbo set
function create_directory {
    if (Test-Path $dir_path) {
        Write-Host 'El directorio' $dir_path "esta creado"
    }
    
    else {
        New-Item -Path $dir_path -ItemType Directory
        Write-Host 'Se ha creado el directorio' $dir_path
    }
}


#--------------------------------------------------------------------------------------------------------
# Función para crear un directorio para almacenar los archivos relacionados con los scripts si no existe
function main_s_9 {
    create_directory

    Get-Command -verb set | Select-Object -Property Name > $dir_path\$file
}


#--------------------------------------------------------------------------------------------------------
# Ejecución de la función principal "main"
If ($MyInvocation.InvocationName -ne '&') {
    main_s_9
}
