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
# 
Get-ChildItem Env: > C:\pruebas_scripts\fichero_script_11.txt