/*
 	name exercise: NINE
	description: 
 	autor: STIVEN
 	Date: 22 of march of 2025
    Ejercicio 8: Cálculo del Trabajo Mecánico
Ejercicio 9: Cálculo de la Energía Potencial Gravitatoria
Enunciado:
Se calculará la energía potencial gravitatoria (Epg) de un objeto según la ecuación:
Epg=m×g×hEpg = m \times g \times h
Donde:
• m es la masa del objeto.
• g es la aceleración de la gravedad (9.81 m/s² en la Tierra).
• h es la altura desde la que se encuentra el objeto.
Condiciones adicionales:
• Se debe acumular la suma total de la energía potencial calculada.
• Se debe contar cuántas veces se ha calculado la energía potencial.
• El programa se repetirá hasta que el usuario ingrese una altura negativa.
Estos ejercicios aplican el ciclo while, el uso de contadores y acumuladores, así
como los principios fundamentales de las Leyes de Newton.
    */
let time = 10;   
let height = 100;  
let mass = 5070;  
let gravity = 9.81;  
let potentialEnergy = 0;  
let totalEnergy = 0;  
let counter = 0;  

if (height < 0) {  
    console.log("A negative height was entered");  
}  
else {  
    while (height >= 0) {  
        potentialEnergy = mass * gravity * height;  
        totalEnergy = totalEnergy + potentialEnergy;  
        counter++;  

        console.log("Object mass:", mass);  
        console.log("Gravity:", gravity);  
        console.log("Height:", height);  
        console.log("Potential Energy:", potentialEnergy);  
        console.log("Total Energy:", totalEnergy);  
        console.log("Count:", counter);  

        height = -1;  
    }  
}

