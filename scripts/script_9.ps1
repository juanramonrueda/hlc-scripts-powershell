# ------------------------------------------------------------------------------------------------
# Limpieza de pantalla
Clear-Host

# ------------------------------------------------------------------------------------------------
# Creación de un directorio para almacenar los archivos relacionados con los scripts si no existe
if (Test-Path C:\pruebas_scripts) {
    Write-Host 'Directorio creado anteriormente'
}
else {
    New-Item -Path C:\pruebas_scripts -ItemType Directory
    Write-Host 'Directorio creado'
}


# ------------------------------------------------------------------------------------------------
# Ejecución del comanado para guardar en un fichero todos los comandos que tengan el verbo set

Get-Command -verb set > C:\pruebas_scripts\fichero_script_9.txt