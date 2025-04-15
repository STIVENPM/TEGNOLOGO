/*
 	name exercise: THREE
	description: 
 	autor: STIVEN
 	Date: 20 of march of 2025
Ejercicio 3: Realizar las tablas de multiplicar de 1 hasta el 5, y multiplique
hasta 5. Debe imprimir los siguientes resultados.
1 x 1 = 1
1 x 2 = 2 ......
5 x 5 = 25
*/
let even = 0;
let add = 0;
let number = 5;
let multiplication = 0;
let producto;

while (multiplication < number) { 
    multiplication = multiplication + 1;

    counter = 0;

    while (counter < number) { 
        counter = counter + 1;
        producto = multiplication * counter;

        console.log(multiplication, "x", counter, "=", producto);

        if (producto % 2 == 0) {
            console.log("pair"); 
            console.log("odd"); 
        }
    }
}









