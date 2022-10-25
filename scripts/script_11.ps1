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
# 
Get-ChildItem Env: > ..\pruebas_scripts\fichero_script_11.txt