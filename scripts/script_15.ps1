#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Definición de variables para el argumento
$parametro1=$Args[0]


#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Declaración de función para listar los directorios y subdirectorios de más de 2MB y último acceso en los últimos 7 días
function tamaño_acceso_directorios {
    Get-ChildItem -Path C:\Windows -Recurse -Force | Where-Object {($_.Length -gt 2MB) -and ($_.LastAccessTime -lt (Get-Date).AddDays(-7))} | Select-Object Name | Format-Wide -Column 3
}

#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Comprobación de que el script recibe o no parámetros
if ($null -eq $parametro1) {
    
    tamaño_acceso_directorios

} else {
    
    if (Test-Path C:\pruebas_scripts) {
        Write-Host 'Directorio creado anteriormente'
    }
    else {
        New-Item -Path C:\pruebas_scripts -ItemType Directory
        Write-Host 'Directorio creado'
    }

    tamaño_acceso_directorios > C:\pruebas_scripts\$parametro1.txt
}
