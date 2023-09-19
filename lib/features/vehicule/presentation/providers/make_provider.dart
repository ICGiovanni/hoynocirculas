import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hoy_no_circulas/features/vehicule/domain/entities/entities.dart';
import 'package:hoy_no_circulas/features/vehicule/infrastructure/infrastructure.dart';

final carMakes = FutureProvider<List<CarMake>>((ref) async {
  final repository = CarMakeRepositoryImpl(datasource: CarMakeDataSourceImpl());

  final data = await repository.getAllCarMakes();

  return data;
});
