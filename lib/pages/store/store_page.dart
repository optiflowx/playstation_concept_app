import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:playstation_concept_app/providers/store_providers.dart';
import '../../constants/colors.dart';
import '../../core/globals.dart';
import '../../data/stores.dart';
import 'components/shopping_appbar.dart';
import 'components/shopping_details_bottom_sheet.dart';
import 'components/store_item_card.dart';
import 'components/store_item_card_wrapper.dart';

class ShoppingPage extends ConsumerStatefulWidget {
  const ShoppingPage({Key? key}) : super(key: key);

  @override
  ConsumerState createState() => _ShoppingPageState();
}

class _ShoppingPageState extends ConsumerState<ShoppingPage>
    with TickerProviderStateMixin {
  //Animations
  late AnimationController animationController;
  late final Animation<Color?> backgroundColorAnimation;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
      reverseDuration: const Duration(milliseconds: 700),
    );

    backgroundColorAnimation =
        ColorTween(begin: deepBlue, end: Colors.white).animate(
      CurvedAnimation(
          parent: appBarBackgroundAnimationController, curve: Curves.easeIn),
    );

    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //PROPERTIES::
    final isSheetOpen = ref.watch(isSheetOpenProvider);
    final crossAxisCount = ref.watch(gridChildCountProvider);
    final childAspectRatio = ref.watch(gridChildAspectProvider);

    final PreferredSize appBar = PreferredSize(
      preferredSize: const Size.fromHeight(120),
      child: StoreAppBar(backgroundColorAnimation),
    );

    //BODY::
    return WillPopScope(
      onWillPop: () async {
        if (isSheetOpen) {
          ref.read(isSheetOpenProvider.notifier).state = false;
          appBarBackgroundAnimationController.forward();
          return true;
        } else {
          return false;
        }
      },
      child: Scaffold(
        backgroundColor: white,
        extendBodyBehindAppBar: true,
        extendBody: true,
        appBar: appBar,
        body: Container(
          margin: const EdgeInsets.only(left: 15, right: 15, top: 15),
          child: GridView.builder(
            cacheExtent: 0,
            itemCount: ps5Items.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              childAspectRatio: childAspectRatio,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
            ),
            itemBuilder: (ctx, index) {
              final item = ps5Items[index];
              final img = item['img'];
              final title = item['title'];
              final subtitle = item['subtitle'];
              final description = item['description'];
              final price = item['price'];
              final features = item['features'];

              const duration = Duration(milliseconds: 650);

              return GestureDetector(
                onTap: () {
                  ref.read(isSheetOpenProvider.notifier).state = true;
                  appBarBackgroundAnimationController.reverse();

                  itemBottomSheet(
                    img: img,
                    title: title,
                    subtitle: subtitle,
                    description: description,
                    price: price,
                    features: features,
                  );
                },
                child: AnimatedSwitcher(
                  duration: duration,
                  child: StoreItemCardWrapper(
                    child: StoreItemCard(
                      img: img,
                      title: title,
                      subtitle: subtitle,
                      price: price,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  dynamic itemBottomSheet({
    required img,
    required title,
    required subtitle,
    required description,
    required double price,
    required List<String> features,
  }) {
    showBottomSheet(
      context: context,
      enableDrag: false,
      elevation: 15,
      transitionAnimationController: animationController,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.725,
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
      ),
      builder: (context) {
        return CartBottomSheet(
          img: img,
          title: title,
          subtitle: subtitle,
          description: description,
          price: price,
          features: features,
        );
      },
    );
  }
}
