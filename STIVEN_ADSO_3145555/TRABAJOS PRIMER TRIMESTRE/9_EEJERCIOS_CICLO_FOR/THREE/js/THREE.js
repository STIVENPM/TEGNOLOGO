/*
 	name exercise: THREE
	description: 
 	autor: STIVEN
 	Date: 23 of march of 2025
Ejercicio 3: Realizar las tablas de multiplicar de 1 hasta el 5, y multiplique
hasta 5. Debe imprimir los siguientes resultados.
1 x 1 = 1
1 x 2 = 2 ......
5 x 5 = 25
*/
let table=1;  
let counter=1;  
let detener = 5;
let result;

for ( ;table <= detener; table++) {
    console.log("Table " , table);  
    
    for (counter = 1; counter <= detener; counter++) {
        let result = table * counter; 
        console.log(table , " * " , counter , " = " , result);  
    }

}



