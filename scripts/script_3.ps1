# -------------------------------------------------------------------
# Limpieza de pantalla
Clear-Host

# -------------------------------------------------------------------
# Comparación de la petición del usuario que se guarda en variable
switch ($Args[0]) {
    1 { $resultado = 'Enero' }
    2 { $resultado = 'Febrero' }
    3 { $resultado = 'Marzo' }
    4 { $resultado = 'Abril' }
    5 { $resultado = 'Mayo' }
    6 { $resultado = 'Junio' }
    7 { $resultado = 'Julio' }
    8 { $resultado = 'Agosto' }
    9 { $resultado = 'Septiembre' }
    10 { $resultado = 'Octubre' }
    11 { $resultado = 'Noviembre' }
    12 { $resultado = 'Diciembre' }

    Default {$resultado = 'Valor equivocado'}
}

# -------------------------------------------------------------------
# Se muestra por pantalla el resultado del switch
Write-Host 'Es el mes' $resultado