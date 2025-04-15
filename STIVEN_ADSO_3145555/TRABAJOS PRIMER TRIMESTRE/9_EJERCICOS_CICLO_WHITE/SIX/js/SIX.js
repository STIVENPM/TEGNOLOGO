/*
 	name exercise: SIX
	description: 
 	autor: STIVEN
 	Date: 21 of march of 2025
    Ejercicio 6: Cálculo de la Tercera Ley de Newton (Acción y Reacción)
Enunciado:
Dado que:
Faccioˊn=−FreaccioˊnF_{\text{acción}} = -F_{\text{reacción}}
El programa pedirá una fuerza aplicada (F) y mostrará su fuerza de reacción.
Condiciones adicionales:
• Se debe acumular la suma total de todas las fuerzas aplicadas.
• Se debe contar cuántas veces se ha ingresado una fuerza.
• El programa finaliza cuando el usuario ingresa una fuerza de 0.
*/
let totalForce = 0;
let counter = 0;
let mass = 90;
let massTwo = 290;
let massThree = 30;
let acceleration = 90;
let appliedForceOne = 0;
let appliedForceTwo = 0;
let appliedForceThree = 0;


while (mass > 0) {
    if (mass > 0) {
        appliedForceOne = mass * acceleration;
        reactionForceOne = -appliedForceOne;
        console.log("Force One:", appliedForceOne);
        
        counter++;
    }
    if (massTwo > 0) {
        appliedForceTwo = massTwo * acceleration;
        reactionForceTwo = -appliedForceTwo;
        console.log("Force Two:", appliedForceTwo);
      
        counter++;
    }
    if (massThree > 0) {
        appliedForceThree = massThree * acceleration;
        reactionForceThree = -appliedForceThree;
        console.log("Force Three:", appliedForceThree);
        
        counter++;

     
        totalForce = appliedForceOne + appliedForceTwo + appliedForceThree;

        console.log(" forces applied:", totalForce);
        console.log("Total calculate:", counter);

    
        mass = 0;
    }
}