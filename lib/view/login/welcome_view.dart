

import 'package:fitmantra/view/main_tab/main_tab_view.dart';
import 'package:flutter/material.dart';

import '../../common/color_extension.dart';
import '../../common_widget/round_button.dart';


class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  @override
  Widget build(BuildContext context) {

    var media = MediaQuery.of(context).size;

    return Scaffold(
    backgroundColor: TColor.black, 
    body: SafeArea(
      child: Container(
        width:media.width,
        padding: const EdgeInsets.symmetric(vertical:15, horizontal: 25 ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max ,
          children: [

            SizedBox(
                  height: media.width * 0.1, 
                  ),
            
            Image.asset(
                  "assets/img/welcome.png", 
                  width: media.width * 0.75,
                  fit: BoxFit.fitWidth,
                  ),
                 


                  SizedBox(
                  height: media.width * 0.1, 
                  ),
                  
            
            
                Text("Welcome, Ishwaar" , 
                style: TextStyle(color: TColor.white, 
                fontSize: 24, 
                fontWeight: FontWeight.w700),
                ), 

                Text("You are all set now, let's reach your\ngoals together with us" ,
                textAlign: TextAlign.center, 
                style: TextStyle(color: TColor.white, 
                fontSize: 14),
                ),
            
            
               const Spacer(),

                   RoundButton(
                    title: "Go To Home", 
                    onPressed: (){
                      Navigator.push(
                        context,
                         MaterialPageRoute(
                          builder: (context) => const MainTabView()));
                    
                  }),
                  
        ]

          
      )),
      
      )) 
     
    ;
  }
}