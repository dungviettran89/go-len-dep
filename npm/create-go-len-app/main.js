#!/usr/bin/env node
import process from 'process';
import fs from 'fs';

const copyFile = (name) => {
    let source = `${__dirname}/go-len-base/${name}`;
    let target = `${process.cwd()}/${name}`;
    fs.copyFile(source, target, () => console.log(`Generated ${target}`));

};

export const init = () => {
    console.log('Generating new project.');
    copyFile('go.mod');
    copyFile('package.json');
    copyFile('main.go');
    console.log('Please run npm install to download required dependencies.');
    console.log('The following tasks is supported');
    console.log('- npm run go-build: build go project');
};

init();