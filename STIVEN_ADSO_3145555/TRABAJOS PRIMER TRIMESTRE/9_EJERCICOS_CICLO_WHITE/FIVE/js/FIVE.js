/*
 	name exercise: FIVE
	description: 
 	autor: STIVEN
 	Date: 21 of march of 2025
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
let mass = 700;  

let gravityEarth = 9.81;
let gravityMars = 3.71;
let gravityJupiter = 24.79;

if (mass < 0) {
    console.log("El usuario ingresa una masa negativa");
} else {  
    while (mass >= 0) {  
        let weightEarth = mass * gravityEarth;
        let weightMars = mass * gravityMars;
        let weightJupiter = mass * gravityJupiter;

        totalWeight = weightEarth + weightMars + weightJupiter;  
        counter++;  

        console.log("Weight in Earth:", weightEarth);
        console.log("Weight in Mars:", weightMars);
        console.log("Weight in Jupiter:", weightJupiter);
      
        mass = -1;
        console.log("Total weight accumulated:", totalWeight);
        console.log("Total calculations:", counter);
    }  
}




 





