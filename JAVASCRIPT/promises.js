//Creating a promise 

let promise = new Promise((resolve, reject) => {

});
console.log(promise)

//promise success

let promise1 = new Promise((resolve, reject) => {
    resolve("Sucessful")
})
console.log(promise1)

//promise failure

let promise2 = new Promise((resolve, reject) => {
    reject("Error")
})
console.log(promise2)

//then
let promise3 = new Promise((resolve, reject) => {
    resolve("Sucess")
})
console.log(promise3)
promise3.then((result) => console.log(result));

//catch

let promise4 = new Promise((resolve, reject) => {
    reject("error")
})
console.log(promise4)
promise4.catch((err) => console.log(err))

//finally

let promise5 = new Promise((resolve, reject) => {
    let success = true;
    if (success) {
        resolve("Sucessful")
    } else {
        reject("Error")
    }
});
console.log(promise5)
promise5
    .then((result) => console.log(result))
    .catch((err) => console.log(err))
    .finally(() => console.log("Sucessfully Completed"))


//promise chaining
let promise6 = new Promise((resolve, reject) => {
    resolve(10)
})
promise6
    .then((num) => num * 3)
    .then((num) => num + 50)
    .then((result) => console.log(result))


//promise with settimeout

let promise7 = new Promise((resolve, reject) => {

    setTimeout(() => {
        resolve("Sucessful after 3 secs")
    }, 3000)
})
promise7
    .then((result) => console.log(result))



