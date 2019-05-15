import express from "express";
import proxy from "express-http-proxy";


export const proxyPort = 28789;
let app = express();
app.use('/', proxy('https://athens.cuatoi.us'));
export const proxyServer = app.listen(proxyPort, () => console.log(`GoLen proxy listening on port ${proxyPort}!`));
