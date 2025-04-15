/*
 	name exercise: THREE 
	description: 
 	autor: STIVEN
 	Date: 16 of march of 2025
3. Calcular e imprimir el pago total de una persona con descuentos 
-Solicitar dias trabajados y valor del dia 
-Calcular el salario 
salarios dias Trabajados x valor Dia. 
-Aplicar descuentos: 
Salud salario x 0.12 pension = salario x 0.16 arl= salario x 0.052 
-Calcular el sueldo neto: 
sueldoNeto sueldo-descuento 
-Imprimir los valores del salario, salud, pension, arl, descuento y sueldo neto
*/

	let daysWorked =prompt("Ingrese dias trabajado");
	let dailyValue = prompt("Ingrese de el valor del dia");
	let salary = daysWorked * dailyValue;
	let health = salary * 0.12;
	let pension = salary * 0.16;
	let arl = salary * 0.052;
	let discount = health + pension + arl;
	let netSalary = salary - discount;
	console.log(netSalary);




	
	

