#-----------------------------------------------------------------------------------------------------------
# Ejecución del comando para guardar en un fichero los comandos que empiezen por Process
function get_command_process {
    Get-Command -Name *-Process* | Select-Object -Property Name > C:\pruebas_scripts\fichero_script_10.txt
}


#-----------------------------------------------------------------------------------------------------------
# Creación de un directorio para almacenar los archivos relacionados con los scripts si no existe
function main {
    Invoke-Expression .\clear_display.ps1

    if (Test-Path C:\pruebas_scripts) {
        Write-Host 'Directorio creado anteriormente'
    }

    else {
        New-Item -Path C:\pruebas_scripts -ItemType Directory
        Write-Host 'Directorio creado'
    }

    get_command_process
}


#-----------------------------------------------------------------------------------------------------------
# Ejecución de la función principal "main"
if ($MyInvocation.InvocationName -ne '&') {
    main
}
