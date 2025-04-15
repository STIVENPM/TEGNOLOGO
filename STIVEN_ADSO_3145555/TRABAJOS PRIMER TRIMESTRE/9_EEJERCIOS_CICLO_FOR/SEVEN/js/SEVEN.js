/*
 	name exercise: SEVEN
	description: 
 	autor: STIVEN
 	Date: 24 of march of 2025
    Ejercicio 7: Simulación de Movimiento con la Primera Ley de Newton
Enunciado:
Si la fuerza aplicada es cero, el objeto permanece en reposo. Si la fuerza es distinta
de cero, se calcula la aceleración con:
a=Fma = \frac{F}{m}
Y se actualiza la velocidad:
v=v+a×tv = v + a \times t
donde t = 1s.
Condiciones adicionales:
• Se debe contar cuántos segundos el objeto ha estado en movimiento.
• Se debe acumular la distancia total recorrida con:
d=v×td = v \times t
• El programa finaliza cuando el usuario ingresa una fuerza de 0.
    */

let time = 1;  
let distance = 0;
let speed = 0;
let force = 70; 
let mass = 500;
let acceleration = 0;
let totalTime = 0;
let totalDistance = 0;
if (force == 0) {
    console.log(" ingreso una masa = 0");
}

for (; force > 0;) {  
    acceleration = force / mass;  
    speed = speed + acceleration * time;  
    distance = speed * time;  

    totalTime = totalTime + time;  
    totalDistance = totalDistance + distance;  

    console.log("Fuerza aplicada:", force);  
    console.log("Aceleracion:", acceleration);  
    console.log("Velocidad :", speed);  
    console.log("Distancia en segundo:", distance);  
    console.log("Tiempo total en movimiento:", totalTime);  
    console.log("Distancia total:", totalDistance);  

    force = 0;  
}
