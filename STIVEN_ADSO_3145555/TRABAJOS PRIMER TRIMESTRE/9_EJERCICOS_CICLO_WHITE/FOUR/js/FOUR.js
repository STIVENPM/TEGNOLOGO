/*
 	name exercise: four
	description: 
 	autor: STIVEN
 	Date: 20 of march of 2025
Ejercicio 4: Cálculo de la Fuerza con la Segunda Ley de NewtonEnunciado:
Crea un diagrama de flujo que solicite una masa (m) y una aceleración (a) y calcule
la fuerza (F) aplicando la fórmula:
F=m×aF = m \times a
Condiciones adicionales:
• Se debe acumular la suma total de todas las fuerzas calculadas.
• Se debe contar cuántos cálculos se han realizado.
• El programa finaliza cuando el usuario ingresa una masa o aceleración
negativa.
*/
let totalForce = 0;  
let counter = 0;       

let mass = 59;  
let acceleration = 59;  

if (mass < 0 ) {
    console.log("El usuario ingresa una masa negativa.");
} 
if (acceleration < 0) {
    console.log("El usuario ingresa una aceleracion negativa.");
}

else {  
    while (mass >= 0 && acceleration >= 0) {  
        let force = mass * acceleration;  
        totalForce = totalForce + force;  
        counter++;  

        console.log("la fuerza es:", force);  

        mass = -1;  
        acceleration = -1;  
        console.log("Total de fuerzas acumuladas:", totalForce);  
        console.log("calculos realizados:", counter);
    }  
}

