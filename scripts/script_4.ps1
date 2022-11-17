#-----------------------------------------------------------------------------
# Limpieza de pantalla
Invoke-Expression .\clear_display.ps1


#-----------------------------------------------------------------------------
# Definición en variable la suma de los argumentos pasados 
$script:suma = $Args[0] + $Args[1] + $Args[2]


#-----------------------------------------------------------------------------
# Se muestra por pantalla el resultado de la suma según los parámetros dados
function main_s_4 {

    Write-Host 'La suma es' $suma
}


#-----------------------------------------------------------------------------
# Ejecución de la función principal "main"
if ($MyInvocation.InvocationName -ne '&') {
    main_s_4
}
