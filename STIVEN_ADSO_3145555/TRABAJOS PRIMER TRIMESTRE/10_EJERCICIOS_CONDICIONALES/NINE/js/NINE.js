/*
 	name exercise: NINE
	description: 
 	autor: STIVEN
 	Date: 19 of march of 2025
9. Cálculo de la Fricción de un Objeto sobre una Superficie
Enunciado: Diseñar un diagrama de flujo que calcule la fuerza de fricción entre un
objeto y la superficie sobre la que se mueve.
* Pedir al usuario:
o Masa del objeto (kg)
o Coeficiente de fricción (\mu)
o Aceleración gravitacional (g)
* Calcular la fuerza normal y la fuerza de fricción:
Fórmula:
* Si la fuerza de fricción es mayor a 50N, indicar que la fricción es alta.
* Si es menor a 50N, indicar que la fricción es baja.
    */
let mass=3;
let friction=4;
let gravitation=4;

let forceOne= mass * gravitation;

let forceFriction= forceOne * friction;

if(forceFriction>50){
console.log(" la friccion es alta");
}
else{
console.log("la friccion es baja");
}