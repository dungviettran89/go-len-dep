#!/usr/bin/env node

(async () => {
    let process = require('process');
    let env = {...process.env, GOPROXY: "https://athens.cuatoi.us"};
    let stdio = 'inherit';
    let goArgs = process.argv.splice(2);
    let go = require('cross-spawn')('go', goArgs, {env, stdio: stdio});
    await new Promise((resolve => go.on('exit', resolve).on('error', resolve)));
})();