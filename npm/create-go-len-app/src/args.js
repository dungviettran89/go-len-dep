import prompts from "prompts";
import path from "path";
import {cwd} from "process";

export const extractArgs = async () => {
    let currentDir = cwd();
    let dirName = path.basename(currentDir);
    let {name} = await prompts({
        type: 'text',
        name: 'name',
        message: `Project name?`,
        initial: dirName
    });
    let {sameDir} = await prompts({
        type: 'confirm',
        name: 'sameDir',
        message: `Generate in current folder?`,
        initial: dirName === name
    });
    let target = sameDir ? currentDir : path.resolve(currentDir, name);
    return {target, name};
};