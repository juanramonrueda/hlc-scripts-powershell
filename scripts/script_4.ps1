#-----------------------------------------------------------------------------
# Limpieza de pantalla
Invoke-Expression .\clear_display.ps1


#-----------------------------------------------------------------------------
# Definición en variables de los argumentos pasados
$script:suma = $Args[0] + $Args[1] + $Args[2]


#-----------------------------------------------------------------------------
# Se muestra por pantalla el resultado de la suma según los parámetros dados
function main_s_4 {

    Write-Host 'La suma es' $suma
}


#-----------------------------------------------------------------------------
if ($MyInvocation.InvocationName -ne '&') {
    main_s_4
}
