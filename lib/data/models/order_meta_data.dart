import 'package:json_annotation/json_annotation.dart';
import 'package:pelato_markazi/domain/entities/order_meta_data_entity.dart';

part 'order_meta_data.g.dart';

@JsonSerializable()
class OrderMetaData {
  @JsonKey(name: "total_count")
  int? totalCount;
  @JsonKey(name: "total_pages")
  int? totalPages;
  @JsonKey(name: "has_last_page")
  bool? hasLastPage;
  @JsonKey(name: "has_next_page")
  bool? hasNextPage;

  OrderMetaData({
    this.totalCount,
    this.totalPages,
    this.hasLastPage,
    this.hasNextPage,
  });

  factory OrderMetaData.fromJson(Map<String, dynamic> json) =>
      _$OrderMetaDataFromJson(json);

  Map<String, dynamic> toJson() => _$OrderMetaDataToJson(this);

  OrderMetaDataEntity toEntity() {
    return OrderMetaDataEntity(
      totalCount: totalCount,
      totalPages: totalPages,
      hasLastPage: hasLastPage,
      hasNextPage: hasNextPage,
    );
  }

  @override
  String toString() {
    return 'totalCount $totalCount, total pages $totalPages, has_last_page $hasLastPage';
  }
}
