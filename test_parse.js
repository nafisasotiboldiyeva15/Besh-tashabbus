const fs = require('fs');
const content = fs.readFileSync('src/lib/storage.ts', 'utf8');
console.log("Lines in storage.ts:", content.split('\n').length);
