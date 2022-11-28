


import 'dart:ui';

import 'package:get/get.dart';

extension PercentSized on double{
  double get hp=> (Get.height *(this /100));
  double get wp=> (Get.width *(this /100));
}

extension ResponsiveText on double{
  double get sp=> Get.width/100 *(this/3);
}


