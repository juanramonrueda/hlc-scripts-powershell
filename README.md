# scripts-powershell-hlc

## Ejercicios de scripts de PowerShell del módulo de Horas de Libre Configuración

Iniciaremos creando un script al que llamaremos en todos los scripts restantes para hacer limpieza de pantalla usando el cmdlet **Clear-Host**. Normalmente la buena práctica es almacenar las instrucciones de cada script en funciones para agrupar y tener los elementos de cada script separados según su uso dentro del script.

### Script clear_display.ps1

Este script nos servirá para que tras llamar al script y justamente al inicio limpie la pantalla para que veamos los resultados de la ejecución de cada script.

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

Estableceremos la lista o array **$month_name** con los nombres de los meses de forma ordenada para luego hacer sin complicaciones la comparación. Tendremos que definir la variable como **$script:month_name** para que las funciones puedan usar la variable que se encuentra fuera. De esta forma hacemos que la variable "suba" de nivel en la jerarquía. A esta forma de definir variables se le llama **Scope** y hay varios tipos de scope como **script**, **global** y **local**.

Una vez hayamos completado la lista o array, crearemos la función **read_month_number** para pedir un número del 1 al 12 usando **Read-Host**, guardaremos el resultado en la variable **$month_number** a la que tendremos que hacer que tenga el mismo **Scope** que la variable **$month_name** para que pueda usarse en la siguiente función.

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

Crearemos la función

### script_8.ps1

C

#### Contenido del script

C

### script_9.ps1

C

#### Contenido del script

C

### script_10.ps1

C

#### Contenido del script

C

### script_11.ps1

C

#### Contenido del script

C

### script_12.ps1

Con este script crearemos un fichero o archivo que contendrá el nombre de todos los ficheros que tengan la estensión **.txt** en la raíz del sistema operativo **C:**.

#### Contenido del script

```powershell
$script:dir_path = "C:\pruebas_scripts"

$script:file = "fichero_script_12.txt"

function list_disk_c {
    Get-ChildItem -Name -Path C:\*.txt >  $dir_path\$file
}

function main_s_12 {
    Invoke-Expression .\clear_display.ps1

    if (Test-Path $dir_path) {
        Write-Host 'El directorio' $dir_path "esta creado"
    }
    
    else {
        New-Item -Path $dir_path -ItemType Directory
        Write-Host 'Se ha creado el directorio' $dir_path
    }

    list_disk_c
}

if ($MyInvocation.InvocationName -ne '&') {
    main_s_12
}
```

Empezaremos el script estableciendo dos variables que nos 

### script_13.ps1

C

#### Contenido del script

C

### script_14.ps1

C

#### Contenido del script

C

### script_15.ps1

C

#### Contenido del script

C

### script_16.ps1

C

#### Contenido del script

C

### script_17.ps1

C

#### Contenido del script

C