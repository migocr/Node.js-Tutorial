const { Client } = require('pg');

const client = new Client({

    host: 'localhost',
    port: 5432,
    user: 'postgres',
    password: 'leasim',
    database: 'node_hero'
    
    
});

client.connect();

const query = `
SELECT *
FROM users
`;


client.query(query, (err, res) => {
    if (err) {
        console.error(err);
        return;
    }
    for (let row of res.rows) {
        console.log(row);
    }
    client.end();
});



 



