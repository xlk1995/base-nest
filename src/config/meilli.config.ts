import { createMeilliConfig } from '@/modules/meilisearch/config';

export const meilli = createMeilliConfig((configure) => [
    {
        name: 'default',
        host: 'http://localhost:7700',
    },
]);
