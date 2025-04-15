/*
 	name exercise: SIX
	description: 
 	autor: STIVEN
 	Date: 19 of march of 2025
6. Cálculo de Notas Finales
cálculos:
- Calcular los porcentajes de cada nota:
- Nota 1 → 20%
- Nota 2 → 35%
- Nota 3 → 45%
- Sumar los porcentajes de las notas y clasificar la nota final:
- Mayor a 4.5 → Nota Superior
- Entre 3.5 y 4.5 → Nota Buena
- Entre 3 y 3.5 → Nota Media
- Menor a 3 → Nota Mala
Ejercicios Aplicando las Leyes de Newton
*/
let Nota1=2.0;
let Nota2=5.0;
let Nota3=2.0;
	fullNota1 = (Nota1 * 20)
	fullNota2 = (Nota2 * 35) 
	fullNota3 = (Nota3 * 45)
	fullnotaFinal = Nota1 + Nota2 + Nota3/3;
	if(fullnotaFinal>4.5){
		console.log("nota superior");
	}
	else {
		console.log("Nota No Superior");
	}
	if (fullnotaFinal>= 3.5 && fullnotaFinal <= 4.5) {
		console.log("nota Buena");
	}
	else {
		console.log("Nota No Superior");
	}
	if (fullnotaFinal >= 3.0 && fullnotaFinal < 3.5) {
		console.log("Nota Media");
	}
	else {
		console.log("Nota No Superior");
	}
	if (fullnotaFinal < 3.0) {
		console.log("Nota Mala");
	}
	else {
		console.log("Nota No Superior");
	}



		
	
		





	
	
					
			
							



