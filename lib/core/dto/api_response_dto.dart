import 'package:json_annotation/json_annotation.dart';

part 'api_response_dto.g.dart';

@JsonSerializable(
  genericArgumentFactories: true,
  createToJson: false,
)
class ApiResponseDto<T> {
  const ApiResponseDto({
    required this.messages,
    required this.data,
    required this.status,
  });

  @JsonKey(name: 'MESSAGES')
  final ApiMessagesDto messages;

  @JsonKey(name: 'DATA')
  final T data;

  @JsonKey(name: 'STATUS')
  final String status;

  factory ApiResponseDto.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) => _$ApiResponseDtoFromJson(json, fromJsonT);
}

@JsonSerializable(createToJson: false)
class ApiMessagesDto {
  const ApiMessagesDto({
    this.error,
    this.warning,
    this.info,
  });

  @JsonKey(name: 'error')
  final String? error;

  @JsonKey(name: 'warning')
  final String? warning;

  @JsonKey(name: 'info')
  final String? info;

  factory ApiMessagesDto.fromJson(Map<String, dynamic> json) =>
      _$ApiMessagesDtoFromJson(json);
}
