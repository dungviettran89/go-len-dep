#!/usr/bin/env node

import {args} from "./args";
import {spawn} from "./spawn";

(async () => {
    const path = require('path');
    const source = path.resolve(__dirname, "template", "**");
    const target = require('process').cwd();
    const name = args['name'] || path.basename(target);

    await new Promise((resolve) => require('cpx').copy(`${source}`, target, resolve));
    await require('replace-in-file')({
        files: [path.resolve(target, "**")],
        from: /go_template/g,
        to: name,
    });
    console.log(`Generating go-len application`);
    console.log(`- name:    ${name}`);
    console.log(`- folder:  ${target}`);
    console.log(`Running npm install...`);
    await spawn('npm', ['install', '@go-len/go-len-tools@latest', '--save']);
    await spawn('npm', ['install']);
    console.log(`Completed. To start development:`);
    console.log(`- npm run build: Build your package`);
    console.log(`- npm run start: Run your main.go`);
    console.log(`If you need go run time, please install using 1 of these command:`);
    console.log(`- npm i -g @go-len/go-len-runtime-windows: for Windows version`);
    console.log(`- npm i -g @go-len/go-len-runtime-linux: for Linux version`);
    console.log(`- npm i -g @go-len/go-len-runtime-macos: for MacOS version`);

})();