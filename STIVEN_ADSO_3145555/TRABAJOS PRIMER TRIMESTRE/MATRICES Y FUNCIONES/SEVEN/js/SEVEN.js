let force = parseFloat(prompt("Ingresa la fuerza "));
let mass = parseFloat(prompt("Ingresa la masa "));
let result;

function acceleration(force, mass) { 
    return force / mass;
}

result = acceleration(force, mass);

console.log("Fuerza: " + force + "  | Masa: " + mass + " | Aceleracion: " + result + "");

