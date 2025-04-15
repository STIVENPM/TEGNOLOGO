const forces = [
    [10, 5, 0],
    [4, -3, 2],
    [0, 0, 6]
];

const mass = [2, 4, 3];

const acceleration = forces.map((forces  ) => [
    (forces[0] / mass[0]),
    (forces[1]/ mass[1]),
    (forces [2]/ mass[2]),
]);
console.table(acceleration);
console.log("Matriz the acceleration :");
console.log(acceleration);