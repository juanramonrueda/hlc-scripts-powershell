#---------------------------------------------------------
# Limpieza de pantalla para la ejecución de los scripts
function clear_display {
    Clear-Host
}


#---------------------------------------------------------
# Ejecución de la limpieza de pantalla
if ($MyInvocation.InvocationName -ne '&') {
    clear_display
}