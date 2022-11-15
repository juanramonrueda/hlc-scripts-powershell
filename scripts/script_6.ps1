#----------------------------------------------------------------------------------------
# Limpieza de pantalla
Invoke-Expression .\clear_display.ps1


#----------------------------------------------------------------------------------------
# Declaración de variable factorial a 1 para que no multiplique por 0 en el bucle loop
$script:factorial = 1

$script:variable_1 = $Args[0]

#----------------------------------------------------------------------------------------
# Bucle loop que recorre el argumento dado hasta 1 y realiza el factorial
function main_s_6 {
    for ($numero = $variable_1; $numero -gt 0; $numero--) {
        $factorial = $factorial * $numero
    }

    Write-Host 'El factorial de' $variable_1 'es' $factorial
}


#--------------------------------------------------------------------------
# Ejecución de la función principal "main"
if ($MyInvocation.InvocationName -ne '&') {
    main_s_6
}
