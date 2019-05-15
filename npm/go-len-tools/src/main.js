#!/usr/bin/env node

import process from "process";
import cross_spawn from "cross-spawn";
import {proxyPort, proxyServer} from "./proxy";

(async () => {
    let env = {...process.env, GOPROXY: `http://localhost:${proxyPort}`};
    let stdio = 'inherit';
    let goArgs = process.argv.splice(2);
    let go = cross_spawn('go', goArgs, {env, stdio: stdio});
    await new Promise((resolve => go.on('exit', resolve).on('error', resolve)));
    await proxyServer.close();
})();