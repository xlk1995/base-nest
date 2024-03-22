import { Module, ModuleMetadata } from '@nestjs/common';

import { TypeOrmModule } from '@nestjs/typeorm';

import { Configure } from '../config/configure';
import { DatabaseModule } from '../database/database.module';

import { defaultContentConfig } from './config';
import * as entities from './entities';
import * as repositories from './repositories';
import * as services from './services';
import { PostService } from './services/post.service';
import { SanitizeService } from './services/sanitize.service';
import { SearchService } from './services/search.service';
import { PostSubscriber } from './subscribers';
import { ContentConfig } from './types';

@Module({})
export class ContentModule {
    static async forRoot(configure: Configure) {
        const config = await configure.get<ContentConfig>('content', defaultContentConfig);
        const providers: ModuleMetadata['providers'] = [
            ...Object.values(services),
            PostSubscriber,
            {
                provide: PostService,
                inject: [
                    repositories.PostRepository,
                    repositories.CategoryRepository,
                    services.CategoryService,
                    repositories.TagRepository,
                    { token: SearchService, optional: true },
                ],
                useFactory(
                    postRepository: repositories.PostRepository,
                    categoryRepository: repositories.CategoryRepository,
                    categoryService: services.CategoryService,
                    tagRepository: repositories.TagRepository,
                    searchService: SearchService,
                ) {
                    return new PostService(
                        postRepository,
                        categoryRepository,
                        categoryService,
                        tagRepository,
                        searchService,
                        config.searchType,
                    );
                },
            },
        ];
        const exports: ModuleMetadata['exports'] = [
            ...Object.values(services),
            PostService,
            DatabaseModule.forRepository(Object.values(repositories)),
        ];
        if (config.htmlEnabled) {
            providers.push(SanitizeService);
            exports.push(SanitizeService);
        }
        if (config.searchType === 'meilli') {
            providers.push(SearchService);
            exports.push(SearchService);
        }
        return {
            module: ContentModule,
            imports: [
                TypeOrmModule.forFeature(Object.values(entities)),
                DatabaseModule.forRepository(Object.values(repositories)),
            ],
            // controllers: Object.values(controllers),
            providers,
            exports,
        };
    }
}
