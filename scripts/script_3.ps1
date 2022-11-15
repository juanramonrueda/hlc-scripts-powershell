#--------------------------------------------------------------------
# Limpieza de pantalla
Invoke-Expression .\clear_display.ps1

$script:parametro_1_s_3 = $Args[0]

#--------------------------------------------------------------------
# Comparación de la petición del usuario que se guarda en variable
function main_s_3 {
    switch ($parametro_1_s_3) {
        1 { $result = 'Enero' }
        2 { $result = 'Febrero' }
        3 { $result = 'Marzo' }
        4 { $result = 'Abril' }
        5 { $result = 'Mayo' }
        6 { $result = 'Junio' }
        7 { $result = 'Julio' }
        8 { $result = 'Agosto' }
        9 { $result = 'Septiembre' }
        10 { $result = 'Octubre' }
        11 { $result = 'Noviembre' }
        12 { $result = 'Diciembre' }
    
        Default {$result = 'Valor equivocado'}
    }
    
    return $result
}


#--------------------------------------------------------------------
# Ejecución de la función principal "main"
if ($MyInvocation.InvocationName -ne '&') {
    main_s_3
}