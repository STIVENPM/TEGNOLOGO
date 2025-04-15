const forces = [
    [2, 2, 2],
    [2, 2, 2],
    [2, 2, 2]
];

const mass = 2;

const totalForce = forces.reduce(
    (acc, force) => [
        acc[0] + force[0],
        acc[1] + force[1],
        acc[2] + force[2],
    ]
);



const acceleration = totalForce.map(force => force / mass);
console.table(forces);

console.log("Fuerza total:", totalForce);
console.log("Aceleracion:", acceleration);

