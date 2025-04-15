/*
Name exercise: En este ejercicio, se calcula la aceleración de un objeto a partir de una matriz
 de fuerzas aplicadas y un arreglo de masas. Cada fila de la matriz representa un 
 conjunto de fuerzas en las direcciones x, y, z, y cada componente de la aceleración 
 se obtiene dividiendo la fuerza entre la masa correspondiente.
Autor: STIVEN

Date: March 25th 2025
*/ 

const acceleration = [2, -1];
const initialVelocity = [4, 8];
const initialPosition = [0, 0];

const steps = 10;

let positions = [];

for (let time = 1; time <= steps; time++) {
    let x = initialPosition[0] + initialVelocity[0] * time + 0.5 * acceleration[0] * time * time;
    let y = initialPosition[1] + initialVelocity[1] * time + 0.5 * acceleration[1] * time * time;

    positions.push(x, y);

    console.log("Time: " + time + "    x = " + x + " , y = " + y + "");
}
