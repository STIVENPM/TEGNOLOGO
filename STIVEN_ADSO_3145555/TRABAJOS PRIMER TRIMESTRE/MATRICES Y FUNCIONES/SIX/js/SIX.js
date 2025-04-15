let numbers = [,9,10,8,7,6,5,4,3,2,1];

function sumaArray(numbers) {
    return numbers.reduce((accumulator, number) => accumulator + number, 0);
}

console.log(sumaArray(numbers));
