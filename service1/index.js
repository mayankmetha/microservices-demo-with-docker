'use strict';

const express = require('express');

// Constants
const PORT = 80;
const HOST = '0.0.0.0';

// App
const app = express();
app.get('/s1/', (req, res) => {
  res.status(200).send('Hello Service 1');
});

app.get('/s1/*', (req, res) => {
  res.status(404).send("Error 404!");
});

app.listen(PORT, HOST);
console.log(`Running on http://${HOST}:${PORT}`);