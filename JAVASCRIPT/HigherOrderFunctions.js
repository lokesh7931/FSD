// For Each
let arr = [10, 20, 30];
arr.forEach(num => console.log(num));

let fruits = ["Apple", "Banana", "Mango"];
fruits.forEach(a => console.log(a));


//Map
let result = arr.map(num => num * num);
console.log(result)

let name = ["lokesh", "varma"]
let uppercase = name.map(a => a.toUpperCase())
console.log(uppercase)

let marks = [76, 43, 55, 45]
let update = marks.map(x => x + 5)
console.log(update)

//filter
let num = [4, 3, 56, 7, 44, 9, 467, 2]
let even = num.filter(x => x % 2 === 0)
console.log(even)

let marks1 = [47, 53, 98, 44, 23, 13, 87]
let pass = marks.filter(x => x >= 50);
console.log(pass)

//find
let arr2 = [10, 20, 30, 40];
let result3 = arr.find(num => num > 25);
console.log(result3);

let result4 = arr2.findIndex(num => num > 5)
console.log(result4);

