#---------------------------------------------------------------------------------------------------
# Definición de variable
$script:file = "fichero_script_11.txt"


#---------------------------------------------------------------------------------------------------
# Listado de las variables del sistema y su contenido
function main_s_11 {
    Invoke-Expression .\create_directory.ps1

    Get-ChildItem Env: > $dir_path\$file
}


#---------------------------------------------------------------------------------------------------
# Ejecución del programa principal "main"
if ($MyInvocation.InvocationName -ne '&') {
    main_s_11
}
