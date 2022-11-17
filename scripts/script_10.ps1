#-----------------------------------------------------------------------------------------------------------
# Definición de variable
$script:file = "fichero_script_10.txt"


#-----------------------------------------------------------------------------------------------------------
# Listado de los cmdlet que tienen el nombre Process
function main_s_10 {
    Invoke-Expression .\create_directory.ps1

    Get-Command -Name *-Process* | Select-Object -Property Name > $dir_path\$file
}


#-----------------------------------------------------------------------------------------------------------
# Ejecución de la función principal "main"
if ($MyInvocation.InvocationName -ne '&') {
    main_s_10
}
