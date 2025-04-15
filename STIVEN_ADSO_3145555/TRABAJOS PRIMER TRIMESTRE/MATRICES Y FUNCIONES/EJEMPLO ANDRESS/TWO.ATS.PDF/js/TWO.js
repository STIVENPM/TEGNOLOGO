

let numberOne;
let numberTwo;
let addResult1;
let subtResult;
let multiResult;

function addition(numberOne, numberTwo) {
    let addResult = numberOne + numberTwo; 
    return addResult;
}

function subtraction(numberOne, numberTwo) {
    let subtResult = numberOne - numberTwo;
    return subtResult;
}

function multi(numberOne, numberTwo) {
    let multiResult = numberOne * numberTwo;
    return multiResult;
}

addResult1 = addition(12, 23);
subtResult = subtraction(43, 11);
multiResult = multi(3, 5);

console.log(`Addition 1: ${addResult1}`);
console.log('Subtraction: ' + subtResult);
console.log('Multiplication: ' + multiResult);

console.log(`Operations: Add: ${addResult1} | Subst: ${subtResult} | Multi: ${multiResult}`);

console.log('Operations with +++ :' + ' Add: ' + addResult1 + ' | Subst: ' + subtResult + ' | Multi: ' + multiResult);
