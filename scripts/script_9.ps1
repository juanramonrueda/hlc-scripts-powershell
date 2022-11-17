#--------------------------------------------------------------------------------------------------------
# Definición de variable
$script:file = "fichero_script_9.txt"


#--------------------------------------------------------------------------------------------------------
# Listado de los cmdlet que empiezan por SET
function main_s_9 {
    Invoke-Expression .\create_directory.ps1

    Get-Command -Verb SET | Select-Object -Property Name > $dir_path\$file
}


#--------------------------------------------------------------------------------------------------------
# Ejecución de la función principal "main"
If ($MyInvocation.InvocationName -ne '&') {
    main_s_9
}
