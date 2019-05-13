#!/usr/bin/env node

(async () => {
    let port = 28789;
    let process = require('process');
    let env = {...process.env, GOPROXY: `http://localhost:${port}`};
    let stdio = 'inherit';
    let goArgs = process.argv.splice(2);
    let express = require('express')();
    express.use('/', require('express-http-proxy')('https://athens.cuatoi.us'));
    let server = express.listen(port, () => console.log(`GoLen proxy listening on port ${port}!`));
    let go = require('cross-spawn')('go', goArgs, {env, stdio: stdio});
    await new Promise((resolve => go.on('exit', resolve).on('error', resolve)));
    server.close();
})();