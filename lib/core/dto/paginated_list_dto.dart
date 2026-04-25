import 'package:json_annotation/json_annotation.dart';

part 'paginated_list_dto.g.dart';

@JsonSerializable(
  genericArgumentFactories: true,
  createToJson: false,
)
class PaginatedListDto<T> {
  const PaginatedListDto({
    required this.page,
    required this.pagesCount,
    required this.rowsCount,
    required this.rowsTotalCount,
    required this.rows,
  });

  @JsonKey(name: 'page')
  final int page;

  @JsonKey(name: 'pages_count')
  final int pagesCount;

  @JsonKey(name: 'rows_count')
  final int rowsCount;

  @JsonKey(name: 'rows_total_count')
  final int rowsTotalCount;

  @JsonKey(name: 'rows')
  final List<T> rows;

  factory PaginatedListDto.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) => _$PaginatedListDtoFromJson(json, fromJsonT);
}
