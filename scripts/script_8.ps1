#--------------------------------------------------------------------------------------------------------------------------
# Limpieza de pantalla
Invoke-Expression .\clear_display.ps1


#--------------------------------------------------------------------------------------------------------------------------
# Declaración de variable para iniciar el contador de posición a 0
$script:contador_posicion = 0


#--------------------------------------------------------------------------------------------------------------------------
# Petición de una palabra y conteo de letras que tiene
function ask_for_word {
    $script:palabra = Read-Host 'Introduzca una palabra para saber cual es la primera vocal y su posicion'

    $script:cantidad = $palabra.Length
}



#--------------------------------------------------------------------------------------------------------------------------
# Se recorre cada letra de la palabra introducida mediante un for y se usa substring para saber dónde está la vocal
function main_s_8 {
    ask_for_word

    for ($inicio = 0; $inicio -le $cantidad; $inicio++) {
    
        $contador_posicion = $contador_posicion + 1
        
        $letra = $palabra.Substring($inicio,1)
        
        if (($letra -eq 'a') -or ($letra -eq 'e') -or ($letra -eq 'i') -or ($letra -eq 'o') -or ($letra -eq 'u')) {
            Write-Host 'La primera vocal de la palabra' $palabra 'es la' $letra 'y su posicion es la' $contador_posicion
            break
        }
    }
}


#--------------------------------------------------------------------------------------------------------------------------
# Ejecución de la función principal "main"
if ($MyInvocation.InvocationName -ne '&') {
    main_s_8
}
