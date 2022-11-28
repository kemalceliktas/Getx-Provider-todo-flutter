import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_todo_app/core/utils/extensions.dart';
import 'package:getx_todo_app/modules/home/controller.dart';

class DoneList extends StatelessWidget {
  final homeCntrl = Get.find<HomeController>();
  DoneList({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => homeCntrl.doneTodos.isNotEmpty
          ? ListView(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 2.0.wp, horizontal: 5.0.wp),
                  child: Text(
                    "Complated(${homeCntrl.doneTodos.length})",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14.0.sp,
                    ),
                  ),
                ),
                ...homeCntrl.doneTodos
                    .map((element) => Dismissible(
                      key: ObjectKey(element),
                      direction: DismissDirection.endToStart,
                      onDismissed: (_) => homeCntrl.deleteDoneTodo(element),
                      background: Container(
                        color: Colors.red.withOpacity(0.8),
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding:  EdgeInsets.only(right: 5.0.wp),
                          child: Icon(Icons.delete,
                          color: Colors.white,),
                        ),
                      ),
                      child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 3.0.wp, horizontal: 9.0.wp),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: Icon(
                                    Icons.done,
                                    color: Colors.blue,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 4.0.wp),
                                  child: Text(
                                    element["title"],
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        decoration: TextDecoration.lineThrough),
                                  ),
                                )
                              ],
                            ),
                          ),
                    ))
                    .toList(),
              ],
            )
          : Container(),
    );
  }
}
