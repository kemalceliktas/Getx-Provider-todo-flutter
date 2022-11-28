import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_todo_app/data/services/storage/services.dart';
import 'package:getx_todo_app/modules/home/binding.dart';
import 'package:getx_todo_app/modules/home/view.dart';
import 'package:getx_todo_app/provider/theme_notifier.dart';
import 'package:provider/provider.dart';

void main() async{
  await GetStorage.init();
  await Get.putAsync(() => StorageService().init());
  runApp(MultiProvider(
    providers: [
      
      ChangeNotifierProvider<ThemeNotifier>(
          create: (context) => ThemeNotifier()),
    ],
    builder: (context, child) => MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Todo List',
      debugShowCheckedModeBanner: false,
      theme: context.watch<ThemeNotifier>().currentTheme,
      home: HomePage(),
      initialBinding: HomeBinding(),
      builder: EasyLoading.init(),
    );
  }
}

