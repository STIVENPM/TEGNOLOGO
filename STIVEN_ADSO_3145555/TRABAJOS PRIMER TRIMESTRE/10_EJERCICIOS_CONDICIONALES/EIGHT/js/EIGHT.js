/*
 	name exercise: EIGHT
	description: 
 	autor: STIVEN
 	Date: 19 of march of 2025

8. Comparación de dos cuerpos en caída libre
Enunciado: Diseñar un diagrama de flujo que reciba la masa de dos cuerpos en caída
libre, calcule la fuerza gravitacional de cada uno y determine:
* Cuál cuerpo ejerce mayor fuerza gravitacional.
* Si ambas fuerzas son iguales.
Fórmula (Segunda Ley de Newton considerando gravedad):
Donde g = 9.81 m/s² (gravedad terrestre).
*/

let massOne = 30;
let massTwo = 30;
let gravity = 9.81; 

let forceOne = massOne * gravity;
let forceTwo = massTwo * gravity;


if (forceOne > forceTwo) {
    console.log("El primer cuerpo ejerce mayor fuerza: ");
} 
else if (forceTwo > forceOne) {
    console.log("El segundo cuerpo ejerce mayor fuerza: ");
} 
else {
    console.log("Ambos cuerpos ejercen la misma fuerza: " );
}





