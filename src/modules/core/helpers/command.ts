// src/modules/core/helpers/command.ts

import chalk from 'chalk';
import yargs, { Arguments, CommandModule } from 'yargs';
import { hideBin } from 'yargs/helpers';

import * as coreCommands from '../commands';
import { App, CommandCollection } from '../types';

/**
 * 创建命令
 * @param factory
 * @param app
 */
// 根据传入的命令构建函数生成函数获取命令构造器列表
// 执行所有的命令构造器函数，并为每个函数传入app参数，获取所有的yargs命令模块
// 遍历这些命令模块，改造执行器函数。首先关闭container实例，然后执行命令执行器，最后判断如果是瞬时命令就退出进程
export async function createCommands(
    factory: () => CommandCollection,
    app: Required<App>,
): Promise<CommandModule<any, any>[]> {
    const collection: CommandCollection = [...factory(), ...Object.values(coreCommands)];
    const commands = await Promise.all(collection.map(async (command) => command(app)));
    return commands.map((command) => ({
        ...command,
        handler: async (args: Arguments<RecordAny>) => {
            await app.container.close();
            await command.handler(args);
            if (command.instant) process.exit();
        },
    }));
}
/**
 * 构建yargs cli
 * @param creator
 */
export async function buildCli(creator: () => Promise<App>) {
    const app = await creator();
    const bin = yargs(hideBin(process.argv));
    app.commands.forEach((command) => bin.command(command));

    bin.usage('Usage: $0 <command> [args]')
        .scriptName('cli')
        .demandCommand(1, '')
        .fail((msg, err, y) => {
            if (!msg && !err) {
                bin.showHelp();
                process.exit();
            }
            if (msg) console.error(chalk.red(msg));
            if (err) console.error(chalk.red(err.message));
            process.exit();
        })
        .strict()
        .alias('v', 'version')
        .help('h')
        .alias('h', 'help')
        .parse();
}
