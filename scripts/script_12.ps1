#-------------------------------------------------------------------------------------------------
# Creación de un directorio para almacenar los archivos relacionados con los scripts si no existe
function main_s_12 {
    Invoke-Expression .\clear_display.ps1

    if (Test-Path C:\pruebas_scripts) {
        Write-Host 'Directorio creado anteriormente'
    }
    
    else {
        New-Item -Path C:\pruebas_scripts -ItemType Directory
        Write-Host 'Directorio creado'
    }

    list_disk_c
}


#-------------------------------------------------------------------------------------------------
# Se obtienen los nombres de los ficheros .txt que hay en la raíz del sistema operativo
function list_disk_c {
    Get-ChildItem -Name -Path C:\*.txt > C:\pruebas_scripts\fichero_script_12.txt
}


#-------------------------------------------------------------------------------------------------
# Ejecución del programa principal "main"
if ($MyInvocation.InvocationName -ne '&') {
    main_s_12
}
