import 'package:json_annotation/json_annotation.dart';

part 'task_dto.g.dart';

@JsonSerializable(createToJson: false)
class TaskDto {
  const TaskDto({
    required this.name,
    required this.id,
    required this.parentId,
    required this.order,
  });

  final String name;

  @JsonKey(name: 'indicator_to_mo_id')
  final int id;

  @JsonKey(name: 'parent_id')
  final int parentId;

  final int order;

  factory TaskDto.fromJson(Map<String, dynamic> json) => _$TaskDtoFromJson(json);
}
