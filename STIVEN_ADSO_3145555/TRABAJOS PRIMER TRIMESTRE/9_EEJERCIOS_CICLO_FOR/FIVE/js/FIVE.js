/*
 	name exercise: FIVE
	description: 
 	autor: STIVEN
 	Date: 24 of march of 2025
    Ejercicio 5: Cálculo del Peso en Diferentes Planetas
Enunciado:
Se calculará el peso (W) de un objeto en diferentes planetas usando la ecuación:
W=m×gW = m \times g
Donde g es la gravedad del planeta. El usuario podrá elegir:
1. Tierra (9.81 m/s²)
2. Marte (3.71 m/s²)
3. Júpiter (24.79 m/s²)
Condiciones adicionales:
• Se debe acumular la suma total de todos los pesos calculados.
• Se debe contar cuántas veces se ha realizado un cálculo.
• El programa se repetirá hasta que el usuario ingrese una masa negativa.

    */
let totalWeight = 0;  
let counter = 0;  
let mass = 900;  

let gravityEarth = 9.81;
let gravityMars = 3.71;
let gravityJupiter = 24.79;

if (mass < 0) {
    console.log(" ingreso una masa negativa");
} 
else {
    for (counter; mass >= 0; counter++) {  
        let weightEarth = mass * gravityEarth;
        let weightMars = mass * gravityMars;
        let weightJupiter = mass * gravityJupiter;

        totalWeight = weightEarth + weightMars + weightJupiter;  
        
        console.log("Object Mass:", mass);
        console.log("Weight on Earth:", weightEarth);
        console.log("Weight on Mars:", weightMars);
        console.log("Weight on Jupiter:", weightJupiter);
        mass= -1;

        console.log("Total weight:", totalWeight);
        console.log("Total calculations:", counter + 1);

 
    }  
}

 


