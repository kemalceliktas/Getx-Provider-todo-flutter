import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../../global_const/duration_items.dart';
import '../../../provider/theme_notifier.dart';


class ThemeChangeIcon extends StatefulWidget {
  @override
  State<ThemeChangeIcon> createState() => _ThemeChangeIconState();
}

class _ThemeChangeIconState extends State<ThemeChangeIcon>
    with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
        vsync: this, duration: DurationItems.durationNormal());
  }

  bool isLight = true;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()async {
       await controller.animateTo(isLight ? 0.5 : 1);
        context.read<ThemeNotifier>().changeTheme();
        isLight = !isLight;
      },
      child: Lottie.network(
        "https://lottie.host/8daa27b3-e519-41fe-98fb-beb2c67c748c/64r3B7a9Vo.json",
        
        repeat: false,
        animate: false,
        controller: controller,
      ),
    );
  }
}
