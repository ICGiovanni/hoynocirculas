import 'package:dio/dio.dart';

import 'package:hoy_no_circulas/features/vehicule/domain/domain.dart';
import 'package:hoy_no_circulas/features/vehicule/domain/entities/entities.dart';
import 'package:hoy_no_circulas/features/vehicule/infrastructure/mappers/mappers.dart';

class CarMakeDataSourceImpl extends CarMakeDataSource {
  final dio = Dio();

  @override
  Future<List<CarMake>> getAllCarMakes() async {
    try {
      const url = "https://carapi.app/api/makes";

      final response = await dio.get(url);

      final List<CarMake> data = (response.data["data"] as List)
          .map(
            (item) => CarMakeResponseMapper.jsonToCarMake(item),
          )
          .toList();

      return data;
    } catch (e) {
      throw UnimplementedError();
    }
  }
}
