#-------------------------------------------------------------------------------------------------
# Definición de variables
$script:file = "fichero_script_12.txt"

$script:list_dir = 'C:\*.txt'


#-------------------------------------------------------------------------------------------------
# Listado de los archivos con la extensión .txt en C:
function main_s_12 {
    Invoke-Expression .\create_directory.ps1

    Get-ChildItem -Name -Path $list_dir >  $dir_path\$file
}


#-------------------------------------------------------------------------------------------------
# Ejecución del programa principal "main"
if ($MyInvocation.InvocationName -ne '&') {
    main_s_12
}
