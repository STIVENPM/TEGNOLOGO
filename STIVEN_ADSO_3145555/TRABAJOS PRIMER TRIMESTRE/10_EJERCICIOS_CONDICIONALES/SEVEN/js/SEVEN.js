/*
 	name exercise: SEVEN
	description: 
 	autor: STIVEN
 	Date: 19 of march of 2025
7. Determinar la Fuerza de un Objeto y Compararla con un Límite
Enunciado: Diseñar un diagrama de flujo que calcule la fuerza ejercida por un objeto y
determine si es mayor o menor que un valor umbral.
- Pedir al usuario la masa (kg) y la aceleración (m/s²).
- Calcular la fuerza usando la segunda ley de Newton.
Fórmula: F = m × a
- Si Fuerza ≥ 100N, imprimir 'La fuerza es alta'
- Si Fuerza < 100N, imprimir 'La fuerza es baja'
*/
let mass=39;
let aceleration=10;
let force;

fullforce= mass * aceleration;
// if(force>100){
// console.log("la fuerza mas alta");
// }
// else {
// 	console.log("la fuerza mas baja");
// }
// if(force<100){
// console.log("la fuerza mas baja");
// }
// else {
// 	console.log("la fuerza mas baja");
// }
if (force >= 100) {
    console.log("La fuerza es alta");
} else {
    console.log("La fuerza es baja");
}
