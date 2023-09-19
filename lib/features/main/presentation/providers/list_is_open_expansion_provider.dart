import 'package:flutter_riverpod/flutter_riverpod.dart';

final listIsOpenExpansionPanel =
    StateProvider.autoDispose<List<bool>>((ref) => [false, false]);
