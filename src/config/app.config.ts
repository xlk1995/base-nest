import { toNumber } from 'lodash';

import { createAppConfig } from '@/modules/core/config';

export const app = createAppConfig((configure) => ({
    port: configure.env.get('APP_PORT', (v) => toNumber(v), 3100),
    prefix: 'api',
    pm2: {
        exec_mode: 'cluster',
    },
}));
