/*
 	name exercise: FOUR
	description: 
 	autor: STIVEN
 	Date: 23 of march of 2025
Ejercicio 4: Cálculo de la Fuerza con la Segunda Ley de NewtonEnunciado:
Crea un que solicite una masa (m) y una aceleración (a) y calcule
la fuerza (F) aplicando la fórmula:
F=m×aF = m \times a
Condiciones adicionales:
• Se debe acumular la suma total de todas las fuerzas calculadas.
• Se debe contar cuántos cálculos se han realizado.
• El programa finaliza cuando el usuario ingresa una masa o aceleración
negativa.
    */
let mass = 17890;  
let acceleration = 24560;  
let totalForce = 0;  
let counter = 0;  
if (mass < 0 ) {
    console.log("El usuario ingresa una masa negativa.");
} 
if (acceleration < 0) {
    console.log("El usuario ingresa una aceleracion negativa.");
}

for (counter; mass >= 0 && acceleration >= 0; ) {  
    let force = mass * acceleration;  
    totalForce = totalForce + force;  
    counter++;  

    console.log("Masa:", mass);  
    console.log("Aceleracion:", acceleration);  
    console.log("Fuerza Calculada:", force);  
    console.log("Fuerza acumuladas:", totalForce);  
    console.log("counter: ", counter);  


    console.log("")
   
    mass = -1; 
}




   



