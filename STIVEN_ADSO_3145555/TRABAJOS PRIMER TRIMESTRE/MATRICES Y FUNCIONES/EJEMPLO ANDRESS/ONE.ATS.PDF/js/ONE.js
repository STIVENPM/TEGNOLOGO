/*
Matrices (Arrays Multidimensionales) 
Ejercicio Final 
• Crear una matriz de N x M con valores aleatorios. 
*/ 

let N = 5;  
let M = 5; 
let matriz = []; 


for (let i = 0; i < N; i++) {  
    let fila = [];  
    for (let j = 0; j < M; j++) {  
        fila.push(Math.floor(Math.random() * 100));  
    }
    matriz.push(fila); 
}  


console.table(matriz);


let sumaFilas = matriz.map(fila => fila.reduce((acc, val) => acc + val, 0));
let sumaColumnas = matriz.map(Columnas => Columnas.reduce((acc, val) => acc + val, 0));



console.log("Suma de cada fila:", sumaFilas);
console.log("Suma de cada columna:", sumaColumnas);





