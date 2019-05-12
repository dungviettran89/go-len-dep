#!/usr/bin/env node
import minimist from 'minimist';
import path from 'path';
import process from 'process';
import cpx from 'cpx';

(async () => {
    const args = minimist(process.argv);
    const source = path.resolve(__dirname, "template", "**");
    const target = process.cwd();
    const name = args['n'] || args['name'] || path.basename(target);

    await new Promise((resolve) => cpx.copy(`${source}`, target, resolve));
    await require('replace-in-file')({
        files: [path.resolve(target, "**")],
        from: /go_template/g,
        to: name,
    });
    console.log(`Generated package ${name}`);
    console.log(`Target folder ${target}`);
    console.log(`Please run "npm install" to install all dependencies.`);
})();