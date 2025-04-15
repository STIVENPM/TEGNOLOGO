/*
 	name exercise: EIGHT
	description: 
 	autor: STIVEN
 	Date: 24 of march of 2025
    Ejercicio 8: Cálculo del Trabajo Mecánico
Enunciado:
Se calculará el trabajo mecánico (W) realizado sobre un objeto según la ecuación:
W=F×dW = F \times d
Donde:
• F es la fuerza aplicada.
• d es la distancia recorrida.
Condiciones adicionales:
• Se debe acumular la suma total del trabajo realizado en todas las
ejecuciones.
• Se debe contar cuántas veces se ha calculado el trabajo mecánico.
• El programa se repetirá hasta que el usuario ingrese una distancia negativa.
*/
let time = 1; 
let distance = 0;
let speed = 0;
let force = 400; 
let mass = 500;
let acceleration = 0;
let totalTime = 0;
let totalDistance = 0;
let totalWork = 0;
let counter = 0;

if (distance < 0) {  
    console.log(" ingreso una distancia negativa.");  
} 

    for (;distance >= 0;counter++) {  
        acceleration = force / mass;  
        speed = speed + acceleration * time;  
        distance = speed * time;  

        totalTime = totalTime + time;  
        totalDistance = totalDistance + distance;  

        let work = force * distance;
        totalWork = totalWork + work;
    

        console.log("Fuerza aplicada:", force);  
        console.log("Aceleracion:", acceleration);  
        console.log("Velocidad:", speed);  
        console.log("Distancia recorrida:", distance);  
        console.log("Tiempo total  ", totalTime);  
        console.log("Distancia total ", totalDistance);  
        console.log("Trabajo realizado :", work);
        console.log("Total  trabajo ", totalWork);
        console.log("Cantidad ", counter);
        
       distance=-1;

  
    }  
