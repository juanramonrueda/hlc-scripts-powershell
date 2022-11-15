#---------------------------------------------------------------------------------------------------
# Se muestran las variables del sistema
function system_vars {
    Get-ChildItem Env: > C:\pruebas_scripts\fichero_script_11.txt
}


#---------------------------------------------------------------------------------------------------
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

    system_vars
}


#---------------------------------------------------------------------------------------------------
# Ejecución del programa principal "main"
if ($MyInvocation.InvocationName -ne '&') {
    main
}
