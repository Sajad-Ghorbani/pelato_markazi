import 'package:pelato_markazi/domain/entities/feature_entity.dart';
import 'package:pelato_markazi/domain/entities/reserve_entity.dart';

class SalonEntity{
  String? id;
  String? name;
  List<String>? images;
  List<FeatureEntity>? features;
  int? rentCost;
  List<ReserveEntity>? reservedTimes;
  int? area;

  SalonEntity({
    this.id,
    this.name,
    this.images,
    this.features,
    this.rentCost,
    this.reservedTimes,
    this.area,
  });
}