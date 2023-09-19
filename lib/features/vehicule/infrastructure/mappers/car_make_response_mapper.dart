import '../../domain/entities/car_make.dart';

class CarMakeResponseMapper {
  static CarMake jsonToCarMake(Map<String, dynamic> json) {
    return CarMake(
      id: json['id'],
      name: json['name'],
    );
  }
}
