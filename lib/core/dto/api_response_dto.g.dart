// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiResponseDto<T> _$ApiResponseDtoFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => ApiResponseDto<T>(
  messages: ApiMessagesDto.fromJson(json['MESSAGES'] as Map<String, dynamic>),
  data: fromJsonT(json['DATA']),
  status: json['STATUS'] as String,
);

ApiMessagesDto _$ApiMessagesDtoFromJson(Map<String, dynamic> json) =>
    ApiMessagesDto(
      error: json['error'] as String?,
      warning: json['warning'] as String?,
      info: json['info'] as String?,
    );
