import 'package:fitmantra/view/login/what_your_goal_view.dart';
import 'package:flutter/material.dart';

import '../../common/color_extension.dart';
import '../../common_widget/round_button.dart';
import '../../common_widget/round_textField.dart';

class CompleteProfileView extends StatefulWidget {
  const CompleteProfileView({super.key});

  @override
  State<CompleteProfileView> createState() => _CompleteProfileViewState();
}

class _CompleteProfileViewState extends State<CompleteProfileView> {
  String? _selectedGender;

  TextEditingController txtDate = TextEditingController();
  @override
  Widget build(BuildContext context) {

   var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TColor.black,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                SizedBox(
                  height: media.height*0.31,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child:
                Image.asset(
                  "assets/img/complete_profile.png", 
                  width: media.width * 0.6, 
                  fit: BoxFit.fitWidth,
                  ),
                  ),
                  ),


                   SizedBox(
                  height: media.width * 0.05, 
                  ),
            
            
                Text("Let's Complete Your Profile" , style: TextStyle(color: TColor.white, fontSize: 24, fontWeight: FontWeight.w700),
                ), 

                Text("It will help us to know more about you!" , style: TextStyle(color: TColor.white, fontSize: 14),
                ),
            
            
                SizedBox(
                  height: media.width * 0.05, 
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Column(
                      children: [

                        Container(

      
                decoration: BoxDecoration(
                  color: TColor.lightGrey, 
                  borderRadius: BorderRadius.circular(15) ),
                child: Row(
                  children: [

                    Container(
                      alignment: Alignment.center,
                      width: 50, 
                      height: 50,
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      
                      child: Image.asset(
                        "assets/img/gender.png", 
                        width: 20, 
                        height: 20, 
                        fit: BoxFit.contain,
                        color: TColor.grey,
                        )),

                       




                    Expanded(
                      child: DropdownButtonHideUnderline(
                        
                        child: DropdownButton<String>(
                          value: _selectedGender, //Set the value
                          
                          items: ["Male", "Female"]
                          .map((name) => DropdownMenuItem(
                            value: name,
                            child: Text(
                                       name,
                                      style: TextStyle(
                                        color: TColor.black, 
                                        fontSize: 16,
                                        
                                      
                                    ), 
                                    ), 
                                    ))
                                    .toList() , 
                                    onChanged: (value){
                                      setState(() {
                                        _selectedGender = value; // Update the selected gender
                                      });
                                    },
                                    isExpanded: true,
                                
                                    hint: Text(
                                       "Choose Gender",
                                      style: TextStyle(
                                        color: TColor.grey, 
                                        fontSize: 12,
                                        
                                      
                                    ), 
                                    ) ,
                                    ),
                      ),
                    ),

                    const SizedBox(width: 8,)

                  ],
                ),),
                        
                        SizedBox(
                  height: media.width * 0.05, 
                  ),



                        RoundTextfield(
                          controller: txtDate,
                        hitText: "Date of Birth", 
                        icon: "assets/img/date.png",
                       
                        
                        
                          ),

                           SizedBox(
                  height: media.width * 0.05, 
                  ),

                          Row(
                            
                            children: [
                              
                               Expanded(
                                 child: RoundTextfield(
                                 controller: txtDate,
                                   hitText: "Your Weight", 
                                  icon: "assets/img/weight.png",
                             ),
                               ),

                               const SizedBox(
                                width: 8,
                               ),

                               Container(
                                width: 50,
                                height: 50,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: TColor.primaryG,),
                                    borderRadius: BorderRadius.circular(15),  
                            ),
                            child: Text(
                              "KG", 
                              style: TextStyle(
                                color: TColor.white, 
                                fontSize: 13, 
                                fontWeight: FontWeight.w700,
                              
                            ), 
                            ),
                            ), 

                          ],
                          ),


                           SizedBox(
                  height: media.width * 0.05, 
                  ),

                          Row(
                            
                            children: [
                              
                               Expanded(
                                 child: RoundTextfield(
                                 controller: txtDate,
                                   hitText: "Your Height", 
                                  icon: "assets/img/height.png",
                             ),
                               ),

                               const SizedBox(
                                width: 8,
                               ),

                               Container(
                                width: 50,
                                height: 50,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: TColor.primaryG,),
                                    borderRadius: BorderRadius.circular(15),  
                            ),
                            child: Text(
                              "CM", 
                              style: TextStyle(
                                color: TColor.white, 
                                fontSize: 13, 
                                fontWeight: FontWeight.w700,
                              
                            ), 
                            ),
                            ), 

                          ],
                          ),

                          SizedBox(
                               height: media.width * 0.07, 
                  ),

                  RoundButton(
                    title: "Next >", 
                    onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => 
                        const WhatYourGoalView()));
                  }), 


                      ],
                    ),
                  ),
            
              ],
            
                  ),
          ),
      ),
      ),
        );
  }
}