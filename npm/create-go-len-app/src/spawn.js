export function spawn(command, args) {
    return new Promise(resolve => require('cross-spawn')(command, args, {stdio: 'inherit'})
        .on("error", resolve)
        .on("exit", resolve)
    )
}