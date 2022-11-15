#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Definición de variables
$script:parametro1=$Args[0]

$script:dir_path = "C:\pruebas_scripts"


#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Declaración de función para listar los directorios y subdirectorios de más de 2MB y último acceso en los últimos 7 días
function min_length_max_lastAccessTime {
    Get-ChildItem -Path C:\Windows -Recurse -Force | Where-Object {($_.Length -gt 2MB) -and ($_.LastAccessTime -lt (Get-Date).AddDays(-7))} | Select-Object Name | Format-Wide -Column 3
}

#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Comprobación de que el script recibe o no parámetros
function main_s_15 {
    if ($null -eq $parametro1) {
        
        min_length_max_lastAccessTime
    
    } else {
        
        if (Test-Path $dir_path) {
            Write-Host 'El directorio' $dir_path "esta creado"
        }
        
        else {
            New-Item -Path $dir_path -ItemType Directory
            Write-Host 'Se ha creado el directorio' $dir_path
        }
    
        min_length_max_lastAccessTime > $dir_path\$parametro1.txt
    }
}


#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Ejecución de la función principal "main"
if ($MyInvocation.InvocationName -ne '&') {
    main_s_15
}
