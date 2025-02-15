import 'package:fitmantra/common/color_extension.dart';
import 'package:fitmantra/common_widget/tab_button.dart';
import 'package:fitmantra/view/home/blank_view.dart';
import 'package:fitmantra/view/main_tab/select_view.dart';
import 'package:fitmantra/view/photo_progress/photo_progress_view.dart';
import 'package:flutter/material.dart';

import '../home/home_view.dart';
import '../profile/profile_view.dart';
import '../workout_tracker/workout_tracker_view.dart';



class MainTabView extends StatefulWidget {
  const MainTabView({super.key});

  @override
  State<MainTabView> createState() => _MainTabViewState();
}

class _MainTabViewState extends State<MainTabView> {
  int selectTab = 0;
  final PageStorageBucket pageBucket = PageStorageBucket();
  Widget currentTab = const HomeView();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColor.black,
      body: PageStorage(bucket: pageBucket, child: currentTab),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(width: 70, height: 70, child: InkWell( onTap: (){}, child: Container(
        width: 65,
        height: 65,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: TColor.primaryG,
          ),
          borderRadius: BorderRadius.circular(35)
        ),
        child: Icon(Icons.search, color: TColor.white, size: 35,),

      ),),),
      bottomNavigationBar: BottomAppBar(
        child: Container(

          
            height: kToolbarHeight, 
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                 
                TabButton(
                  icon: "assets/img/home_tab.png",
                   selectIcon: "assets/img/home_tab_select.png" , 
                   isActive: selectTab ==0, onTap: (){
                selectTab = 0;
                currentTab = const HomeView();
                if(mounted){
                  setState(() {});
                }
                
                }),
                 

                 TabButton(
                  icon: "assets/img/activity_tab.png",
                   selectIcon: "assets/img/activity_tab_select.png" ,
                    isActive: selectTab ==1, onTap: (){
                selectTab = 1;
                currentTab = const SelectView();
                if(mounted){
                  setState(() {});
                }
                
                }),

                const SizedBox(width: 50, ),

                TabButton(
                  icon: "assets/img/camera_tab.png",
                   selectIcon: "assets/img/camera_tab_select.png" ,
                    isActive: selectTab ==2, onTap: (){
                selectTab = 2;
                 currentTab = const PhotoProgressView();
                if(mounted){
                  setState(() {});
                }
                
                }),

                

                TabButton(
                  icon: "assets/img/profile_tab.png",
                   selectIcon: "assets/img/profile_tab_select.png" ,
                    isActive: selectTab ==3, onTap: (){
                selectTab = 3;
                 currentTab = const ProfileView();
                if(mounted){
                  setState(() {});
                }
                
                })
            
               
              ],
            ),
          
        )),
    );
  }
}