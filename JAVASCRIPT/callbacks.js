function placeOrder(callback) {
    setTimeout(() => {
        console.log("Order Placed Sucessfully")
        callback();
    }, 1000)
}

function prepareFood(callback) {
    setTimeout(() => {
        console.log("Food Prepared Sucessfully")
        callback();
    }, 1000)
}

function packFood(callback) {
    setTimeout(() => {
        console.log("Food Packed  Sucessfully")
    }, 1000)
    callback();
}

function deliverFood(callback) {
    setTimeout(() => {
        console.log("Food Delivered Sucessfully")
    }, 10000)
}

placeOrder(() => {
    prepareFood(() => {
        packFood(() => {
            deliverFood()
        })
    })
})


