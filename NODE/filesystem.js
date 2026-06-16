const fs = require("fs");

// writeFileSync
console.log("Start");
fs.writeFileSync("abc.txt", "Hello World");
console.log("End");

// writeFile
fs.writeFile("def.txt", "Welcome to File System", (err) => {
    if (err) {
        console.log(err);
        return;
    }
    console.log("Write Operation Done");
});

// readFileSync
fs.writeFile("abc.txt", "Updated One", (err) => {
    if (err) {
        console.log(err);
        return;
    }

    console.log("Done");

    const data = fs.readFileSync("abc.txt", "utf8");
    console.log(data);

    // appendFileSync
    fs.appendFileSync("abc.txt", "\nUpdated Using appendFileSync");

    const updatedData = fs.readFileSync("abc.txt", "utf8");
    console.log(updatedData);
});

// readFile
fs.readFile("def.txt", "utf8", (err, data) => {
    if (err) {
        console.log("Error:", err);
        return;
    }

    console.log(data);
});

//unlink 


fs.unlink("def.txt", (err) => {
    if (err) {
        console.log("Error:", err);
        return;
    }

    console.log("File Deleted Successfully");
});



