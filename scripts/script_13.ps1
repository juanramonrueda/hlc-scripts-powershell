#--------------------------------------------------------------------------------------------------------------
# Definición de variables
$script:execute_files = C:\Windows\System32\*

$script:files_extension = '*.exe', '*.com'


#--------------------------------------------------------------------------------------------------------------
# Se muestra por pantalla los ejecutables, tanto *.exe como *.com de C:\Windows\System32 junto a sus atributos
function main_s_13 {
    Invoke-Expression .\clear_display.ps1

    Get-ChildItem -Path $execute_files -Include ($files_extension) | Select-Object Name,Mode,Length
}


#--------------------------------------------------------------------------------------------------------------
if ($MyInvocation.InvocationName -ne '&') {
    main_s_13
}
