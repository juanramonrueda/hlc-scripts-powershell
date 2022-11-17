# scripts-powershell-hlc

## Ejercicios de scripts de PowerShell del módulo de Horas de Libre Configuración

Iniciaremos creando dos scripts a los que llamaremos según la necesidad de los scripts que tengamos que hacer, los dos serán **clear_display.ps1** y **create_directory.ps1**. Los creamos por separado y los llamamos para no tener líneas de código repetidas en los scripts que las requieran, algo que no es muy vistoso y tampoco es una buena práctica siempre y cuándo podamos evitarla.

### clear_display.ps1

Este script nos servirá para que tras llamar al script y justamente al inicio limpie la pantalla para que veamos los resultados de la ejecución de los scripts que necesiten limpiar la pantalla para mostrar un resultado por ella y que se vea correctamente.

#### Contenido del script

```powershell
function clear_display {
    Clear-Host
}

if ($MyInvocation.InvocationName -ne '&') {
    clear_display
}
```

La función **clear_display** contiene el cmdlet **Clear-Host** que borra la pantalla, como está encerrado en una función, tenemos que llamar la función para que se ejecute. Para llamar a la función bien podemos poner únicamente el nombre de la función, pudiendo quedar de la siguiente manera:

```powershell
function clear_display {
    Clear-Host
}

clear_display
```

De esta manera llamamos a la función y hacemos que se ejecute en cuanto ejecutemos el script. De manera vistosa es mejor llamar a la función usando un condicional, **IF**, ya que nos permite "encerrar" la llamada a la función y queda mejor.

```powershell
if ($MyInvocation.InvocationName -ne '&') {
    clear_display
}
```

El boque de código llamará a la función, siempre que el nombre del script (**$MyInvocation.InvocationName**) no sea igual (**-ne**) al símbolo ampersand (**&**), hacemos esta condición ya que es muy poco probable que un script se llame de esta forma, por lo que llamará a la función que hemos definido sin algún problema.

### create_directory.ps1

Este script nos servirá para varios scripts más adelante para comprobar si un directorio existe para la ejecución de los scripts y guardar en dicho directorio las pruebas de los scripts y los resultados finales de cada ejecución de script que genere un archivo.

#### Contenido del script

```powershell
$global:dir_path = "C:\pruebas_scripts"


function main_create_directory {
    if (Test-Path $dir_path) {
        Write-Host 'El directorio' $dir_path "esta creado"
    }
    
    else {
        New-Item -Path $dir_path -ItemType Directory
        Write-Host 'Se ha creado el directorio' $dir_path
    }
}

if ($MyInvocation.InvocationName -ne '&') {
    main_create_directory
}
```

En algunos scripts concretos tendremos que llamar a este script para comprobar si existe el directorio **C:\pruebas_scripts** usando **Test-Path $dir_path** y en caso de que no exista lo crearemos con **New-Item**. Como la variable **$dir_path** la usaremos en otros scripts y para no tenerla repetida en cada uno de los scripts que la necesiten, haremos que tenga el scope **global**, que nos permite establecer dicha variable para usarla en distintos scripts siempre y cuando se llame al script, como si hubiesemos creado dicha variable en el sistema operativo y pudiesemos usarla cuando quisieramos, solo que se queda en este entorno de ejecución.

Más información sobre los ámbitos o scopes --> [Ámbitos / Scopes](https://learn.microsoft.com/es-es/powershell/module/microsoft.powershell.core/about/about_scopes?view=powershell-7.3)

### script_1.ps1

En este primer script tendremos que preguntar al usuario por su nombre y mostrar algo como "Hola Pepe" (según el nombre).

#### Contenido del script

```powershell
Invoke-Expression .\clear_display.ps1

function main_s_1 {
    $nombre_host = Read-Host 'Introduzca su nombre'

    Write-Host 'Hola' $nombre_host
}

if ($MyInvocation.InvocationName -ne '&') {
    main_s_1
}
```

Empezaremos llamando al script **clear_display.ps1** que se encuentra en el mismo nivel que los demás scripts, para ello usaremos el cmdlet **Invoke-Expression**, de esta forma antes de llegar a las funciones se borrará la pantalla y continuaremos con la carga en memoria principal de la función principal y su posterior ejecución.

A continuación definiremos la función **main_s_1** que nos permitirá tanto preguntar por el nombre del host usando el cmdlet **Read-Host** y guardar el resultado en una variable (**$nombre_host = Read-Host 'Introduzca su nombre'**) como mostrar el mensaje con el cmdlet **Write-Host** que queremos haciendo uso de esa variable (**Write-Host 'Hola' $nombre_host**).

Como hicimos con el script **clear_display.ps1** llamaremos a la función mediante el uso de la estructura **IF**.

### script_2.ps1

En este script estableceremos una lista o array en una variable para que cuando el usuario escriba un número del 1 al 12 salga por pantalla el nombre del mes que corresponde con ese número, por ejemplo, si el usuario introduce el número 11, tendrá que salir por pantalla el mes Noviembre.

#### Contenido del script

```powershell
Invoke-Expression .\clear_display.ps1

$script:month_name = 'Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'

function read_month_number {
    $script:month_number = Read-Host 'Introduce un numero del 1 al 12'
}

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

if ($MyInvocation.InvocationName -ne '&') {
    main_s_2
}
```

Estableceremos la lista o array **$month_name** con los nombres de los meses de forma ordenada para luego hacer sin complicaciones la comparación. Tendremos que definir la variable usando el scope **script** para que las funciones puedan usar la variable que se encuentra fuera. De esta forma hacemos que la variable "suba" de nivel en la jerarquía y se pueda usar dentro de las funciones del script.

Una vez hayamos completado la lista o array, crearemos la función **read_month_number** para pedir un número del 1 al 12 usando **Read-Host**, guardaremos el resultado en la variable **$month_number** a la que tendremos que hacer que tenga el mismo **scope** que la variable **$month_name** para que pueda usarse en la siguiente función.

La función principal **main_s_2** llamará a la función **read_month_number** y comparará el valor de la variable **$month_number** usando la estructura **Switch**. Esta estructura nos permite establecer una lista de comparación que se recorrerá para buscar el valor establecido en ella.

```powershell
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
```

El **switch** recibirá una variable, en este caso **$month_number** y comparará su contenido con la lista almacenada que tiene. Si la variable **$month_number** tiene el valor 5, irá recorriendo la lista de valor en valor hasta que llegue al 5, estableceremos para el valor 5 una variable, **$result** que almacenará el nombre del mes según su posición en la lista, hay que tener en cuenta que las posiciones de las listas o arrays empiezan siempre por 0. Si queremos que nos muestre el mes Abril, **tendremos que usar los corchetes junto a la posición que tiene en el array** teniendo que hacer:

> **Write-Host $month_name[3]**

De esta forma seleccionamos el tercer valor, empezando por **cero**, del array.

Al final de la estructura del **Switch** está **Default**, si se introduce un valor distinto a los establecidos en la lista, guardará en la variable el texto **Valor equivocado** ya que no se corresponde con ningún mes. Por último, devolveremos el contenido de la variable $result mediante **Return**, que se usa en la función para mostrar por pantalla el contenido de la variable, como si fuese **Write-Host**.

### script_3.ps1

Al igual que hicimos con el segundo script, compararemos con un array el valor que introduzca el usuario, **solo que esta vez será por argumento**, sin preguntar al usuario por el valor. Los argumentos son valores que se introducen junto al script antes de ejecutarlo, como el siguiente ejemplo:

> **.\script_3.ps1 Argumento1 Argumento2**

En el caso anterior, tanto **Argumento1** como **Argumento2** son argumentos que se pasarán junto a la ejecución del script, de forma que habrá una variable concreta que almacenará tanto **Argumento1** como **Argumento2** en distintas posiciones.

#### Contenido del script

```powershell
Invoke-Expression .\clear_display.ps1

$script:parametro_1_s_3 = $Args[0]

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

if ($MyInvocation.InvocationName -ne '&') {
    main_s_3
}
```

En este script tendremos que hacer uso de la variable **$Args** que almacena los valores pasados por argumento.

> **.\script_3.ps1 Argumento1 Argumento2**

La posición de Argumento1 es la 0, por lo que para hacer referencia a esa posición del array tenemos que usar los corchetes haciendo referencia a la posición 0.

Podemos usar la variable **$Args**, aunque lo mejor es almacenar el contenido de la posición de la variable en otra. Usaremos el scope **script** en la variable **$parametro_1_s_3** para pasar a la función principal el contenido de la variable.

Justo como hicimos con el script anterior, usaremos la estructura **Switch** para comparar, solo que esta vez tenemos que guardan en la variable de la lista, **$result**, el nombre del mes que corresponde.

### script_4.ps1

Este script realizará la operación matemática **suma** con tres números, en este caso **usaremos los argumentos** para realizar la operación.

#### Contenido del script

```powershell
Invoke-Expression .\clear_display.ps1

$script:suma = $Args[0] + $Args[1] + $Args[2]

function main_s_4 {

    Write-Host 'La suma es' $suma
}

if ($MyInvocation.InvocationName -ne '&') {
    main_s_4
}
```

De inicio necesitamos tres argumentos para el script, por lo que tendremos que hacer referencia a la variable **$Args** en las tres primeras posiciones de memoria. Crearemos la variable **$suma** con el scope **script** para usar la variable en la función principal y haremos la operación directamente en la variable usando las tres primeras posiciones de los argumentos.

Una vez tengamos la variable lista, crearemos la función principal que realizará la salida por pantalla de un mensaje con el resultado de la suma.

### script_5a.ps1

Tenemos que comparar dos números dados por el usuario, como hay que hacerlo mediante petición y mediante argumentos, tendremos que separar el ejercicio en dos scripts. En este primer script haremos la petición de los valores.

#### Contenido del script

```powershell
Invoke-Expression .\clear_display.ps1

function ask_numbers {
    [int]$script:numero_1 = Read-Host 'Introduzca el primer numero'

    while ($numero_1 -isnot [int]) {
        [int]$script:numero_1 = Read-Host 'Introduzca de nuevo el primer numero'
    }

    [int]$script:numero_2 = Read-Host 'Introduzca el segundo numero'

    while ($numero_2 -isnot [int]) {
        [int]$script:numero_2 = Read-Host 'Introduzca de nuevo el segundo numero'
    }
}

function main_s_5a {
    ask_numbers

    if ($numero_1 -gt $numero_2) {
        $resultado = 'El numero ' + $numero_1 + ' es mayor que el numero ' + $numero_2
    }
    
    elseif ($numero_1 -lt $numero_2) {
        $resultado = 'El numero ' + $numero_2 + ' es mayor que el numero ' + $numero_1
    }
    
    else {
        $resultado = 'Los numeros son iguales'
    }

    return $resultado
}

if ($MyInvocation.InvocationName -ne '&') {
    main_s_5a
}
```

Este script tiene cierta complejidad por el hecho de que se pueden introducir tanto números como cadenas de texto, por lo que tendremos que controlar el hecho de que el usuario de una forma u otra pueda introducir texto y hacer la comparación con dicho texto.

En la función **ask_numbers** pediremos por pantalla dos números que guardaremos en dos variables con el scope **script** y de tipo entero **[int]**, antes de la petición del segundo número comprobaremos si el "número" introducido es realmente un número o un texto, de hecho durante la ejecución del script dará un error de que no se puede "convertir" una cadena a un número, después de la notificación del error permitirá ejecutar la siguiente instrucción.

Para realizar dicha comparación, usaremos la estructura **WHILE** que nos permite que hasta que no se cumpla la condición, ejecute las instrucciones que se encuentran dentro del bucle.

```powershell
function ask_numbers {
    [int]$script:numero_1 = Read-Host 'Introduzca el primer numero'

    while ($numero_1 -isnot [int]) {
        [int]$script:numero_1 = Read-Host 'Introduzca de nuevo el primer numero'
    }
}
```

Como tenemos que saber el tipo de dato que hay en la variable **$numero_1**, inmediatamente después de almacenar el valor introducido en la variable, comprobaremos con **WHILE** que realmente es un número. Tenemos que usar la condición **$numero_1 -isnot [int]** para comprobar que el número guardado en la variable. Después si la condición es falsa, entrará al bucle y únicamente tenemos que volver a pedir un número dentro del bucle.

```powershell
function main_s_5a {
    ask_numbers

    if ($numero_1 -gt $numero_2) {
        $resultado = 'El numero ' + $numero_1 + ' es mayor que el numero ' + $numero_2
    }
    
    elseif ($numero_1 -lt $numero_2) {
        $resultado = 'El numero ' + $numero_2 + ' es mayor que el numero ' + $numero_1
    }
    
    else {
        $resultado = 'Los numeros son iguales'
    }

    return $resultado
}
```

Dentro de la función principal, llamaremos a la función de petición de números **ask_numbers** y haremos la comparación de los números con **IF**, para comparar si **$numero_1** es mayor que **$numero_2**, usaremos **-gt** y mostraremos un mensaje de que la condición se cumple, en caso de no darse, usaremos **ELSEIF** para realizar otra comparación, en este caso si **$numero_1** es menor que **$numero_2** usando **-lt** y con su posterior mensaje de confirmación de la condición. Por último usaremos **ELSE** que nos sirve para que sí ninguna de las condiciones anteriores se cumple, muestre un mensaje con la única condición que no hemos puesto explicitamente, que ambos números son iguales.

Como hicimos en scripts anteriores, los mensajes de confirmación los guardaremos en variables y usaremos **RETURN** para mostrarlos.

### script_5b.ps1

Al igual que el script anterior, tendremos que realizar la comparación de dos números, solo que esta vez es mediante argumento, de modo que no podremos controlar correctamente el tipo de valor que se introducen en las variables de los argumentos, de forma que tendremos que realizar el script de otra forma.

#### Contenido del script

```powershell
Invoke-Expression .\clear_display.ps1

$script:variable_1 = $Args[0]

$script:variable_2 = $Args[1]

function main_s_5b {
    
    if (($variable_1 -isnot [int]) -and ($variable_2 -is [int])) {
        $resultado = 'El primer argumento pasado es una cadena de texto o contiene letras' 
    }
    
    elseif (($variable_2 -isnot [int]) -and ($variable_1 -is [int])) {
        $resultado = 'El segundo argumento pasado es una cadena de texto o contiene letras'
    }

    elseif (($variable_1 -is [int]) -and ($variable_2 -is [int])) {
        if ($variable_1 -gt $variable_2) {
            $resultado = 'El numero ' + $variable_1 + ' es mayor que el numero ' + $variable_2
        }
        
        elseif ($variable_1 -lt $variable_2) {
            $resultado = 'El numero ' + $variable_2 + ' es mayor que el numero ' + $variable_1
        }
        
        else {
            $resultado = 'Los numeros son iguales'
        }
    }

    else {
        $resultado = 'Ambos argumentos son cadenas de texto o contienen letras'
    }

    return $resultado
}

if ($MyInvocation.InvocationName -ne '&') {
    main_s_5b
}
```

Antes de nada, pasaremos el contenido de las dos primeras posiciones de los argumentos a dos variables con el scope **script** para que la función principal lea ambos valores. Este script también tiene su complejidad para controlar los tipos de datos introducidos.

```powershell
if (($variable_1 -isnot [int]) -and ($variable_2 -is [int])) {
        $resultado = 'El primer argumento pasado es una cadena de texto o contiene letras' 
}
```

Empezaremos comprobando si alguno de los argumentos o ambos son cadenas de texto o contienen letras, para ello, usaremos **IF**, de forma que tenemos que comprobar ambos tipos de datos usando **AND**, de forma que para que entre a la condición de **AND**, ambas condiciones tienen que ser verdaderas, por lo que **$variable_1** no es un número y **$variable_2** sí que es un número. Haremos lo mismo para comprobar si **$variable_2** no es un número y **$variable_1** si que es un número.

```powershell
elseif (($variable_1 -is [int]) -and ($variable_2 -is [int])) {
        if ($variable_1 -gt $variable_2) {
            $resultado = 'El numero ' + $variable_1 + ' es mayor que el numero ' + $variable_2
        }
        
        elseif ($variable_1 -lt $variable_2) {
            $resultado = 'El numero ' + $variable_2 + ' es mayor que el numero ' + $variable_1
        }
        
        else {
            $resultado = 'Los numeros son iguales'
        }
    }
```

Después comprobaremos que ambos argumentos son efectivamente números, de forma que cambiaremos la condición y que en el caso de que se de, entre a un **IF** anidado para comprobar si un número es mayor que otro o ambos son iguales. Para finalizar, en el primer **IF**, usaremos **ELSE** para informar al usuario de que ambos argumentos son cadenas de texto o letras.

### script_6.ps1

Con este script realizaremos el factorial de un número, que es la multiplicación sucesiva de los números empezando desde el número del que queremos obtener el factorial hasta el número 1. La introducción del número será mediante argumento.

Para saber más pincha en el enlace --> [Factorial de un número](https://es.wikipedia.org/wiki/Factorial)

#### Contenido del script

```powershell
Invoke-Expression .\clear_display.ps1

$script:factorial = 1

$script:variable_1 = $Args[0]

function main_s_6 {
    for ($numero = $variable_1; $numero -gt 0; $numero--) {
        $factorial = $factorial * $numero
    }

    Write-Host 'El factorial de' $variable_1 'es' $factorial
}

if ($MyInvocation.InvocationName -ne '&') {
    main_s_6
}
```

Como el factorial de 0 y el factorial de 1 tienen que dar como resultado 1, inicializaremos la variable **$script:factorial** a 1, después pasaremos la primera posición del argumento a una variable que usaremos posteriormente.

Crearemos la función principal y usaremos la estructura **FOR** para recorrer desde el número introducido por argumento hasta el número 1.

```powershell
for ($numero = $variable_1; $numero -gt 0; $numero--) {
        $factorial = $factorial * $numero
    }
```

Crearemos una variable para FOR que será **$numero** y su valor será el mismo que el de la variable que contiene el valor introducido por argumento, después tenemos que indicar hasta dónde tiene que llegar, en este caso tiene que parar en el número 1, por lo que será **$numero -gt 0** y para que el bucle funcione correctamente, tendremos que decrementar el número de 1 en 1, si se pasa por argumento el número 2, la primera iteración del bucle comenzará por el número 2, la segunda iteración será el número 1 y acabará ya que estamos indicando que finalice antes de llegar al número 0.

Dentro del bucle, en la variable **$factorial** almacenaremos la inicialización de la variable, el número 1, y multiplicará por la iteración que haya en ese momento en el bucle, de forma que realizará el factorial del número correspondiente.

Si se introdujera el número 1 o el número 0, no entraría al bucle **FOR** y por tanto el resultado sería la inicialización de la variable, de forma que usaremos la variable **$factorial** tanto para inicializarla a 1 como para realizar las operaciones correspondientes.

### script_7.ps1

En este script realiaremos la tabla de multiplicar de un número que nos indique el usuario mediante petición por pantalla.

#### Contenido del script

```powershell
Invoke-Expression .\clear_display.ps1

function aks_for_number {
    $script:numero = Read-Host 'Introduzca un numero para obtener su tabla de multiplicar'
}

function main_s_7 {
    aks_for_number

    for ($recorrido = 1; $recorrido -le 10; $recorrido++) {
        $resultado = $recorrido * $numero
        Write-Host $recorrido 'x' $numero '=' $resultado
    }
}

if ($MyInvocation.InvocationName -ne '&') {
    main_s_7
}
```

Crearemos la función **ask_for_number** de la misma forma que hemos hecho en scripts anteriores, tendremos que usar el scope **script** para la variable.

Crearemos la función principal que llamará a la función **ask_for_number** y tendrá un for que recorrerá desde el número 1 hasta el número 10, de forma que multiplicaremos la iteración del bucle con el número que introduzca el usuario. Mostraremos el resultado de forma vistosa para que muestre la variable de la iteración el número y el resultado.

### script_8.ps1

Con este script tendremos que preguntar al usuario por una palabra y tenemos que localizar la primera vocal de esa palabra y la posición que tiene en esa palabra.

#### Contenido del script

```powershell
Invoke-Expression .\clear_display.ps1

$script:contador_posicion = 0

function ask_for_word {
    $script:palabra = Read-Host 'Introduzca una palabra para saber cual es la primera vocal y su posicion'

    $script:cantidad = $palabra.Length
}

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

if ($MyInvocation.InvocationName -ne '&') {
    main_s_8
}
```

Crearemos una variable, **$contador_posicion**, para contar la posición de las letras y la inicializaremos a 0, tendrá que tener el scope **script** para que se pueda usar en funciones. Crearemos una función para preguntar por una palabra y además, crearemos una variable que almacenará la cantidad de caracteres que tiene la palabra usando **LENGTH**.

```powershell
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
```

Por último, crearemos la función principal que llamará a la función **ask_for_word**. Como tenemos que recorrer la palabra para saber dónde está la primera vocal, usaremos la estructura **FOR** para usar **SUBSTRING** dentro del bucle y poder obtener la primera vocal. Iniciaremos el bucle a 0 y haremos que llegue hasta la cantidad total de letras que tiene la palabra.

```powershell
$contador_posicion = $contador_posicion + 1
        
$letra = $palabra.Substring($inicio,1)

```

Dentro del bucle tenemos que actualizar la variable **$contador_posicion** que la tenemos inicializada a 0, por lo que en cuando empiece la iteración, la variable tendrá el valor 1. Crearemos una variable nueva, **$letra** que almacenará una letra de la palabra introducida según la iteración del bucle usando **SUBSTRING**. Con **SUBSTRING** le damos como primer parámetro la posición de la letra que queremos obtener y el segundo parámetro la cantidad de letras que queremos obtener, en este caso 1.

Si introducimos la palabra *Prueba*, usando la estructura anterior, la primera iteración del bucle tendrá en la variable **$inicio** el valor 0, teniendo **palabra.substring(0,1)**, en la variable **$letra** almacenará la letra **P**, después en la segunda iteración, la variable **$inicio** tendrá el valor 1 y será **palabra.substring(1,1)** de forma que en la variable **$letra** almcenará la letra **r**.

De esta forma irá sacando letra a letra de la palabra introducida, necesitaremos usar **IF** para comparar la letra que hay en la variable con alguna de las vocales que tenemos.

```powershell
if (($letra -eq 'a') -or ($letra -eq 'e') -or ($letra -eq 'i') -or ($letra -eq 'o') -or ($letra -eq 'u')) {
            Write-Host 'La primera vocal de la palabra' $palabra 'es la' $letra 'y su posicion es la' $contador_posicion
            break
}
```

En cada letra de la palabra iremos comprobando que sea una vocal o una consonante, usaremos dentro del **IF** el **OR** para que si se da al menos una de las condiciones establecidas en el **IF**, entre dentro del **IF** y mostraremos la vocal que hay en **$letra** y la posición de la vocal usando la variable **$contador_palabra**. Usaremos **BREAK** para finalizar el bucle **FOR** después de mostrar el mensaje.

### script_9.ps1

Crearemos un script para almacenar en un fichero la lista de comandos que tiene PowerShell que empiecen por **SET**. No mostraremos nada por pantalla, por lo que no tendremos que hacer uso del script **clear_display.ps1**, en cambio, tendremos que llamar al script **create_directory.ps1** para comprobar si el directorio que hemos establecido en ese script está creado o hay que crearlo.

#### Contenido del script

```powershell
$script:file = "fichero_script_9.txt"

function main_s_9 {
    Invoke-Expression .\create_directory.ps1

    Get-Command -verb set | Select-Object -Property Name > $dir_path\$file
}

If ($MyInvocation.InvocationName -ne '&') {
    main_s_9
}
```

Estableceremos una variable que nos servirá para crear un fichero o archivo con el nombre que contiene la variable, necesitaremos que tenga el scope **script**. 

Crearemos la función principal y llamaremos al script **create_directory.ps1** mediante **Invoke-Expression** para comprobar si tenemos el directorio creado o no y en caso de que no esté creado, crearlo. Usaremos el cmdlet **Get-Command** con el modificador **-Verb** para indicar que queremos que nos muestre los cmdlet que empiezan por **SET**, después pasaremos por **tubería** o **pipe** al cmdlet **Select-Object** para seleccionar lo que queremos que nos muestre **Get-Command**, en este caso queremos que nos muestre únicamente la columna **Nombre**, por lo que usaremos el modificador **-Property** junto a Name y mediante una redirección destructiva **>** pasamos la instrucción a la ruta que tenemos guardada en la variable **$dir_path** que creamos en el script **create_directory.ps1** y el fichero que hemos establecido mediante variable para crear el archivo o fichero y machacar el contenido que tuviese si estaba creado anteriormente.

### script_10.ps1

De igual forma que hicimos en el script anterior, tenemos que crear un script para almacenar los comandos que tengan el nombre **Process** en un fichero.

#### Contenido del script

```powershell
$script:file = "fichero_script_10.txt"

function main_s_10 {
    Invoke-Expression .\create_directory.ps1

    Get-Command -Name *-Process* | Select-Object -Property Name > $dir_path\$file
}

if ($MyInvocation.InvocationName -ne '&') {
    main_s_10
}
```

Podemos reciclar la estructura del script anterior, salvo el comando de la función principal, usaremos de nuevo el cmdlet **Get-Command** con el modificador **-Name** y usaremos comodines para este script, el **asterísco \*** nos sirve para uno o varios caracteres y como nos interesa los que empiezan por **Process**, tenemos que usar \*-Process\*.

### script_11.ps1

En este siguiente script obtendremos en un fichero las variables del sistemas y su contenido, este script principalmente es para ejecutarlo en un **Windows Server**, y se puede ejecutar en cualquier Windows.

#### Contenido del script

```powershell
$script:file = "fichero_script_11.txt"

function main_s_11 {
    Invoke-Expression .\create_directory.ps1

    Get-ChildItem Env: > $dir_path\$file
}

if ($MyInvocation.InvocationName -ne '&') {
    main_s_11
}
```

Como la estructura es igual que en los dos script anteriores, pasaremos al comando que nos permite obtener las variables del sistema junto a su contenido. Useremos el cmdlet **Get-ChildItem** para listar las variables usando **Env:** para mostrar las variables y pasarlas mediante redirección destructiva a la ruta y fichero establecidos.

### script_12.ps1

Con este script crearemos un fichero o archivo que contendrá el nombre de todos los ficheros que tengan la estensión **.txt** en la raíz del sistema operativo **C:**.

#### Contenido del script

```powershell
$script:file = "fichero_script_12.txt"

function main_s_12 {
    Invoke-Expression .\create_directory.ps1

    Get-ChildItem -Name -Path $list_dir >  $dir_path\$file
}

if ($MyInvocation.InvocationName -ne '&') {
    main_s_12
}
```

Como tenemos que pasar a un fichero el listado de ficheros con la extensión **.txt** que hay en la raíz del usuario. Crearemos un par de ficheros con dicha extensión para realizar la prueba del script.

Crearemos una variable, **$list_dir** que contendrá la ruta del directorio y usaremos **\*.txt** para mostrar cualquier fichero que tenga la extensión **.txt**, usaremos el cmdlet **Get-ChildItem** para listar el contenido con el modificador **-Name** para mostrar únicamente los nombres de los archivos y **-Path** para usar la variable **$list_dir** y pasar la salida de pantalla al fichero mediante redirección destructiva.

### script_13.ps1

Este script servirá para mostrar todos los ficheros ejecutables que tengan la extensión **.exe** y **.com**, con su nombre, tamaño y si son de son de solo lectura. Como no tenemos que pasar el contenido a un fichero, tendremos que limpiar la pantalla antes de mostrar los resultados.

#### Contenido del script

```powershell
$script:execute_files = 'C:\Windows\System32\*'

$script:files_extensions = '*.exe', '*.com'

function main_s_13 {
    Invoke-Expression .\clear_display.ps1

    Get-ChildItem -Path $execute_files -Include ($files_extensions) | Select-Object Name,Mode,Length
}

if ($MyInvocation.InvocationName -ne '&') {
    main_s_13
}
```

Inicializaremos dos variables que contendrán la ruta de ejecución, **$execute_files** y las extensiones, **$files_extensions** para listar todos los archivos que son ejecutables.

Es un script bastante simple, crearemos la función principal y llamaremos al script de limpieza de pantalla mediante **Invoke-Expression**, de nuevo usaremos el cmdlet **Get-ChildItem** con el modificador **-Path $execute_files** estableceremos la ruta de ejecución del cmdlet y con **-Include ($files_extensions**) buscaremos por las extensiones que tenemos definidas en la variable. Pasaremos el resultado mediante **tubería** o **pipe** a **Select-Object** para que nos muestre únicamente las propiedades **Name** (nombre), **Mode** (atributos) y **Length** (tamaño).

### script_14.ps1

Tenemos que realizar un script que liste en una tabla la cantidad de archivos que hay de cada extensión y ordenados por esta misma, tenemos que tener en cuenta que si no se recibe argumento, la salida será por pantalla, en caso de recibir un argumento, tendremos que pasar la salida a un fichero con el mismo nombre que el argumento pasado y la extensión **.txt**.

#### Contenido del script

```powershell
$script:parametro1=$Args[0]

$script:dir_path = "C:\pruebas_scripts"

function list_windows_group_extension {
    Get-ChildItem -Path C:\Windows\System32 | Group-Object -Property Extension | Select-Object Count,Name | Sort-Object -Property Name | Format-Table
}

function main_s_14 {
    Invoke-Expression .\clear_display.ps1

    if ($null -eq $parametro1) {
        list_windows_group_extension
    }
    
    else {
        Invoke-Expression .\create_directory.ps1
    
        list_windows_group_extension > $dir_path\$parametro1.txt
    }
}

if ($MyInvocation.InvocationName -ne '&') {
    main_s_14
}
```

Este script es algo complejo por el hecho de que necesitamos hacer algún tipo de referencia de que el argumento pasado es nulo, que no tiene valor almacenado. Almacenaremos en una variable la primera posición de los argumentos y crearemos otra variable para establecer la ruta en la que listaremos.

Crearemos la función **list_windows_group_extension** que nos listará todos los archivos agrupados por extensión y con formato de tabla. Para listar los archivos, tenemos que usar el cmdlet **Get-ChildItem**, después pasaremos mediante **pipe** el resultado a **Group-Object** que nos permitirá agrupar por extensión de archivo usando **-Property Extension**, después volveremos a usar un **pipe** para pasar el resultado a **Select-Object** para mostrar únicamente la cantidad de archivos con esa extensión (**Count**) y el nombre de extensión (**Name**), de nuevo usaremos un **pipe** para pasar el resultado a **Sort-Object** que nos permitirá ordenar por extensión usando **-Property Name** y finalmente usaremos otro **pipe** para pasar todo a **Format-Table** y le formato de tabla.

```powershell
if ($null -eq $parametro1) {
    list_windows_group_extension
}
```

Para que haga salida por pantalla sin pasar argumentos, necesitaremos usar **IF** con la condición **$null -eq $parametro1**. Esta condición nos permitirá comprobar si la variable donde almacenamos el primer argumento tiene un valor o no, usaremos la variable **$null** que no contiene valor y haremos una comparación de igualdad con la variable **$parametro1**.

En caso de no tener valor **$parametro1**, realizará la salida por pantalla, en caso contrario creará un directorio y usaremos la redirección destructiva con la función que tiene el comando para realizar el listado de agrupación por extensión y generar un archivo con el nombre de la variable **$parametro1** y guardar en dicho archivo el comando de listado.

### script_15.ps1

Como hicimos con el script anterior, tendremos que listar en tres columnas los archivos de C:\Windows y subdirectorios que tengan más de 2MB de tamaño y su tiempo de acceso sea en los últimos 7 días, si se pasa un argumento, generará un archivo con el nombre del argumento, en caso contrario realizará la salida por pantalla.

#### Contenido del script

```powershell
$script:parametro1=$Args[0]

$script:list_dir_path_recursive = 'C:\Windows'

function min_length_max_lastAccessTime {
    Get-ChildItem -Path $list_dir_path_recursive -Recurse -Force | Where-Object {($_.Length -gt 2MB) -and ($_.LastAccessTime -lt (Get-Date).AddDays(-7))} | Select-Object Name | Format-Wide -Column 3
}

function main_s_15 {
    Invoke-Expression .\clear_display.ps1

    Invoke-Expression .\create_directory.ps1

    if ($null -eq $parametro1) {
        min_length_max_lastAccessTime
    }
    
    else {
        min_length_max_lastAccessTime > $dir_path\$parametro1.txt
    }
}

if ($MyInvocation.InvocationName -ne '&') {
    main_s_15
}
```

Usaremos gran parte de la estructura del script anterior, de forma que tenemos que crear una variable más en la que estableceremos la ruta en la que listaremos los archivos que necesitamos para el script. Tenemos que tener en cuenta que vamos a usar los dos scripts que hemos creado al principio y debemos hacer un buen uso del orden de ejecución ya que los scripts son secuenciales, leen el código de arriba hacia abajo y si hubiesemos cambiado el orden de **Invoke-Expression .\clear_display.ps1** e **Invoke-Expression .\create_directory.ps1**, habríamos borrado el mensaje del script **create_directory.ps1**.

```powershell
function min_length_max_lastAccessTime {
    Get-ChildItem -Path $list_dir_path_recursive -Recurse -Force | Where-Object {($_.Length -gt 2MB) -and ($_.LastAccessTime -lt (Get-Date).AddDays(-7))} | Select-Object Name | Format-Wide -Column 3
}
```

Para listar contenido usaremos **Get-ChildItem**, necesitaremos usar los modificadores **-Path**, **-Recurse** y **-Force**, el segundo modificador nos permite buscar en los subdirectorios de la ruta y con el tercer modificador forzamos a que nos muestre más resultados ya que nos darán algunos errores y sin **-Force** apenas tendremos resultados. Después pasaremos los resultados mediante **pipe** a **Where-Object** que nos permite filtrar por los parámetros que nosotros queremos, para el tamaño de los archivos necesitaremos **Length** y para el último tiempo de acceso necesitaremos **LastAccessTime**. Para hacer la comparación, tenemos que usar **curly brackets {}** que contendrán la comparación completa y **round brackets ()** para separar individualmente las comparaciones.

```powershell
Where-Object {($_.Length -gt 2MB) -and ($_.LastAccessTime -lt (Get-Date).AddDays(-7))}
```

Empezaremos primero por el tamaño, **Length**, tenemos que usar **$_.Length** para hacer referencia al tamaño y con **$_.Length -gt 2MB** hacemos referencia a los archivos que tengan un tamaño superior a 2MB. Después tendremos que realizar un apaño para que nos muestre los archivos que tengan un tiempo de acceso menor a 7 días. Para ello, usaremos la fecha actual con **Get-Date** y restaremos 7 días usando **AddDays(-7)** y tendremos que hacer que **$_.LastAccessTime** sea menor que los 7 días que hemos restado de la fecha actual.

Una vez tengamos la comparación, pasaremos el resultado del listado, **Get-ChildItem** y el filtrado, **Where-Object**, a **Select-Object** para mostrar únicamente los nombres de los archivos que cumplan con las características requeridas y después pasamos el resultado a **Format-Wide** que nos permite formatear la salida en tres columnas usando el modificador **-Column**.

### script_16.ps1

Este script nos servirá para listar los procesos que están en ejecución en la máquina ordenados de forma descendente por el uso de CPU y en vez de sacar los resultados por pantalla, lo haremos a un archivo con formato CSV.

Más info del formato CSV --> [Formato CSV](https://www.geeknetic.es/Archivo-CSV/que-es-y-para-que-sirve)

#### Contenido del script

```powershell
$script:file = "fichero_script_16.csv"

function main_s_16 {
    Invoke-Expression .\create_directory.ps1

    Get-Process | Sort-Object -Property CPU -Descending | Export-Csv -Path $dir_path\$file -Delimiter ';'
}

if ($MyInvocation.InvocationName -ne '&') {
    main_s_16
}
```

Tenemos que listar los procesos en ejecución por orden de uso de CPU de forma descendente y pasar la salida a un fichero o archivo, necesitaremos establecer una variable que contendrá el nombre del archivo con formato **.csv** hacer uso del script **create_directory.ps1** dentro de la función principal realizaremos la instrucción para ejecutar este script y que cumpla con los requisitos pedidos.

```powershell
Get-Process | Sort-Object -Property CPU -Descending | Export-Csv -Path $dir_path\$file -Delimiter ';'
```

Para listar los procesos en ejecución, tenemos que usar el cmdlet **Get-Process** que pasaremos mediante **pipe** a **Sort-Object** y haremos la ordenación mediante el campo **CPU** y el modificador **-Descending**, después el resultado lo volveremos a pasar mediante **pipe** al cmdlet **Export-Csv** indicando el Path mediante variables y usaremos el modificador **-Delimiter** que separará los campos usando el símbolo o signo de puntuación que queramos, en mi caso usaré el **semicolon** o **punto y coma**.

### script_17.ps1

Para finalizar con los scripts, tendremos que crear un script que pase la siguiente información a un fichero:
    
    a) Fecha y hora del sistema
    b) Nombre y apellidos
    c) Variables del sistema
    d) Procesos en ejecución
    e) Usuarios conectados en el sistema
    f) Información de configuración de la red ip, mask, interfaces
    g) Información de la tabla de enrutado

#### Contenido del script

```powershell
$script:file = "fichero_script_17.txt"

function show_date_hour {
    Get-Date
}

function first_last_name {
    $first_name = "Juan Ramon"

    $last_name = "Rueda Lao"

    $full_name = "$first_name $last_name"

    $full_name
}

function system_variables {
    Get-ChildItem Env:
}

function get_active_processes {
    Get-Process
}

function get_users_connected {
    Get-RDUserSession
}

function net_information {
    Get-NetIPConfiguration
}

function routing_table {
    Get-NetRoute
}

function main_s_17 {
    show_date_hour

    first_last_name

    system_variables

    get_active_processes

    get_users_connected

    net_information

    routing_table
}

if ($MyInvocation.InvocationName -ne '&') {
    Invoke-Expression .\create_directory.ps1

    main_s_17 > $dir_path\$file
}
```

Este script, más que complicado, es largo y sencillo y como nos piden cosas distintas, es el ejemplo perfecto sobre el uso de funciones dentro del mismo para separar distintas instrucciones de las demás ya que hacen cosas distintas independientemente del cmdlet usado.

Estableceremos la variable con el nombre del archivo para crear el archivo que contendrá toda la información pedida y un par de variables más con nuestro nombre y apellidos. Empezaremos con la función **show_date_hour** que nos servirá para mostrar tanto la hora como la fecha actual.

La función **first_last_name** mostrará tanto el nombre como los apellidos, en este caso míos mediante uso de variables. Crearemos dentro de la función una variable **$full_name** que usará las dos que hemos establecido al principio del script, **$first_name** y **$last_name**, tenemos que tener en cuenta que para concatenar las dos variables y que dejen un espacio en medio, las tenemos que "contener" dentro de **quotations marks** o **comillas** para que realice correctamente la concatenación de ambas variables. Después, haremos referencia a la variable **$full_name**.

La tercera función es una que hemos usado, listaremos las variables del sistema y su contenido.

Con la cuarta función pasa lo mismo, hemos usado el cmdlet **Get-Process** para listar los procesos en ejecución.

La quinta función es algo problemática ya que no la podemos usar en los clientes Windows, ya que su principal cometido es de informar de los usuarios que han establecido sesiones remotas en el servidor. El cmdlet a usar el **Get-RDUserSession**.

La sexta función nos permite listar la configuración de red de nuestro equipo usando el cmdlet Get-NetIPConfiguration.

La séptima función nos mostrará la tabla de rutas de nuestro equipo mediante el cmdlet **Get-NetRoute**.

Todas las funciones anteriores las juntaremos en una función principal que será la que llame a las demás.

```powershell
if ($MyInvocation.InvocationName -ne '&') {
    Invoke-Expression .\create_directory.ps1

    main_s_17 > $dir_path\$file
}
```

Este script es especial ya que usaremos nuestra estructura de llamada para invocar al script **create_directory.ps1** y que la función principal, **main_s_17**, haga la redirección destructiva de la ejecución de los scripts para crear el archivo o machacar su contenido si ya existía antes el archivo.