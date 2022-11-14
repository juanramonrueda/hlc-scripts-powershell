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
# Ejecución del comando para guardar en un fichero los comandos que empiezen por Process
Get-Command -Name *Process* > C:\pruebas_scripts\fichero_script_10.txt