export const args = require('yargs')
    .option('name', {
        alias: 'n',
        description: 'package name',
        type: 'string',
    })
    .help()
    .alias('help', 'h')
    .argv;