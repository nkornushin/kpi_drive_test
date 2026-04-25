class PaginatedListEntity<T> {
  const PaginatedListEntity({
    required this.page,
    required this.pagesCount,
    required this.rowsCount,
    required this.rowsTotalCount,
    required this.rows,
  });

  final int page;
  final int pagesCount;
  final int rowsCount;
  final int rowsTotalCount;
  final List<T> rows;
}
