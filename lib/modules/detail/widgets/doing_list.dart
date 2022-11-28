import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_todo_app/core/utils/extensions.dart';
import 'package:getx_todo_app/modules/home/controller.dart';
import 'package:lottie/lottie.dart';

class DoingList extends StatelessWidget {
  final homeCtrl = Get.find<HomeController>();

   DoingList({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      ()=>homeCtrl.doingTodos.isEmpty && homeCtrl.doneTodos.isEmpty
      ? Column(
        children: [
          SizedBox(height: 12.0.wp,),
          Lottie.network("https://assets10.lottiefiles.com/packages/lf20_hylaaytn.json",
          
          fit: BoxFit.cover,
          width: 80.0.wp,
          ),
       
         
        ],
      ): ListView(
        shrinkWrap: true,

        physics: ClampingScrollPhysics(),
        children: [
          ...homeCtrl.doingTodos.map((element) => 
          Padding(
            padding:  EdgeInsets.symmetric(vertical: 3.0.wp,horizontal: 9.0.wp),
            child: Row(

              children: [
                SizedBox(
                  width: 20,
                  height: 20,
                  child: Checkbox(
                    fillColor: MaterialStateProperty.resolveWith((states) => Colors.grey),
                    value: element["done"],
                    onChanged: (value) {
                      homeCtrl.doneTodo(element["title"]);
                    },
                  ),
                ),
               
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 4.0.wp),
                  child: Text(element["title"],overflow: TextOverflow.ellipsis,),
                )
              ],
            ),
          ),
          ).toList(),
          if(homeCtrl.doingTodos.isNotEmpty)
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 5.0.wp,),
            child: Divider(thickness: 2,),
          ),
        ],
      )
    );
  }
}