#-------------------------------------------------------------------------------------------------------------------------------------------------------
# Definición de variables
$script:parametro1=$Args[0]

$script:list_dir_s_14 = "C:\Windows\System32"


#-------------------------------------------------------------------------------------------------------------------------------------------------------
# Creación de función para agrupar por extensión y mostrar en forma de tabla
function list_windows_group_extension {
    Get-ChildItem -Path $list_dir_s_14 | Group-Object -Property Extension | Select-Object Count,Name | Sort-Object -Property Name | Format-Table
}


#-------------------------------------------------------------------------------------------------------------------------------------------------------
# Comprobación si hay parámetro dado al script, si recibe un parámetro, creará un .txt con el nombre del parámetro dado
function main_s_14 {
    Invoke-Expression .\clear_display.ps1

    if ($null -eq $parametro1) {
        list_windows_group_extension
    }
    
    else {
        Invoke-Expression .\create_directory.ps1
    
        list_windows_group_extension > $dir_path\$parametro1.txt
    }
}

#-------------------------------------------------------------------------------------------------------------------------------------------------------
if ($MyInvocation.InvocationName -ne '&') {
    main_s_14
}