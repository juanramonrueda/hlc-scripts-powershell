# -------------------------------------------------------------------------------------------------------------------
# Limpieza de pantalla
Clear-Host

# -------------------------------------------------------------------------------------------------------------------
# Declaración de variables necesarias
$contador_posicion = 0

# -------------------------------------------------------------------------------------------------------------------
# Petición de una palabra
$palabra = Read-Host 'Introduzca una palabra para saber cual es la primera vocal y su posicion'

# -------------------------------------------------------------------------------------------------------------------
# Compruebo cuantas letras tiene la palabra anterior y guardo la cantidad en una variable
$cantidad = $palabra.Length

# -------------------------------------------------------------------------------------------------------------------
# Se recorre cada letra de la palabra introducida mediante un for y se usa substring para saber dónde está la vocal
for ($inicio = 0; $inicio -le $cantidad; $inicio++) {
    
    $contador_posicion = $contador_posicion + 1
    
    $letra = $palabra.Substring($inicio,1)
    
    if (($letra -eq 'a') -or ($letra -eq 'e') -or ($letra -eq 'i') -or ($letra -eq 'o') -or ($letra -eq 'u')) {
        Write-Host 'La primera vocal de la palabra' $palabra 'es' $letra 'y su posicion es' $contador_posicion
        break
    }
    
}