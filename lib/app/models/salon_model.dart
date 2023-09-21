import 'package:pelato_markazi/app/models/reserve_model.dart';

class SalonModel {
  String? id;
  String? name;
  List<String>? images;
  List<ReserveModel>? reservesTime;
  int? area;
  List<String>? features;
  int? cost;

  SalonModel({
    this.id,
    this.name,
    this.images,
    this.reservesTime,
    this.area,
    this.features,
    this.cost,
  });
}

List<SalonModel> salons = [
  SalonModel(
    name: 'سالن شماره 1',
    area: 80,
    cost: 320000,
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
    reservesTime: [
      ReserveModel(
        day: DateTime.now().add(const Duration(days: 3)),
        times: '8-9',
        status: 'full',
      ),
      ReserveModel(
        day: DateTime.now().add(const Duration(days: 3)),
        times: '9-10',
        status: 'full',
      ),
      ReserveModel(
        day: DateTime.now().add(const Duration(days: 3)),
        times: '13-14',
        status: 'full',
      ),
      ReserveModel(
        day: DateTime.now().add(const Duration(days: 3)),
        times: '14-15',
        status: 'full',
      ),
      ReserveModel(
        day: DateTime.now().add(const Duration(days: 3)),
        times: '15-16',
        status: 'full',
      ),
      ReserveModel(
        day: DateTime.now().add(const Duration(days: 1)),
        times: '10-11',
        status: 'reserved',
      ),
      ReserveModel(
        day: DateTime.now().add(const Duration(days: 1)),
        times: '11-12',
        status: 'reserved',
      ),
      ReserveModel(
        day: DateTime.now().add(const Duration(days: 1)),
        times: '17-18',
        status: 'full',
      ),
      ReserveModel(
        day: DateTime.now().add(const Duration(days: 1)),
        times: '18-19',
        status: 'full',
      ),
      ReserveModel(
        day: DateTime.now().add(const Duration(days: 1)),
        times: '19-20',
        status: 'full',
      ),
    ],
  ),
  SalonModel(
    name: 'سالن شماره 2',
    area: 60,
    cost: 270000,
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
    reservesTime: [
      ReserveModel(
        day: DateTime.now().add(const Duration(days: 4)),
        times: '8-9',
        status: 'full',
      ),
      ReserveModel(
        day: DateTime.now().add(const Duration(days: 4)),
        times: '9-10',
        status: 'full',
      ),
      ReserveModel(
        day: DateTime.now().add(const Duration(days: 4)),
        times: '13-14',
        status: 'full',
      ),
      ReserveModel(
        day: DateTime.now().add(const Duration(days: 4)),
        times: '14-15',
        status: 'full',
      ),
      ReserveModel(
        day: DateTime.now().add(const Duration(days: 4)),
        times: '15-16',
        status: 'full',
      ),
      ReserveModel(
        day: DateTime.now().add(const Duration(days: 2)),
        times: '10-11',
        status: 'reserved',
      ),
      ReserveModel(
        day: DateTime.now().add(const Duration(days: 2)),
        times: '11-12',
        status: 'reserved',
      ),
      ReserveModel(
        day: DateTime.now().add(const Duration(days: 3)),
        times: '17-18',
        status: 'full',
      ),
      ReserveModel(
        day: DateTime.now().add(const Duration(days: 3)),
        times: '18-19',
        status: 'full',
      ),
      ReserveModel(
        day: DateTime.now().add(const Duration(days: 3)),
        times: '19-20',
        status: 'full',
      ),
    ],
  ),
  SalonModel(
    name: 'سالن شماره 3',
    area: 60,
    cost: 250000,
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
    reservesTime: [
      ReserveModel(
        day: DateTime.now().add(const Duration(days: 6)),
        times: '8-9',
        status: 'full',
      ),
      ReserveModel(
        day: DateTime.now().add(const Duration(days: 6)),
        times: '9-10',
        status: 'full',
      ),
      ReserveModel(
        day: DateTime.now().add(const Duration(days: 6)),
        times: '13-14',
        status: 'full',
      ),
      ReserveModel(
        day: DateTime.now().add(const Duration(days: 1)),
        times: '10-11',
        status: 'reserved',
      ),
      ReserveModel(
        day: DateTime.now().add(const Duration(days: 6)),
        times: '14-15',
        status: 'full',
      ),
      ReserveModel(
        day: DateTime.now().add(const Duration(days: 6)),
        times: '15-16',
        status: 'full',
      ),
      ReserveModel(
        day: DateTime.now().add(const Duration(days: 1)),
        times: '11-12',
        status: 'reserved',
      ),
      ReserveModel(
        day: DateTime.now().add(const Duration(days: 3)),
        times: '17-18',
        status: 'full',
      ),
      ReserveModel(
        day: DateTime.now().add(const Duration(days: 3)),
        times: '18-19',
        status: 'full',
      ),
      ReserveModel(
        day: DateTime.now().add(const Duration(days: 3)),
        times: '19-20',
        status: 'full',
      ),
      ReserveModel(
        day: DateTime.now().add(const Duration(days: 3)),
        times: '8-9',
        status: 'reserved',
      ),
      ReserveModel(
        day: DateTime.now().add(const Duration(days: 3)),
        times: '9-10',
        status: 'reserved',
      ),
      ReserveModel(
        day: DateTime.now().add(const Duration(days: 5)),
        times: '10-11',
        status: 'full',
      ),
      ReserveModel(
        day: DateTime.now().add(const Duration(days: 5)),
        times: '11-12',
        status: 'full',
      ),
      ReserveModel(
        day: DateTime.now().add(const Duration(days: 5)),
        times: '14-15',
        status: 'full',
      ),
      ReserveModel(
        day: DateTime.now().add(const Duration(days: 5)),
        times: '15-16',
        status: 'reserved',
      ),
      ReserveModel(
        day: DateTime.now().add(const Duration(days: 4)),
        times: '20-21',
        status: 'reserved',
      ),
      ReserveModel(
        day: DateTime.now().add(const Duration(days: 4)),
        times: '18-19',
        status: 'full',
      ),
      ReserveModel(
        day: DateTime.now().add(const Duration(days: 4)),
        times: '15-16',
        status: 'full',
      ),
      ReserveModel(
        day: DateTime.now().add(const Duration(days: 2)),
        times: '9-10',
        status: 'reserved',
      ),
      ReserveModel(
        day: DateTime.now().add(const Duration(days: 2)),
        times: '11-12',
        status: 'full',
      ),
      ReserveModel(
        day: DateTime.now().add(const Duration(days: 2)),
        times: '17-18',
        status: 'full',
      ),
    ],
  ),
];
