/*
 	name exercise: ONE
	description: 
 	autor: STIVEN
 	Date: 20 of march of 2025
Ejercicios de Diagramas de Flujo con Ciclo While y Leyes de Newton

Ejercicio 1: Realizar la tabla de multiplicar del 5, que multiplique hasta 5, y de imprimir los siguientes resultados
5 × 1 = 5  
5 × 2 = 10  
5 × 3 = 15  
5 × 4 = 20  
5 × 5 = 25
*/
let counter=0;
let number=5;
let producto;

while(counter<number){
	 counter++;
	 producto= number * counter;
	 console.log(number,"x",counter,"=",producto);
}
	