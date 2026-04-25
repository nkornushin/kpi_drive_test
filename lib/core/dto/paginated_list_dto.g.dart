// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_list_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginatedListDto<T> _$PaginatedListDtoFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => PaginatedListDto<T>(
  page: (json['page'] as num).toInt(),
  pagesCount: (json['pages_count'] as num).toInt(),
  rowsCount: (json['rows_count'] as num).toInt(),
  rowsTotalCount: (json['rows_total_count'] as num).toInt(),
  rows: (json['rows'] as List<dynamic>).map(fromJsonT).toList(),
);
