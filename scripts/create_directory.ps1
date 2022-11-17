#----------------------------------------------------------------------
# Definición de variable para la ruta de creación del directorio
$global:dir_path = "C:\pruebas_scripts"


#----------------------------------------------------------------------
# Función que realiza el chequeo del directorio y lo crea si no existe
function main_create_directory {
    if (Test-Path $dir_path) {
        Write-Host 'El directorio' $dir_path "esta creado"
    }
    
    else {
        New-Item -Path $dir_path -ItemType Directory
        Write-Host 'Se ha creado el directorio' $dir_path
    }
}


#----------------------------------------------------------------------
# Ejecución de la función principal "main"
if ($MyInvocation.InvocationName -ne '&') {
    main_create_directory
}