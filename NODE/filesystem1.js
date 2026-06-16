// using promises (then & catch)


const fs = require("fs").promises;

fs.writeFile("ab1.txt", "Hello World")
    .then(() => {
        console.log("File Created");

        return fs.readFile("ab1.txt", "utf8");
    })
    .then((data) => {
        console.log(data);
    })
    .catch((err) => {
        console.log(err);
    });


//promises (using async and await)


async function fileOperations() {
    try {
        await fs.writeFile("ab1.txt", "Hello World");
        console.log("File Created");

        const data = await fs.readFile("ab1.txt", "utf8");
        console.log(data);
    } catch (err) {
        console.log(err);
    }
}

fileOperations();