# ----------------------------------------------------------------------------------------------------------------------------------------------------
# Limpieza de pantalla
Clear-Host


# ----------------------------------------------------------------------------------------------------------------------------------------------------
# Conversión de parámetro a variable
$parametro1=$Args[0]

# ----------------------------------------------------------------------------------------------------------------------------------------------------
# Creación de función para:
# Pasar por tubería (pipe) el contenido del directorio listado para agruparlo por extensión para seleccionar campos, agrupar por nombre
# (extensión) y realizar una tabla de lo listado del directorio
function Obtener_tabla {
    Get-ChildItem -Path C:\Windows\System32 | Group-Object -Property Extension | Select-Object Count,Name | Sort-Object -Property Name | Format-Table
}


# ----------------------------------------------------------------------------------------------------------------------------------------------------
# Comprobación si hay parámetro dado al script, si recibe un parámetro, creará un .txt con el nombre del parámetro dado
if ($null -eq $parametro1) {
    Obtener_tabla
} else {
    if (Test-Path C:\pruebas_scripts) {
        Write-Host 'Directorio creado anteriormente'
    }
    else {
        New-Item -Path C:\pruebas_scripts -ItemType Directory
        Write-Host 'Directorio creado'
    }

    Obtener_tabla > C:\pruebas_scripts\$parametro1.txt
}