import 'package:json_annotation/json_annotation.dart';
import 'package:pelato_markazi/app/models/reserve_model.dart';

part 'salon_model.g.dart';

@JsonSerializable()
class SalonModel {
  @JsonKey(name: "_id")
  String? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "images")
  List<String>? images;
  @JsonKey(name: "features")
  List<String>? features;
  @JsonKey(name: "rent_rentCost")
  int? rentCost;
  @JsonKey(name: "reserved_times")
  List<ReserveModel>? reservedTimes;
  @JsonKey(name: "area")
  int? area;

  SalonModel({
    this.id,
    this.name,
    this.images,
    this.features,
    this.rentCost,
    this.reservedTimes,
    this.area,
  });

  factory SalonModel.fromJson(Map<String, dynamic> json) => _$SalonModelFromJson(json);

  Map<String, dynamic> toJson() => _$SalonModelToJson(this);
}


List<SalonModel> salons = [
  SalonModel(
    name: 'سالن شماره 1',
    area: 80,
    rentCost: 320000,
    images: ['assets/images/salon_1.jpg'],
    features: [
      'آکوستیک',
      'سیستم صوتی',
      'سیستم تهویه',
      'اسپلیت',
      'آینه',
      'کف پارکت',
      'محل تعویض لباس',
      'جا کفشی',
    ],
    reservedTimes: [
      ReserveModel(
        day: DateTime.now().add(const Duration(days: 3)),
        hours: '8-9',
        status: 'full',
      ),
      ReserveModel(
        day: DateTime.now().add(const Duration(days: 3)),
        hours: '9-10',
        status: 'full',
      ),
      ReserveModel(
        day: DateTime.now().add(const Duration(days: 3)),
        hours: '13-14',
        status: 'full',
      ),
      ReserveModel(
        day: DateTime.now().add(const Duration(days: 3)),
        hours: '14-15',
        status: 'full',
      ),
      ReserveModel(
        day: DateTime.now().add(const Duration(days: 3)),
        hours: '15-16',
        status: 'full',
      ),
      ReserveModel(
        day: DateTime.now().add(const Duration(days: 1)),
        hours: '10-11',
        status: 'reserved',
      ),
      ReserveModel(
        day: DateTime.now().add(const Duration(days: 1)),
        hours: '11-12',
        status: 'reserved',
      ),
      ReserveModel(
        day: DateTime.now().add(const Duration(days: 1)),
        hours: '17-18',
        status: 'full',
      ),
      ReserveModel(
        day: DateTime.now().add(const Duration(days: 1)),
        hours: '18-19',
        status: 'full',
      ),
      ReserveModel(
        day: DateTime.now().add(const Duration(days: 1)),
        hours: '19-20',
        status: 'full',
      ),
    ],
  ),
  SalonModel(
    name: 'سالن شماره 2',
    area: 60,
    rentCost: 270000,
    images: ['assets/images/salon_2.jpg'],
    features: [
      'سیستم صوتی',
      'سیستم تهویه',
      'اسپلیت',
      'آینه',
      'کف پارکت',
      'محل تعویض لباس',
      'جا کفشی',
    ],
    reservedTimes: [
      ReserveModel(
        day: DateTime.now().add(const Duration(days: 4)),
        hours: '8-9',
        status: 'full',
      ),
      ReserveModel(
        day: DateTime.now().add(const Duration(days: 4)),
        hours: '9-10',
        status: 'full',
      ),
      ReserveModel(
        day: DateTime.now().add(const Duration(days: 4)),
        hours: '13-14',
        status: 'full',
      ),
      ReserveModel(
        day: DateTime.now().add(const Duration(days: 4)),
        hours: '14-15',
        status: 'full',
      ),
      ReserveModel(
        day: DateTime.now().add(const Duration(days: 4)),
        hours: '15-16',
        status: 'full',
      ),
      ReserveModel(
        day: DateTime.now().add(const Duration(days: 2)),
        hours: '10-11',
        status: 'reserved',
      ),
      ReserveModel(
        day: DateTime.now().add(const Duration(days: 2)),
        hours: '11-12',
        status: 'reserved',
      ),
      ReserveModel(
        day: DateTime.now().add(const Duration(days: 3)),
        hours: '17-18',
        status: 'full',
      ),
      ReserveModel(
        day: DateTime.now().add(const Duration(days: 3)),
        hours: '18-19',
        status: 'full',
      ),
      ReserveModel(
        day: DateTime.now().add(const Duration(days: 3)),
        hours: '19-20',
        status: 'full',
      ),
    ],
  ),
  SalonModel(
    name: 'سالن شماره 3',
    area: 60,
    rentCost: 250000,
    images: ['assets/images/salon_3.jpg'],
    features: [
      'سیستم صوتی',
      'سیستم تهویه',
      'اسپلیت',
      'آینه',
      'کف پارکت',
      'محل تعویض لباس',
      'جا کفشی',
    ],
    reservedTimes: [
      ReserveModel(
        day: DateTime.now().add(const Duration(days: 6)),
        hours: '8-9',
        status: 'full',
      ),
      ReserveModel(
        day: DateTime.now().add(const Duration(days: 6)),
        hours: '9-10',
        status: 'full',
      ),
      ReserveModel(
        day: DateTime.now().add(const Duration(days: 6)),
        hours: '13-14',
        status: 'full',
      ),
      ReserveModel(
        day: DateTime.now().add(const Duration(days: 1)),
        hours: '10-11',
        status: 'reserved',
      ),
      ReserveModel(
        day: DateTime.now().add(const Duration(days: 6)),
        hours: '14-15',
        status: 'full',
      ),
      ReserveModel(
        day: DateTime.now().add(const Duration(days: 6)),
        hours: '15-16',
        status: 'full',
      ),
      ReserveModel(
        day: DateTime.now().add(const Duration(days: 1)),
        hours: '11-12',
        status: 'reserved',
      ),
      ReserveModel(
        day: DateTime.now().add(const Duration(days: 3)),
        hours: '17-18',
        status: 'full',
      ),
      ReserveModel(
        day: DateTime.now().add(const Duration(days: 3)),
        hours: '18-19',
        status: 'full',
      ),
      ReserveModel(
        day: DateTime.now().add(const Duration(days: 3)),
        hours: '19-20',
        status: 'full',
      ),
      ReserveModel(
        day: DateTime.now().add(const Duration(days: 3)),
        hours: '8-9',
        status: 'reserved',
      ),
      ReserveModel(
        day: DateTime.now().add(const Duration(days: 3)),
        hours: '9-10',
        status: 'reserved',
      ),
      ReserveModel(
        day: DateTime.now().add(const Duration(days: 5)),
        hours: '10-11',
        status: 'full',
      ),
      ReserveModel(
        day: DateTime.now().add(const Duration(days: 5)),
        hours: '11-12',
        status: 'full',
      ),
      ReserveModel(
        day: DateTime.now().add(const Duration(days: 5)),
        hours: '14-15',
        status: 'full',
      ),
      ReserveModel(
        day: DateTime.now().add(const Duration(days: 5)),
        hours: '15-16',
        status: 'reserved',
      ),
      ReserveModel(
        day: DateTime.now().add(const Duration(days: 4)),
        hours: '20-21',
        status: 'reserved',
      ),
      ReserveModel(
        day: DateTime.now().add(const Duration(days: 4)),
        hours: '18-19',
        status: 'full',
      ),
      ReserveModel(
        day: DateTime.now().add(const Duration(days: 4)),
        hours: '15-16',
        status: 'full',
      ),
      ReserveModel(
        day: DateTime.now().add(const Duration(days: 2)),
        hours: '9-10',
        status: 'reserved',
      ),
      ReserveModel(
        day: DateTime.now().add(const Duration(days: 2)),
        hours: '11-12',
        status: 'full',
      ),
      ReserveModel(
        day: DateTime.now().add(const Duration(days: 2)),
        hours: '17-18',
        status: 'full',
      ),
    ],
  ),
];
