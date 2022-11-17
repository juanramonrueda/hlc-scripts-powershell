#--------------------------------------------------------------------------------------------
# Limpieza de pantalla
Invoke-Expression .\clear_display.ps1


#--------------------------------------------------------------------------------------------
# Definición de los argumentos a variables
$script:variable_1 = $Args[0]

$script:variable_2 = $Args[1]


#--------------------------------------------------------------------------------------------
# Comparación de los argumentos pasados para comparar qué número es mayor
function main_s_5b {
    if ($variable_1 -gt $variable_2) {
        $resultado = 'El numero ' + $variable_1 + ' es mayor que el numero ' + $variable_2
    }
    
    elseif ($variable_1 -lt $variable_2) {
        $resultado = 'El numero ' + $variable_2 + ' es mayor que el numero ' + $variable_1
    }
    
    elseif ($variable_1 -eq $variable_2) {
        $resultado = 'Los numeros son iguales'
    }

    else {
        $resultado = 'Ha introducido texto, por lo que no se puede hacer la comparación'
    }

    return $resultado
}

#--------------------------------------------------------------------------------------------
# Ejecución de la función principal "main"
if ($MyInvocation.InvocationName -ne '&') {
    main_s_5b
}