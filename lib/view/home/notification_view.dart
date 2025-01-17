import 'package:fitmantra/common/color_extension.dart';
import 'package:flutter/material.dart';

import '../../common_widget/notification_row.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({super.key});

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  List notificationArr = [
    {"image": "assets/img/food_1.png", "title": "Hey, it’s time for lunch", "time": "About 1 minutes ago"},
    {"image": "assets/img/workout2.png", "title": "Don’t miss your lowerbody workout", "time": "About 3 hours ago"},
    {"image": "assets/img/food_2.png", "title": "Hey, let’s add some meals for your ...", "time": "About 3 hours ago"},
    {"image": "assets/img/workout1.png", "title": "Congratulations, You have finished A..", "time": "29 May"},
    {"image": "assets/img/food_2.png", "title": "Hey, it’s time for lunch", "time": "8 April"},
    {"image": "assets/img/workout3.png", "title": "Ups, You have missed your Lowerbo...", "time": "8 April"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColor.black,
        centerTitle: true,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            margin: const EdgeInsets.all(8),
            height: 40,
            width: 40,
            alignment: Alignment.center,
            
            child: Image.asset(
              "assets/img/back_btn.png",
              width: 15,
              height: 15,
              fit: BoxFit.contain,
            ),
          ),
        ),
        title: Text(
          "Notification",
          style: TextStyle(
              color: TColor.white, fontSize: 16, fontWeight: FontWeight.w700),
        ),
        actions: [
          InkWell(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.all(8),
              height: 40,
              width: 40,
              alignment: Alignment.center,
             
              child: Image.asset(
                "assets/img/more_btn.png",
                width: 12,
                height: 12,
                fit: BoxFit.contain,
              ),
            ),
          )
        ],
      ),
      backgroundColor: TColor.black,
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
        itemBuilder: ((context, index) {
          var nObj = notificationArr[index] as Map? ?? {};
          return NotificationRow(nObj: nObj);
      }), separatorBuilder: (context, index){
        return Divider(color: TColor.grey.withOpacity(0.5), height: 1, );
      }, itemCount: notificationArr.length),
    );
  }
}