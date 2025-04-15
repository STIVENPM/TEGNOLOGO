let vector = [];
let iteration;
let number;


for (iteration = 0; iteration < 15; iteration++) {
  number = Math.floor(Math.random() * 100);

  vector.push(number);
}

console.log(vector);

let maximo = Math.max(...vector);

let minimo = Math.min(...vector);

console.log("Máximo: " + maximo);

console.log("Minimo: " + minimo);

if (iteration % 2 == 0) {
  console.log(par);
} else {
  console.log(impar);
}
// XXXX
let matrix = [];
let rowSums = [];
let columnSums = [];

let N = 6;
let M = 7;

for (let i = 0; i < N; i++) {
    matrix[i] = [];
    rowSums[i] = 0;
    for (let j = 0; j < M; j++) {
        matrix[i][j] = Math.floor(Math.random() * 100) + 1;
        rowSums[i] += matrix[i][j];
    }
}

for (let j = 0; j < M; j++) {
    columnSums[j] = 0;
}

for (let i = 0; i < N; i++) {
    for (let j = 0; j < M; j++) {
        columnSums[j] += matrix[i][j];
    }
}

console.table(matrix);
console.log("Row sums:", rowSums);
console.log("Column sums:", columnSums);
