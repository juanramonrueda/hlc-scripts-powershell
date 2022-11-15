#--------------------------------------------------------------------------------------------------------
# Limpieza de pantalla
function clear_display {
    Clear-Host
}


#--------------------------------------------------------------------------------------------------------
# Ejecución del comanado para guardar en un fichero todos los comandos que tengan el verbo set
function get_commands_set {
    Get-Command -verb set | Select-Object -Property Name > C:\pruebas_scripts\fichero_script_9.txt
}


#--------------------------------------------------------------------------------------------------------
# Función para crear un directorio para almacenar los archivos relacionados con los scripts si no existe
function main {
    clear_display

    if (Test-Path C:\pruebas_scripts) {
        Write-Host 'Directorio creado anteriormente'
        
        get_commands_set
    }
    
    else {
        New-Item -Path C:\pruebas_scripts -ItemType Directory
        Write-Host 'Directorio creado'
    
        get_commands_set
    }
}


#--------------------------------------------------------------------------------------------------------
# Ejecución de la función principal "main"
If ($MyInvocation.InvocationName -ne '&') {
    main
}
