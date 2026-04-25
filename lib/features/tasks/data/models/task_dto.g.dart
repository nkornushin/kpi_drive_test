// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskDto _$TaskDtoFromJson(Map<String, dynamic> json) => TaskDto(
  name: json['name'] as String,
  id: (json['indicator_to_mo_id'] as num).toInt(),
  parentId: (json['parent_id'] as num).toInt(),
  order: (json['order'] as num).toInt(),
);
