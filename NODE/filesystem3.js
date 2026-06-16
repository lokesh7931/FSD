//readstream

const fs = require("fs");

const readStream = fs.createReadStream("abc.txt", "utf8");

readStream.on("data", (chunk) => {
    console.log(chunk)
})

//writeStream

const writeStream = fs.createWriteStream("output.txt")

writeStream.write("Welcome to Streams")

writeStream.end()