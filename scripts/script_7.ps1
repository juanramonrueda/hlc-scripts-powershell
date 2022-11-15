#-------------------------------------------------------------------------------------------
# Limpieza de pantalla
Invoke-Expression .\clear_display.ps1


#-------------------------------------------------------------------------------------------
# Petición de un número por pantalla
function aks_for_number {
    $script:numero = Read-Host 'Introduzca un numero para obtener su tabla de multiplicar'
}


#-------------------------------------------------------------------------------------------
# Realización de la multiplicación y salida vistosa de la tabla de multiplicar
function main_s_7 {
    aks_for_number

    for ($recorrido = 1; $recorrido -le 10; $recorrido++) {
        $resultado = $recorrido * $numero
        Write-Host $recorrido 'x' $numero '=' $resultado
    }
}


#-------------------------------------------------------------------------------------------
# Ejecución de la función principal "main"
if ($MyInvocation.InvocationName -ne '&') {
    main_s_7
}
