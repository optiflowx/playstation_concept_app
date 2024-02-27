import 'package:flutter_riverpod/flutter_riverpod.dart';

final isSheetOpenProvider = StateProvider.autoDispose<bool>((ref) => false);

final gridChildCountProvider = StateProvider<int>((ref) => 2);
final gridChildAspectProvider = StateProvider<double>((ref) => 4 / 6);

final isIslandExpandedDelayedProvider = StateProvider<bool>((ref) => true);
final isDynamicIslandModeProvider = StateProvider<bool>((ref) => false);
final isIslandExpandedProvider = StateProvider<bool>((ref) => true);

final isDisposedProvider = StateProvider<bool>((ref) => false);

