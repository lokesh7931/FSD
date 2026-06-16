//event module

const EventEmitter = require("events")
const emitter = new EventEmitter();
emitter.on("greet", () => {
    console.log("Hello")
})
emitter.emit("greet")


//passing data with events


const emitter1 = new EventEmitter();
emitter1.on("welcome", (name) => {
    console.log("Welcome", name);
});
emitter1.emit("welcome", "Lokesh");