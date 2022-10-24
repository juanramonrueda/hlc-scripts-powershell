# ----------------------------------------------------------------------------------------------------------------------------------
# Limpieza de pantalla
Clear-Host

# ----------------------------------------------------------------------------------------------------------------------------------
# Declaración de array con los meses del año
$nombre_mes = 'Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'

# ----------------------------------------------------------------------------------------------------------------------------------
# Petición de un mes mediante número y almacenamiento en variable
$numero_mes = Read-Host 'Introduce un numero del 1 al 12'

# ----------------------------------------------------------------------------------------------------------------------------------
# Comparación de la petición del usuario
switch ($numero_mes) {
    1 { $resultado = $nombre_mes[0] }
    2 { $resultado = $nombre_mes[1] }
    3 { $resultado = $nombre_mes[2] }
    4 { $resultado = $nombre_mes[3] }
    5 { $resultado = $nombre_mes[4] }
    6 { $resultado = $nombre_mes[5] }
    7 { $resultado = $nombre_mes[6] }
    8 { $resultado = $nombre_mes[7] }
    9 { $resultado = $nombre_mes[8] }
    10 { $resultado = $nombre_mes[9] }
    11 { $resultado = $nombre_mes[10] }
    12 { $resultado = $nombre_mes[11] }

    Default {$resultado = 'Valor equivocado'}
}

# ----------------------------------------------------------------------------------------------------------------------------------
# Muestra por pantalla el resultado del switch
Write-Host 'Es el mes' $resultado