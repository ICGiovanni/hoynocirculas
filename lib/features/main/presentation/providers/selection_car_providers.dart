import 'package:flutter_riverpod/flutter_riverpod.dart';

final myCarsProvider = Provider<List<String>>((ref) {
  return ['Toyota Aqua', 'Mazda CX5', 'Chevrolet Aveo', 'Ford Runner'];
});

final heightItemCarsProvider = Provider<double>(
  (ref) {
    return 45.0;
  },
);

final baseHeightCarsProvider = Provider<double>(
  (ref) {
    return 60.0;
  },
);

final heightContainerCarsProvider = Provider<double>(
  (ref) {
    return ref.watch(myCarsProvider).length * ref.watch(baseHeightCarsProvider);
  },
);

final selectedCarIndexProvider = StateProvider<int>(
  (ref) {
    return 0;
  },
);

final flagCarsProvider = StateProvider<bool>(
  (ref) {
    return true;
  },
);
