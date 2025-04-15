let number = [1,2,3,4,5,6,7,8,9];
function oddOReven(number) {     
        return number % 2 == 0 ? `${number} pair`: `${number} odd`;
    }
number.forEach(number => console.log(oddOReven(number)));


