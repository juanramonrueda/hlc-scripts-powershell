# -------------------------------------------------------------------------
# Declaración de variable factorial a 1 para que no sea 0
$Factorial = 1

# -------------------------------------------------------------------------
# Bucle loop que recorre el argumento dado hasta 1 y realiza el factorial
for ($numero = $Args[0]; $numero -gt 0; $numero--) 
{
    $Factorial = $Factorial * $numero
}

# -------------------------------------------------------------------------
# Se muestra el resultado de la factorización del número dado
Write-Host 'El factorial de' $Args[0] 'es' $Factorial