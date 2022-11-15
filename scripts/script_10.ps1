#-----------------------------------------------------------------------------------------------------------
# Limpieza de pantalla
function clear_display {
    Clear-Host
}


#-----------------------------------------------------------------------------------------------------------
# Ejecución del comando para guardar en un fichero los comandos que empiezen por Process
function get_command_process {
    Get-Command -Name *-Process* | Select-Object -Property Name > C:\pruebas_scripts\fichero_script_10.txt
}


#-----------------------------------------------------------------------------------------------------------
# Creación de un directorio para almacenar los archivos relacionados con los scripts si no existe
function main {
    clear_display

    if (Test-Path C:\pruebas_scripts) {
        Write-Host 'Directorio creado anteriormente'

        get_command_process
    }

    else {
        New-Item -Path C:\pruebas_scripts -ItemType Directory
        Write-Host 'Directorio creado'

        get_command_process
    }
}


#-----------------------------------------------------------------------------------------------------------
# Ejecución de la función principal "main"
if ($MyInvocation.InvocationName -ne '&') {
    main
}
