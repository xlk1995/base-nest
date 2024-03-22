import { SelectTrashMode } from '../database/constants';

export type SearchType = 'mysql' | 'meilli';
export interface ContentConfig {
    searchType?: SearchType;
    htmlEnabled: boolean;
}
export interface SearchOption {
    trashed?: SelectTrashMode;
    isPublished?: boolean;
    page?: number;
    limit?: number;
}
