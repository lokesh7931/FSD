// //setTimeout

// console.log("start")

// setTimeout(() => {
//     console.log("hello after 3 seconds")
// }, 3000)

// console.log("end")

// //setInterval

// setInterval(() => {
//     console.log("hello after every 2 seconds")
// }, 2000)


//clearInterval with count

// let count = 0

// const interval1 = setInterval(() => {
//     count++
//     console.log("count :", count)

//     if (count == 5) {
//         clearInterval(interval1)
//         console.log("Stopped")
//     }


//clearInterval with time

const interval2 = setInterval(() => {
    console.log("Hello")
}, 1000)

setTimeout(() => {
    clearInterval(interval2)
    console.log("Stopped after 10 secs")
}, 10000)






