# ----------------------------------------------------------------------------------
# Limpieza de pantalla
Clear-Host

# ----------------------------------------------------------------------------------
# Petición de los números al usuario en el script
$numero_1 = Read-Host 'Introduzca el primer numero'

$numero_2 = Read-Host 'Introduzca el segundo numero'

# ----------------------------------------------------------------------------------
# Comparación de qué número es mayor

if ($numero_1 -gt $numero_2) {
    $resultado = 'El numero ' + $numero_1 + ' es mayor que el numero ' + $numero_2
} elseif ($numero_1 -lt $numero_2) {
    $resultado = 'El numero ' + $numero_2 + ' es mayor que el numero ' + $numero_1
} else {
    $resultado = 'Los numeros son iguales'
}

# ----------------------------------------------------------------------------------
# Se muestra por pantalla el resultado de la comparación
Write-Host $resultado