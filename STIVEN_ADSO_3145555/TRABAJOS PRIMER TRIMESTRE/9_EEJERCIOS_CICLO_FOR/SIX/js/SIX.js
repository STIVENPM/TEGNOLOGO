/*
 	name exercise: SIX
	description: 
 	autor: STIVEN
 	Date: 24 of march of 2025
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
let massOne = 90;
let massTwo = 292;
let massThree = 320;
let acceleration = 90;
let appliedForceOne = 0;
let appliedForceTwo = 0;
let appliedForceThree = 0;

for (counter; massOne > 0 && massTwo > 0 && massThree > 0; counter++) {
    
    if (massOne > 0) {
        appliedForceOne = massOne * acceleration;
        reactionForceOne = -appliedForceOne;
        console.log("Force One:", appliedForceOne);
    }
    if (massTwo > 0) {
        appliedForceTwo = massTwo * acceleration;
        reactionForceTwo = -appliedForceTwo;
        console.log("Force Two:", appliedForceTwo);
    }
    if (massThree > 0) {
        appliedForceThree = massThree * acceleration;
        reactionForceThree = -appliedForceThree;
        console.log("Force Three:", appliedForceThree);
    }

    totalForce = appliedForceOne + appliedForceTwo + appliedForceThree;
    

    console.log("Total forces applied:", totalForce);
    console.log("Total calculation:", counter);
    massOne = -1; 
    massTwo = -1;
    massThree = -1;

   
}
