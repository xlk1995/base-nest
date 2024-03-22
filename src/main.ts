import { createApp, startApp } from './modules/core/helpers';
import { listened } from './modules/restful/helpers';
import { createOptions } from './options';

startApp(createApp(createOptions), listened);
