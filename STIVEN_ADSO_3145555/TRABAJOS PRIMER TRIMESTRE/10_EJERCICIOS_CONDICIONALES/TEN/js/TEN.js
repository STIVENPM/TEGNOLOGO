/*
 	name exercise: NINE
	description: 
 	autor: STIVEN
 	Date: 19 of march of 2025
10. Cálculo de la aceleración de un objeto sometido a una fuerza
Enunciado: Diseñar un diagrama de flujo que permita calcular la aceleración de un
objeto sometido a una fuerza dada su masa.
* Pedir al usuario:
o Masa del objeto (kg)
o Fuerza aplicada (N)
* Calcular la aceleración co la segunda ley de Newton:
Fórmula:
* Determinar si la aceleración es alta o baja según un umbral de 5 m/s².
    */
let mass=44;
let force=20000;
 

let acceleration= force/mass;
console.log("acceleration");

if(acceleration>5){
console.log("la aceleracion es alta");
}
else{
console.log("la aceleracion es baja");
}
