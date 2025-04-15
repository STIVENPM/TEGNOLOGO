/*
 	name exercise: TWO
	description: 
 	autor: STIVEN
 	Date: 23 of march of 2025
    
Ejercicio 2: Realizar la tabla del 9 que multiplique hasta 5 y de los resultados me 
imprima los resultados que son pares y que resultados que son impares.
    */
let counter=1;  
let number = 9; 
let detener = 5;   
let result = 0; 

for (; counter <= detener; counter++) {
    result = number * counter;

    console.log(number, " * " , counter , " = " , result);  

    if(counter%2==0){
        console.log(" even");
    }

    else{
        console.log(" odd");
    }	
}


