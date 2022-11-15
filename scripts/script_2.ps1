#-----------------------------------------------------------------------------------------------------------------------------------
# Limpieza de pantalla
Invoke-Expression .\clear_display.ps1


#-----------------------------------------------------------------------------------------------------------------------------------
# Declaración de array con los meses del año
$month_name = 'Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'


#-----------------------------------------------------------------------------------------------------------------------------------
# Petición de un mes mediante número y almacenamiento en variable
function read_month_number {
    $script:month_number = Read-Host 'Introduce un numero del 1 al 12'
}


#-----------------------------------------------------------------------------------------------------------------------------------
# Comparación de la petición del usuario
function main_s_2 {
    read_month_number

    switch ($month_number) {
        1 { $result = $month_name[0] }
        2 { $result = $month_name[1] }
        3 { $result = $month_name[2] }
        4 { $result = $month_name[3] }
        5 { $result = $month_name[4] }
        6 { $result = $month_name[5] }
        7 { $result = $month_name[6] }
        8 { $result = $month_name[7] }
        9 { $result = $month_name[8] }
        10 { $result = $month_name[9] }
        11 { $result = $month_name[10] }
        12 { $result = $month_name[11] }
    
        Default {$result = 'Valor equivocado'}
    }

    return $result
}


#-----------------------------------------------------------------------------------------------------------------------------------
# Ejecución de la función principal "main"
if ($MyInvocation.InvocationName -ne '&') {
    main_s_2
}
