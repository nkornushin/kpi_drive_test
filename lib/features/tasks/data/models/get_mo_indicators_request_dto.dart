import 'package:json_annotation/json_annotation.dart';

part 'get_mo_indicators_request_dto.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
)
class GetMoIndicatorsRequestDto {
  const GetMoIndicatorsRequestDto({
    required this.periodStart,
    required this.periodEnd,
    required this.periodKey,
    required this.requestedMoId,
    required this.behaviourKey,
    required this.withResult,
    required this.responseFields,
    required this.authUserId,
  });

  final String periodStart;

  final String periodEnd;

  final String periodKey;

  final String requestedMoId;

  final String behaviourKey;

  final String withResult;

  final String responseFields;

  final String authUserId;

  factory GetMoIndicatorsRequestDto.fromJson(Map<String, dynamic> json) => _$GetMoIndicatorsRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GetMoIndicatorsRequestDtoToJson(this);
}
