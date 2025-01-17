import 'package:fitmantra/common/color_extension.dart';
import 'package:fitmantra/view/on_boarding/on_boarding_view.dart';
import 'package:flutter/material.dart';

import '../../common_widget/round_button.dart';

class StartedView extends StatefulWidget {
  const StartedView({super.key});

  @override
  State<StartedView> createState() => _StartedViewState();
}

class _StartedViewState extends State<StartedView> {
 
 bool isChangeColor = false;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TColor.white,
      body: Container(
        width: media.width,
        decoration: BoxDecoration( 
          color: isChangeColor ? Colors.black : Colors.white,
      
         
          
            
            ),
            child:

                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    const Spacer(),
                  Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "Fit", 
                        style: TextStyle(
                          color: isChangeColor ? Colors.red : Colors.black, 
                          fontSize: 36,
                           fontWeight: FontWeight.w700,
                           ),
                  ),
                  TextSpan(
                    text: "Mantra", 
                    style: TextStyle(
                      color: isChangeColor ? Colors.white : Colors.red, // Dynamic color for "Mantra"
                      fontSize: 36,
                       fontWeight: FontWeight.w700,
                  ),
                  ),
                  ]
                ),
      ),
                    // "FitMantra", 
                    // style: TextStyle(
                    //   color: isChangeColor ? TColor.white : Colors.black, 
                    //   fontSize: 36,
                    //    fontWeight: FontWeight.w700),
                    //    ),

                  Text(
                    "Everybody Can Train", 
                    style: TextStyle(
                      color: TColor.grey, 
                      fontSize: 18,
                       ),
                       ),

                       const Spacer(),
                       SafeArea(
                         child: Padding(
                           padding: const EdgeInsets.symmetric(horizontal: 15),
                           child: RoundButton(
                            title: "Get Started",
                            type: isChangeColor ? RoundButtonType.textGradient : RoundButtonType.bgGradient, 
                            onPressed: (){

                              if(isChangeColor){
                                // GO NextScreen
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const OnBoardingView()));
                            }else{
                              //Change Color
                              setState((){
                                isChangeColor = true;

                              });
                            }
                            },
                           ), 
                          ),
                       )

                ],
                )
      ),
    );
  }
}