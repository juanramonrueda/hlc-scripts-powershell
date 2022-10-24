# -------------------------------------------------------------------------------
# Limpieza de pantalla
Clear-Host

# -------------------------------------------------------------------------------
# Petición de un número por pantalla
$numero = Read-Host 'Introduzca un numero para obtener su tabla de recorridopicar'

# -------------------------------------------------------------------------------
# Realización de la recorridoplicación y salida vistosa de la tabla de recorridoplicar
for ($recorrido = 1; $recorrido -le 10; $recorrido++) {
    $resultado = $recorrido * $numero
    Write-Host $recorrido 'x' $numero '=' $resultado
}