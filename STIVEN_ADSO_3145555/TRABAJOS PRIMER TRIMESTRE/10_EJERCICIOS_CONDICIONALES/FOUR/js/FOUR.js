/*
 	name exercise: FOUR
	description: 
 	autor: STIVEN
 	Date: 19 of march of 2025

4. Determinación de Mayoría de Edad y Promedio de Edades
Enunciado: Crear un diagrama de flujo que reciba las edades de tres personas, luego:
- Determine si cada persona es mayor de edad (edad ≥ 18).
- Calcule el promedio de las tres edades.
- Si el promedio es mayor o igual a 18, indicar que el grupo está en la mayoría de edad.
Fórmula: Promedio = (Edad1 + Edad2 + Edad3) / 3
*/
let ageOne=18;
let ageTwo=18;
let ageThree=18;
let average;



if(ageOne>=18){
	console.log("is adult");
}
else{
	console.log("is child");
}


if(ageTwo>=18){
	console.log("is adult");
}
else{
	console.log("is child");
}


if(ageThree>=18){
	console.log("is adult");
}
else{

 fullaverage(ageOne + ageTwo + ageThree)/3;
}
if(average>=18){
	console.log("is adult");
}
else{
	console.log("is child");
}





