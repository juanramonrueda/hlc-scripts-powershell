# ------------------------------------------------------------------------------------------------
# Limpieza de pantalla
Clear-Host

# ------------------------------------------------------------------------------------------------
# Creación de un directorio para almacenar los archivos relacionados con los scripts si no existe
if (Test-Path ..\pruebas_scripts) {
    Write-Host 'Directorio creado anteriormente'
}
else {
    New-Item -Path ..\pruebas_scripts -ItemType Directory
}

# ------------------------------------------------------------------------------------------------
# Ejecución del comando para guardar en un fichero los comandos que empiezen por Process
Get-Command -Name *Process* > ..\pruebas_scripts\fichero_script_10.txt