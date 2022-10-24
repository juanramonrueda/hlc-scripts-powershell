# ---------------------------------------------------------------------------------
# Limpieza de pantalla
Clear-Host

# ---------------------------------------------------------------------------------
# Comparación de los argumentos pasados para comparar qué número es mayor

if ($Args[0] -gt $Args[1]) {
    $resultado = 'El numero ' + $Args[0] + ' es mayor que el numero ' + $Args[1]
} elseif ($Args[0] -lt $Args[1]) {
    $resultado = 'El numero ' + $Args[1] + ' es mayor que el numero ' + $Args[0]
} else {
    $resultado = 'Los numeros son iguales'
}

# ---------------------------------------------------------------------------------
# Se muestra por pantalla el resultado de la comparación
Write-Host $resultado