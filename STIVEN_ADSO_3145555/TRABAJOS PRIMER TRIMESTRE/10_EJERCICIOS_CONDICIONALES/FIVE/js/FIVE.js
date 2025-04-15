/*
 	name exercise: Five
	description: 
 	autor: STIVEN
 	Date: 19 of march of 2025
5. Cálculo de Salario Neto con Deducciones
Enunciado: Diseñar un diagrama de flujo que calcule el salario total de una persona,
aplicando las siguientes reglas:
- Si el salario es menor a dos salarios mínimos, sumar el subsidio de transporte de $114,000.
- Aplicar los siguientes descuentos:
- Salud = salario × 0.12
- Pensión = salario × 0.16
- ARL = salario × 0.052
- Si el salario es mayor a cuatro salarios mínimos, restar una retención del 0.04.
- Calcular e imprimir el total a pagar después de los descuentos.

*/


	let withHoding=2000;
	let pension=70000;
	let health=80000;
	let arl=90000;
	let salary=1000000;
	let subsidy=90000;
	let netSalary;
	let smmas;
	let SalarySubsidy;

			if(salary <2){

				fullSalarySubsidy= salary + subsidy;
			}
			else{
				fullHealth= salary * 0.12;

				fullPension= salary * 0.16;  
				
				fullArl= salary * 0.052;

				fullWithHoding= salary * 0.04;
			}

			if(salary < 4){

				fullWithHoding= salary * 0.04;
			}

			else{
				fullNetSalary=salary - (fullHealth+ fullPension+ fullArl + fullWithHoding);

				console.log("total to pay",fullNetSalary)
			}
	











































