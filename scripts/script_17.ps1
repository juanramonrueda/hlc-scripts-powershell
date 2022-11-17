#--------------------------------------------------------------------------------
# Definición de variables
$script:file = "fichero_script_17.txt"

$script:first_name = "Juan Ramon"

$script:last_name = "Rueda Lao"


#--------------------------------------------------------------------------------
# Se muestra la fecha y hora del sistema
function show_date_hour {
    Get-Date
}


#--------------------------------------------------------------------------------
# Mostrar nombre y apellidos
function first_last_name {
    $full_name = "$first_name $last_name"

    $full_name
}


#--------------------------------------------------------------------------------
# Mostrar variables del sistema y su contenido
function system_variables {
    Get-ChildItem Env:
}


#--------------------------------------------------------------------------------
# Procesos en ejecución
function get_active_processes {
    Get-Process
}


#--------------------------------------------------------------------------------
# Usuarios conectados en el sistema
function get_users_connected {
    Get-RDUserSession
}


#--------------------------------------------------------------------------------
# Configuración de red del equipo
function net_information {
    Get-NetIPConfiguration
}


#--------------------------------------------------------------------------------
# Tabla de rutas
function routing_table {
    Get-NetRoute
}


#--------------------------------------------------------------------------------
# Función principal
function main_s_17 {
    show_date_hour

    first_last_name

    system_variables

    get_active_processes

    get_users_connected

    net_information

    routing_table
}


#--------------------------------------------------------------------------------
# Ejecución de la función principal "main" y la función de chequeo de directorio
if ($MyInvocation.InvocationName -ne '&') {
    Invoke-Expression .\create_directory.ps1

    main_s_17 > $dir_path\$file
}
