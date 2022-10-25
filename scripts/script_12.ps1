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
    Write-Host 'Directorio creado'
}

# ------------------------------------------------------------------------------------------------
# Se obtienen los nombres de los ficheros .txt que hay en la raíz del sistema operativo
Get-ChildItem -Path C:\*.txt > ..\pruebas_scripts\fichero_script_12.txt