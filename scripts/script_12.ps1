#-------------------------------------------------------------------------------------------------
# Definición de variables
$script:dir_path = "C:\pruebas_scripts"

$script:file = "fichero_script_12.txt"


#-------------------------------------------------------------------------------------------------
# Se obtienen los nombres de los ficheros .txt que hay en la raíz del sistema operativo
function list_disk_c {
    Get-ChildItem -Name -Path C:\*.txt >  $dir_path\$file
}


#-------------------------------------------------------------------------------------------------
# Creación de un directorio para almacenar los archivos relacionados con los scripts si no existe
function main_s_12 {
    Invoke-Expression .\clear_display.ps1

    if (Test-Path $dir_path) {
        Write-Host 'El directorio' $dir_path "está creado"
    }
    
    else {
        New-Item -Path $dir_path -ItemType Directory
        Write-Host 'Se ha creado el directorio' $dir_path
    }

    list_disk_c
}


#-------------------------------------------------------------------------------------------------
# Ejecución del programa principal "main"
if ($MyInvocation.InvocationName -ne '&') {
    main_s_12
}
