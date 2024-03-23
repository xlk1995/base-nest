// src/console/bin.ts
import { createOptions } from '@/options';

import { buildCli, createApp } from '../src/modules/core/helpers';

buildCli(createApp(createOptions));
