#-------------------------------------------------------------------------------------------------
# Definición de variables
$script:dir_path = "C:\pruebas_scripts"

$script:file = "fichero_script_12.txt"

$script:list_dir = C:\*.txt


#-------------------------------------------------------------------------------------------------
# Se obtienen los nombres de los ficheros .txt que hay en la raíz del sistema operativo
function create_directory {
    if (Test-Path $dir_path) {
        Write-Host 'El directorio' $dir_path "esta creado"
    }
    
    else {
        New-Item -Path $dir_path -ItemType Directory
        Write-Host 'Se ha creado el directorio' $dir_path
    }
}


#-------------------------------------------------------------------------------------------------
# Creación de un directorio para almacenar los archivos relacionados con los scripts si no existe
function main_s_12 {
    create_directory

    Get-ChildItem -Name -Path $list_dir >  $dir_path\$file
}


#-------------------------------------------------------------------------------------------------
# Ejecución del programa principal "main"
if ($MyInvocation.InvocationName -ne '&') {
    main_s_12
}
