/*
 	name exercise: TWO
	description: 
 	autor: STIVEN
 	Date: 20 of march of 2025
Ejercicio 2: Realizar la tabla del 9 que multiplique hasta 5 y de los resultados me 
imprima los resultados que son pares y que resultados que son impares.


*/
let counter=0;
let number=9;
let producto;

while(counter<5){
	 counter++;
	 producto= number * counter;
	 console.log(number,"x",counter,"=",producto);
if(producto%2==0){
console.log("pair");
}

else {
console.log("odd");
}

}
	