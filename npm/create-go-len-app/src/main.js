#!/usr/bin/env node
import process from 'process';
import fs from 'fs';

const copyFile = (name) => {
    console.log(__dirname);
    let source = `${__dirname}/../go-len-base/${name}`;
    let target = `${process.cwd()}/${name}`;
    fs.copyFile(source, target, () => console.log(`Generated ${target}`));

};

(async () => {
    console.log('Generating new project.');
    copyFile('go.mod');
    copyFile('package.json');
    copyFile('main.go');
    copyFile('.env');
    console.log('Please run npm install to download required dependencies.');
    console.log('The following tasks is supported');
    console.log('- npm run go-build: build go project');
    console.log('- npm run go-run: run main');
})();