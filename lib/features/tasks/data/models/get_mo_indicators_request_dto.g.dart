// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_mo_indicators_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetMoIndicatorsRequestDto _$GetMoIndicatorsRequestDtoFromJson(
  Map<String, dynamic> json,
) => GetMoIndicatorsRequestDto(
  periodStart: json['period_start'] as String,
  periodEnd: json['period_end'] as String,
  periodKey: json['period_key'] as String,
  requestedMoId: json['requested_mo_id'] as String,
  behaviourKey: json['behaviour_key'] as String,
  withResult: json['with_result'] as String,
  responseFields: json['response_fields'] as String,
  authUserId: json['auth_user_id'] as String,
);

Map<String, dynamic> _$GetMoIndicatorsRequestDtoToJson(
  GetMoIndicatorsRequestDto instance,
) => <String, dynamic>{
  'period_start': instance.periodStart,
  'period_end': instance.periodEnd,
  'period_key': instance.periodKey,
  'requested_mo_id': instance.requestedMoId,
  'behaviour_key': instance.behaviourKey,
  'with_result': instance.withResult,
  'response_fields': instance.responseFields,
  'auth_user_id': instance.authUserId,
};
