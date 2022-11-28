import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_todo_app/core/utils/extensions.dart';
import 'package:getx_todo_app/global_const/themes.dart';
import 'package:getx_todo_app/modules/detail/view.dart';
import 'package:getx_todo_app/modules/home/controller.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../../data/models/task.dart';

class TaskCard extends StatelessWidget {
  final homeCtrl = Get.find<HomeController>();
  final Task task;
  TaskCard({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    var squareWidth = Get.width - 12.0.wp;
    final color = task.color;
    return InkWell(
      onTap: () {
        homeCtrl.changeTask(task);
        homeCtrl.changeTodos(task.todos ?? []);
        Get.to(()=>DetailPage(),);
      },
      child: CardContainer(squareWidth: squareWidth, homeCtrl: homeCtrl, task: task, color: color),
    );
  }
}

class CardContainer extends StatelessWidget {
  const CardContainer({
    Key? key,
    required this.squareWidth,
    required this.homeCtrl,
    required this.task,
    required this.color,
  }) : super(key: key);

  final double squareWidth;
  final HomeController homeCtrl;
  final Task task;
  final String color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: squareWidth / 2,
      height: squareWidth/2,
      margin: EdgeInsets.all(3.0.wp),
      decoration: BoxDecoration(
        color: LigthColor().cardColor,
        /*  color: Color(int.parse(color)), */
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(20.0.wp),bottomLeft: Radius.circular(5.0.wp)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 20,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          StepProgressIndicator(
            
            totalSteps: homeCtrl.isTodosEmpty(task) ? 1: task.todos!.length,
            currentStep: homeCtrl.isTodosEmpty(task) ? 0:homeCtrl.getDoneTodo(task),
            size: 5,
            padding: 0,
            selectedGradientColor: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
              Color(int.parse(color.substring(6,16))).withOpacity(0.5),
              Color(int.parse(color.substring(6,16))),
                
              ],
            ),
            unselectedGradientColor: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.white,
                Colors.white,
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(6.0.wp),
            child: Icon(
              IconData(
                task.icon,
                fontFamily: "MaterialIcons",
              ),
             color: Color(int.parse(color.substring(6,16))),
            ),
          ),
          Padding(
            padding:  EdgeInsets.all(6.0.wp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(task.title,style: Theme.of(context).textTheme.subtitle1,),
                SizedBox(
                  height: 2.0.wp,
                ),
                Text("${task.todos?.length ?? 0} Task",style:Theme.of(context).textTheme.headline2,),
              ],
            ),
          )
        ],
      ),
    );
  }
}
