import 'package:hoy_no_circulas/features/vehicule/domain/domain.dart';
import 'package:hoy_no_circulas/features/vehicule/domain/entities/entities.dart';

class CarMakeRepositoryImpl extends CarMakeRepository {
  final CarMakeDataSource datasource;

  CarMakeRepositoryImpl({required this.datasource});
  @override
  Future<List<CarMake>> getAllCarMakes() {
    return datasource.getAllCarMakes();
  }
}
