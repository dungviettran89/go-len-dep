#!/usr/bin/env node
import minimist from 'minimist';
import path from 'path';
import process from 'process';

(async () => {
    const args = minimist(process.argv);
    console.log(__dirname);
    console.log(args);

    let dir = process.cwd();
    let name = args['n'] || args['name'] || args[4] || path.basename(dir);
    console.log(`Generating package ${name}`);
})();