#-----------------------------------------------------------------------------------
# Limpieza de pantalla
Invoke-Expression .\clear_display.ps1


#-----------------------------------------------------------------------------------
# Petición de los números al usuario en el script y comprobación de los números
function ask_numbers {
    [int]$script:numero_1 = Read-Host 'Introduzca el primer numero'

    while ($numero_1 -isnot [int]) {
        [int]$script:numero_1 = Read-Host 'Introduzca de nuevo el primer numero'
    }

    [int]$script:numero_2 = Read-Host 'Introduzca el segundo numero'

    while ($numero_2 -isnot [int]) {
        [int]$script:numero_2 = Read-Host 'Introduzca de nuevo el segundo numero'
    }
}



#-----------------------------------------------------------------------------------
# Comparación de qué número es mayor
function main_s_5a {
    ask_numbers

    if ($numero_1 -gt $numero_2) {
        $resultado = 'El numero ' + $numero_1 + ' es mayor que el numero ' + $numero_2
    }
    
    elseif ($numero_1 -lt $numero_2) {
        $resultado = 'El numero ' + $numero_2 + ' es mayor que el numero ' + $numero_1
    }
    
    else {
        $resultado = 'Los numeros son iguales'
    }

    return $resultado
}


# ----------------------------------------------------------------------------------
# Ejecución de la función principal "main"
if ($MyInvocation.InvocationName -ne '&') {
    main_s_5a
}
