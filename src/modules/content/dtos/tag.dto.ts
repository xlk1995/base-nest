import { PartialType } from '@nestjs/swagger';
import { IsDefined, IsNotEmpty, IsOptional, IsUUID, MaxLength } from 'class-validator';

import { DtoValidation } from '@/modules/core/decorators';
import { IsUnique, IsUniqueExist } from '@/modules/database/constraints';

import { TagEntity } from '../entities';

/**
 * 新增标签验证
 */
@DtoValidation({ groups: ['create'] })
export class CreateTagDto {
    /**
     * 标签名称
     */
    @IsUnique(TagEntity, {
        groups: ['create'],
        message: '标签名称重复',
    })
    @IsUniqueExist(TagEntity, {
        groups: ['update'],
        message: '标签名称重复',
    })
    @MaxLength(255, {
        always: true,
        message: '标签名称长度最大为$constraint1',
    })
    @IsNotEmpty({ groups: ['create'], message: '标签名称必须填写' })
    @IsOptional({ groups: ['update'] })
    name: string;

    /**
     * 标签描述
     */
    @MaxLength(500, {
        always: true,
        message: '标签描述长度最大为$constraint1',
    })
    @IsOptional({ always: true })
    description?: string;
}

/**
 * 更新标签验证
 */
@DtoValidation({ groups: ['update'] })
export class UpdateTagDto extends PartialType(CreateTagDto) {
    /**
     * 待更新ID
     */
    @IsUUID(undefined, { groups: ['update'], message: 'ID格式错误' })
    @IsDefined({ groups: ['update'], message: 'ID必须指定' })
    id: string;
}
