import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/store_providers.dart';

class AnimatedGapView extends ConsumerWidget {
  const AnimatedGapView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSheetOpen = ref.watch(isSheetOpenProvider);

    return AnimatedContainer(
      width: isSheetOpen ? 0 : 70,
      duration: const Duration(milliseconds: 1000),
    );
  }
}
