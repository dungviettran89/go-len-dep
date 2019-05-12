#!/usr/bin/env node
import {exec} from 'child_process';

(async () => {
    exec("go build", {'GOPROXY': "https://athens.cuatoi.us"}, (error, stdout, stderr) => {
        console.log(error);
        console.log(stdout);
        console.log(stderr);
    })
})();