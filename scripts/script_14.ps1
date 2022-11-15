#-------------------------------------------------------------------------------------------------------------------------------------------------------
# Definición de variables
$script:parametro1=$Args[0]

$script:dir_path = "C:\pruebas_scripts"


#-------------------------------------------------------------------------------------------------------------------------------------------------------
# Creación de función para agrupar por extensión y mostrar en forma de tabla
function list_windows_group_extension {
    Get-ChildItem -Path C:\Windows\System32 | Group-Object -Property Extension | Select-Object Count,Name | Sort-Object -Property Name | Format-Table
}


#-------------------------------------------------------------------------------------------------------------------------------------------------------
# Comprobación si hay parámetro dado al script, si recibe un parámetro, creará un .txt con el nombre del parámetro dado
function main_s_14 {
    Invoke-Expression .\clear_display.ps1

    if ($null -eq $parametro1) {
        list_windows_group_extension
    }
    
    else {
        if (Test-Path $dir_path) {
            Write-Host 'El directorio' $dir_path "está creado"
        }
        
        else {
            New-Item -Path $dir_path -ItemType Directory
            Write-Host 'Se ha creado el directorio' $dir_path
        }
    
        list_windows_group_extension > $dir_path\$parametro1.txt
    }
    
}

#-------------------------------------------------------------------------------------------------------------------------------------------------------
if ($MyInvocation.InvocationName -ne '&') {
    main_s_14
}