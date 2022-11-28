import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:getx_todo_app/core/utils/extensions.dart';
import 'package:getx_todo_app/core/values/colors.dart';
import 'package:getx_todo_app/data/models/task.dart';
import 'package:getx_todo_app/global_const/themes.dart';
import 'package:getx_todo_app/modules/home/controller.dart';
import 'package:getx_todo_app/widgets/icons.dart';
import 'package:provider/provider.dart';
import 'package:string_to_hex/string_to_hex.dart';

import '../../../provider/theme_notifier.dart';

class AddCard extends StatelessWidget {
  AddCard({super.key});
  final homeCtrl = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    final icons = getIcons();
    var squareWidth = Get.width - 12.0.wp;
    return Container(
      width: squareWidth / 2,
      height: squareWidth ,
      margin: EdgeInsets.all(3.0.wp),
      child: InkWell(
        onTap: () async {
          await Get.defaultDialog(
            titlePadding: EdgeInsets.symmetric(vertical: 5.0.wp),
            radius: 5,
            title: "Task Type",
            content: Form(
              
              key: homeCtrl.formKey,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 3.0.wp),
                    child: TextFormField(
                      style: TextStyle(
                        
                        color: Colors.grey
                        ),
                      controller: homeCtrl.editCntrl,
                      decoration: const InputDecoration(
                        
                        border: OutlineInputBorder(),
                        labelText: "Title",
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "Please enter your task title";
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.0.wp),
                    child: Wrap(
                      spacing: 2.0.wp,
                      children: icons
                          .map((e) => Obx(() {
                                final index = icons.indexOf(e);
                                return ChoiceChip(
                                 
                                  pressElevation: 0,
                                 
                                  label: e,
                                  selected: homeCtrl.chipIndex.value == index,
                                  onSelected: (bool selected) {
                                    homeCtrl.chipIndex.value =
                                        selected ? index : 0;
                                  },
                                );
                              }))
                          .toList(),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: LigthColor().buttonColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      minimumSize: Size(150, 40),
                    ),
                    onPressed: () {
                      if (homeCtrl.formKey.currentState!.validate()) {
                        int icon =
                            icons[homeCtrl.chipIndex.value].icon!.codePoint;
                        Color color =
                            icons[homeCtrl.chipIndex.value].color!;
                        var task = Task(
                          title: homeCtrl.editCntrl.text,
                          icon: icon,
                          color: color.toString(),
                        );
                        print(icons[homeCtrl.chipIndex.value].color.toString().substring(6,16));
                        Get.back();
                        homeCtrl.addTask(task)
                            ? EasyLoading.showSuccess("Create success")
                            : EasyLoading.showError("Duplicated Task");
                      }
                    },
                    child: Text("Confirm"),
                  ),
                ],
              ),
            ),
          );
          homeCtrl.editCntrl.clear();
          homeCtrl.changeChipIndex(0);
        },
        child: DottedBorder(
          color: Colors.grey[400]!,
          dashPattern: [8, 4],
          child: Center(
            child: Icon(
              Icons.add,
              size: 10.0.wp,
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
