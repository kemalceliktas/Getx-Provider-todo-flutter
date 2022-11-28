import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:getx_todo_app/data/models/task.dart';
import 'package:getx_todo_app/global_const/themes.dart';
import 'package:getx_todo_app/modules/home/controller.dart';
import 'package:getx_todo_app/core/utils/extensions.dart';
import 'package:getx_todo_app/modules/home/widgets/add_card.dart';
import 'package:getx_todo_app/modules/home/widgets/add_dialog.dart';
import 'package:getx_todo_app/modules/home/widgets/task_card.dart';
import 'package:getx_todo_app/modules/home/widgets/theme_change.dart';
import 'package:getx_todo_app/modules/report/view.dart';
import 'package:getx_todo_app/provider/theme_notifier.dart';
import 'package:provider/provider.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        actions: [
          ThemeChangeIcon(),
        ],
      ),
      body: Obx(
        () => IndexedStack(index: controller.tabIndex.value, children: [
          SafeArea(
            child: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.all(4.0.wp),
                  child: Text(
                    "My List",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ),
                Obx(
                  () => GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    children: [
                      ...controller.tasks
                          .map(
                            (element) => LongPressDraggable(
                              data: element,
                              onDragStarted: () =>
                                  controller.changeDeleting(true),
                              onDraggableCanceled: (_, __) =>
                                  controller.changeDeleting(false),
                              onDragEnd: (_) =>
                                  controller.changeDeleting(false),
                              feedback: Opacity(
                                opacity: 0.8,
                                child: TaskCard(task: element),
                              ),
                              child: TaskCard(
                                task: element,
                              ),
                            ),
                          )
                          .toList(),
                      AddCard(),
                    ],
                  ),
                )
              ],
            ),
          ),
          ReportPage(),
        ]),
      ),
      floatingActionButton: DragTarget<Task>(
        builder: (_, __, ___) {
          return Obx(
            () => FloatingActionButton(
              backgroundColor:
                  controller.deleting.value ? LigthColor().buttonColor: DarkColor().buttonColor,
              onPressed: () {
                if (controller.tasks.isNotEmpty) {
                  Get.to(() => AddDialog(), transition: Transition.downToUp);
                } else {
                  EasyLoading.showInfo("Please create your task type");
                }
              },
              child: Icon(controller.deleting.value ? Icons.delete : Icons.add),
            ),
          );
        },
        onAccept: (Task task) {
          controller.deleteTask(task);
          EasyLoading.showSuccess("Delete Success");
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Theme(
        data: context.watch<ThemeNotifier>().currentTheme,
        child: Obx(()=>
           BottomNavigationBar(
            
            onTap: (int index) => controller.changeTabIndex(index),
            currentIndex: controller.tabIndex.value,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: [
              BottomNavigationBarItem(
                label: "Home",
                icon: Padding(
                  padding: EdgeInsets.only(right: 15.0.wp),
                  child: Icon(Icons.home),
                ),
              ),
              BottomNavigationBarItem(
                label: "Report",
                icon: Padding(
                  padding: EdgeInsets.only(left: 15.0.wp),
                  child: Icon(Icons.data_usage),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
