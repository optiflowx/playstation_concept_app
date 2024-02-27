import 'package:flutter_riverpod/flutter_riverpod.dart';

final isDrawerOpenProvider = StateProvider<bool>((ref) => false);
final currentItemIndexProvider = StateProvider<int>((ref) => 0);
final itemAnimationValueProvider = StateProvider<double>((ref) => 0.0);