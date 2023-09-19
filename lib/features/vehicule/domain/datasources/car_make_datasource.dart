import 'package:hoy_no_circulas/features/vehicule/domain/entities/entities.dart';

abstract class CarMakeDataSource {
  Future<List<CarMake>> getAllCarMakes();
}
