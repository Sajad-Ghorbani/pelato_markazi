class OrderMetaDataEntity{
  int? totalCount;
  int? totalPages;
  bool? hasLastPage;
  bool? hasNextPage;

  OrderMetaDataEntity({
    this.totalCount,
    this.totalPages,
    this.hasLastPage,
    this.hasNextPage,
  });
}