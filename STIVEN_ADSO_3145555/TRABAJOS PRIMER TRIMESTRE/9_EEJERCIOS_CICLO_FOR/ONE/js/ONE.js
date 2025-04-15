/*
 	name exercise: ONE
	description: 
 	autor: STIVEN
 	Date: 23 of march of 2025
    Ejercicio 8: Cálculo del Trabajo Mecánico
Ejercicios de Diagramas de Flujo con Ciclo While y Leyes de Newton

Ejercicio 1: Realizar la tabla de multiplicar del 5, que multiplique hasta 5, y de imprimir los siguientes resultados
5 × 1 = 5  
5 × 2 = 10  
5 × 3 = 15  
5 × 4 = 20  
5 × 5 = 25


    */
let counter=1;  
let number = 5; 
let detener = 5;   
let result = 0; 


for (; counter <= detener; counter++) {
    result = number * counter;  

    console.log(number, " * " , counter , " = " , result);  
}