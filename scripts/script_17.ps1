#--------------------------------------------------------------------------------
# Definición de variables
$script:dir_path = "C:\pruebas_scripts"

$script:file = "fichero_script_17.txt"


#--------------------------------------------------------------------------------
# Se muestra la fecha y hora del sistema
function show_date_hour {
    Get-Date
}


#--------------------------------------------------------------------------------
# Mostrar nombre y apellidos
function first_last_name {
    $first_name = "Juan Ramon"

    $last_name = "Rueda Lao"

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



function create_directory_if_not_exists {
    if (Test-Path $dir_path) {
        Write-Host 'El directorio' $dir_path "esta creado"
    }
    
    else {
        New-Item -Path $dir_path -ItemType Directory
        Write-Host 'Se ha creado el directorio' $dir_path
    }
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
    create_directory_if_not_exists

    main_s_17 > $dir_path\$file
}
