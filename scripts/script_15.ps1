#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Definición de variables
$script:parametro1=$Args[0]

$script:list_dir_path_recursive = 'C:\Windows'


#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Declaración de función para listar los directorios y subdirectorios de más de 2MB y último acceso en los últimos 7 días
function min_length_max_lastAccessTime {
    Get-ChildItem -Path $list_dir_path_recursive -Recurse -Force | Where-Object {($_.Length -gt 2MB) -and ($_.LastAccessTime -lt (Get-Date).AddDays(-7))} | Select-Object Name | Format-Wide -Column 3
}


#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Comprobación de que el script recibe o no parámetros
function main_s_15 {
    Invoke-Expression .\clear_display.ps1

    Invoke-Expression .\create_directory.ps1

    if ($null -eq $parametro1) {
        min_length_max_lastAccessTime
    }
    
    else {
        min_length_max_lastAccessTime > $dir_path\$parametro1.txt
    }
}


#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Ejecución de la función principal "main"
if ($MyInvocation.InvocationName -ne '&') {
    main_s_15
}
