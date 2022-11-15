#--------------------------------------------------------------------------------------
# Limpieza de pantalla
Invoke-Expression .\clear_display.ps1


#--------------------------------------------------------------------------------------
# Pregunta por el nombre del host y almacena el contenido en una variable para saludar
function main_s_1 {
    $nombre_host = Read-Host 'Introduzca su nombre'

    Write-Host 'Hola' $nombre_host
}


#--------------------------------------------------------------------------------------
# Ejecución de la función principal "main"
if ($MyInvocation.InvocationName -ne '&') {
    main_s_1
}