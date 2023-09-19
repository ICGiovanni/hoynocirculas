import 'package:flutter_riverpod/flutter_riverpod.dart';

final listIsOpenExpansionDetails =
    StateProvider.autoDispose<List<bool>>((ref) => [false, false, false]);
