class SaveIndicatorInstanceFieldRequestDto {
  const SaveIndicatorInstanceFieldRequestDto({
    required this.periodStart,
    required this.periodEnd,
    required this.periodKey,
    required this.indicatorToMoId,
    required this.fields,
    required this.authUserId,
  });

  final String periodStart;
  final String periodEnd;
  final String periodKey;
  final String indicatorToMoId;
  final List<SaveIndicatorFieldDto> fields;
  final String authUserId;
}

class SaveIndicatorFieldDto {
  const SaveIndicatorFieldDto({
    required this.name,
    required this.value,
  });

  final String name;
  final String value;
}
