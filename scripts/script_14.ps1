#-------------------------------------------------------------------------------------------------------------------------------------------------------
# Conversión de un argumento a variable
$script:parametro1=$Args[0]


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
        if (Test-Path C:\pruebas_scripts) {
            Write-Host 'Directorio creado anteriormente'
        }

        else {
            New-Item -Path C:\pruebas_scripts -ItemType Directory
            Write-Host 'Directorio creado'
        }
    
        list_windows_group_extension > C:\pruebas_scripts\$parametro1.txt
    }
    
}

#-------------------------------------------------------------------------------------------------------------------------------------------------------
if ($MyInvocation.InvocationName -ne '&') {
    main_s_14
}