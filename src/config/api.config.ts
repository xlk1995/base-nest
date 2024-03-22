import { Configure } from '@/modules/config/configure';
import { ConfigureFactory } from '@/modules/config/types';

import * as contentControllers from '@/modules/content/controllers';
import { ApiConfig, VersionOption } from '@/modules/restful/types';

export const api: ConfigureFactory<ApiConfig> = {
    register: async (configure: Configure) => ({
        title: configure.env.get(
            'API_TITLE',
            `${await configure.get<string>('app.name')} app的API接口`,
        ),
        // description: configure.env.get('API_DESCRIPTION', '3R教室TS全栈开发教程'),
        auth: true,
        docuri: 'api/docs',
        default: configure.env.get('API_DEFAULT_VERSION', 'v1'),
        enabled: [],
        versions: { v1: await v1(configure) },
    }),
};

export const v1 = async (configure: Configure): Promise<VersionOption> => {
    return {
        routes: [
            {
                name: 'app',
                path: '/',
                controllers: [],
                doc: {
                    // title: '应用接口',
                    description:
                        '3R教室《Nestjs实战开发》课程应用的客户端接口（应用名称随机自动生成）',
                    tags: [
                        { name: '分类操作', description: '对分类进行CRUD操作' },
                        { name: '标签操作', description: '对标签进行CRUD操作' },
                        { name: '文章操作', description: '对文章进行CRUD操作' },
                        { name: '评论操作', description: '对评论进行CRUD操作' },
                    ],
                },
                children: [
                    {
                        name: 'app.content',
                        path: 'content',
                        controllers: Object.values(contentControllers),
                    },
                ],
            },
        ],
    };
};
