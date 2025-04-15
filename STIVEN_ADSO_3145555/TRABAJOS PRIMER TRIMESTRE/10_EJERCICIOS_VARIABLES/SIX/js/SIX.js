/*
 	name exercise: SIX 
	description: 
 	autor: STIVEN
 	Date: 16 of march of 2025
6.Calculo de la aceleración de un auto 
-Pedir la fuerza (N) aplicada sobre el auto 
-Pedir la masa (kg) del auto 
Calcular la aceleración 
a=F/m 
-Mostrar el resultado 
    */
   let force = prompt("Ingrese la fuerza  ");
   let mass = prompt("Ingrese la masa  ");
   let acceleration = force / mass;
   console.log("La aceleracion del auto es: " + acceleration);