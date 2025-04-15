/*
 	name exercise: NINE
	description: 
 	autor: STIVEN
 	Date: 16 of march of 2025
10. Cálculo del retroceso de un arma tras disparar 
-Pedir la masa (kg) del arma 
-Pedir la masa (kg) de la bala 
-Pedir la velocidad (m/s) de la bala 
-Calcular la velocidad de retroceso del arma cuando= 
m_bala v_bala= m_armav_retroceso 
-Mostrar el resultado
    */
  
let mass_weapon = prompt("Ingrese la masa del arma en kg: ");

let mass_bullet = prompt("Ingrese la masa de la bala en kg: ");
 
 let speed_bullet = prompt("Ingrese la velocidad de la bala en m/s:");
     
     let speed_reverse = ( mass_bullet * speed_bullet) / mass_weapon;
     
     console.log("La velocidad de retroceso del arma es: " + speed_reverse);
