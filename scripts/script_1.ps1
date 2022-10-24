# Limpieza de pantalla
Clear-Host

# ---------------------------------------------------------------------------
# Pregunta por el nombre del host y almacena el contenido en una variable
$nombre_host = Read-Host 'Introduzca su nombre'

# ---------------------------------------------------------------------------
# Muestra por pantalla un texto y la variable introducida por el usuario
Write-Host 'Hola' $nombre_host