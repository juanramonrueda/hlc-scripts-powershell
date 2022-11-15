#---------------------------------------------------------------------------------------------------
# Definición de variables
$script:dir_path = "C:\pruebas_scripts"

$script:file = "fichero_script_11.txt"


#---------------------------------------------------------------------------------------------------
# Se muestran las variables del sistema
function system_vars {
    Get-ChildItem Env: > $dir_path\$file
}


#---------------------------------------------------------------------------------------------------
# Creación de un directorio para almacenar los archivos relacionados con los scripts si no existe
function main_s_11 {
    Invoke-Expression .\clear_display.ps1

    if (Test-Path $dir_path) {
        Write-Host 'El directorio' $dir_path "está creado"
    }
    
    else {
        New-Item -Path $dir_path -ItemType Directory
        Write-Host 'Se ha creado el directorio' $dir_path
    }

    system_vars
}


#---------------------------------------------------------------------------------------------------
# Ejecución del programa principal "main"
if ($MyInvocation.InvocationName -ne '&') {
    main_s_11
}
