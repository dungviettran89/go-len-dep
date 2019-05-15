#!/usr/bin/env node

import {spawn} from "./spawn";
import {extractArgs} from "./args";
import path from "path";
import {copy} from "cpx";
import prompts from "prompts";

(async () => {
    const source = path.resolve(__dirname, "template", "**");
    const {name, target} = await extractArgs();

    await new Promise((resolve) => copy(`${source}`, target, resolve));
    await require('replace-in-file')({
        files: [path.resolve(target, "**")],
        from: /go_template/g,
        to: name,
    });
    console.log(`Generating go-len application`);
    console.log(`- name:    ${name}`);
    console.log(`- folder:  ${target}`);
    let {npmInstall} = await prompts({
        type: 'confirm',
        name: 'npmInstall',
        message: `Do you want to run npm install?`,
        initial: true
    });
    if (npmInstall) {
        console.log(`Running npm install...`);
        await spawn('npm', ['install', '@go-len/go-len-tools@latest', '--save']);
        await spawn('npm', ['install']);
    }
    console.log(`Completed. To start development:`);
    console.log(`- npm run build: Build your package`);
    console.log(`- npm run start: Run your main.go`);
    console.log(`If you need go run time, please install using 1 of these command:`);
    console.log(`- npm i -g @go-len/go-len-runtime-windows: for Windows version`);
    console.log(`- npm i -g @go-len/go-len-runtime-linux: for Linux version`);
    console.log(`- npm i -g @go-len/go-len-runtime-macos: for MacOS version`);

})();