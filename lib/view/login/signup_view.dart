import 'package:fitmantra/common/color_extension.dart';
import 'package:fitmantra/common_widget/round_button.dart';
import 'package:fitmantra/common_widget/round_textField.dart';
import 'package:fitmantra/view/login/complete_profile_view.dart';
import 'package:fitmantra/view/login/login_view.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State <SignUpView> createState() =>  _SignUpViewState();
}

class  _SignUpViewState extends State <SignUpView> {

  bool isCheck = false;
  bool _isPasswordVisible = false; //For toggling password visibility

   final _emailController = TextEditingController(); // Controller for email
  final _passwordController = TextEditingController(); // Controller for password

  void _validateAndRegister() {
    String email = _emailController.text.trim();
    String password = _passwordController.text;

    if (email.isEmpty) {
      _showErrorDialog("Email is required.");
      return;
    }

    // Basic email validation
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(email)) {
      _showErrorDialog("Enter a valid email address.");
      return;
    }

    if (password.isEmpty) {
      _showErrorDialog("Password is required.");
      return;
    }

    if (password.length < 6) {
      _showErrorDialog("Password must be at least 6 characters long.");
      return;
    }

    // All validations passed
    print("Email: $email, Password: $password");
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const CompleteProfileView()),
    );
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Validation Error"),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

void _showTermsAndConditions() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Terms & Conditions"),
          content: SingleChildScrollView(
            child: Text(
              "Here are the terms and conditions...\n\n"
              "1. You must agree to the policy of our app.\n"
              "2. Your data will be used responsibly.\n"
              "3. The developer owns any intellectual property rights.",
              style: TextStyle(fontSize: 14),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  isCheck = false; // Uncheck the box if declined
                });
                Navigator.pop(context);
              },
              child: const Text("Decline"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close dialog
              },
              child: const Text("Accept"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TColor.black,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Hey there!," , style: TextStyle(color: TColor.white, fontSize: 18),
                ),
            
            
                Text("Create an Account" , style: TextStyle(color: TColor.white, fontSize: 24, fontWeight: FontWeight.w700),
                ), 
            
            
                SizedBox(
                  height: media.width * 0.05, 
                  ),
                const RoundTextfield(
                  hitText: "First Name", 
                  icon: "assets/img/user_text.png",
                    ),

                    SizedBox(
                  height: media.width * 0.04, 
                  ),
                    const RoundTextfield(
                  hitText: "Last Name", 
                  icon: "assets/img/user_text.png",
                    ), 

                    SizedBox(
                  height: media.width * 0.04, 
                  ),
                     RoundTextfield(
                      controller: _emailController,
                  hitText: "Email", 
                  icon: "assets/img/email.png",
                  keyboardType: TextInputType.emailAddress,
                    ), 


                     SizedBox(
                  height: media.width * 0.04, 
                  ),
                     RoundTextfield(
                      controller: _passwordController,
                  hitText: "Password", 
                  icon: "assets/img/Lock.png",
                  obscureText: !_isPasswordVisible,
                  rigtIcon: TextButton(onPressed: (){
                    setState(() {
        _isPasswordVisible = !_isPasswordVisible; // Toggle the state
                    });
                  }, child: Container(
                      alignment: Alignment.center,
                      width: 20, 
                      height: 20,
                      child: Image.asset(
                         _isPasswordVisible
            ? "assets/img/hide_Password.png" // Image when password is visible
            : "assets/img/show_Password.png", // Image when password is hidden
                        width: 20, 
                        height: 20, 
                        fit: BoxFit.contain,
                        color: TColor.grey,
                        )) ),
                  
                    ),

                  Row(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: (){
                          if(!isCheck){
                            _showTermsAndConditions();
                          }
                          setState((){
                          isCheck = !isCheck;
                          });
                        },
                       icon: Icon(
                       isCheck 
                       ? Icons.check_box_outlined 
                       : Icons.check_box_outline_blank_outlined, 
                        color: TColor.white,
                        size: 20,
                        ),
                        ),
                        

                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child:  Text(
                              "By continuing you accept our Privacy Policy and\nTerm of Use",
                              style: TextStyle(color: TColor.white, fontSize: 10),
                            ),
                            
                            
                          ),
                        ),
                        
                    ],
                  ),


                  SizedBox(
                  height: media.width * 0.2, 
                  ),

                  RoundButton(title: "Register", onPressed: _validateAndRegister), 

                   SizedBox(
                  height: media.width * 0.04, 
                  ),


                  Row(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child:
                      Container(
                         height: 1, 
                         color: TColor.grey,
                      )),
                     Text(
                      "   Or   ",
                      style: TextStyle(color: TColor.white, fontSize: 13),
                     ),
                        
                      Expanded(
                        child:Container(
                         height: 1, 
                         color: TColor.grey,
                      )),
                        
                        
                    ],
                  ),

                   SizedBox(
                  height: media.width * 0.04, 
                  ),



                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                  GestureDetector(
                    onTap: (){}, 
                    child: Container(
                      width: 50,
                      height: 50,
                      alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: TColor.black, 
                      border:Border.all(
                        width: 1, 
                        color: TColor.white, 
                        
                        ),
                         borderRadius: BorderRadius.circular(15),),
                         child: Image.asset(
                          "assets/img/google.png",
                           width: 20,
                           height: 20,
                           ),
                        ),
                        ),

                        SizedBox(
                  width: media.width * 0.1, 
                  ),


                         GestureDetector(
                    onTap: (){}, 
                    child: Container(
                      width: 50,
                      height: 50,
                      alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: TColor.black, 
                      border:Border.all(
                        width: 1, 
                        color: TColor.white, 
                        
                        ),
                         borderRadius: BorderRadius.circular(15),),
                         child: Image.asset(
                          "assets/img/facebook.png",
                           width: 20,
                           height: 20,
                           ),
                        ),
                        )

                 ],),
                  SizedBox(
                  height: media.width * 0.04, 
                  ),

                  TextButton(onPressed: (){ 
                    Navigator.push(
                      context, 
                      MaterialPageRoute(
                        builder: (context) =>  const LoginView()));

                  } ,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [ 
                    Text(
                      "Already have an account? ",
                      style: TextStyle(
                        color: TColor.white, 
                        fontSize: 14),
                     ),
                     

                 

                  Text(
                      " Login",
                      style: TextStyle(
                        color: TColor.white, 
                        fontSize: 13, 
                        fontWeight: FontWeight.w700),
                     ), 
                  ],),),

                   SizedBox(
                  height: media.width * 0.04, 
                  ),




                
                 
              ],
              ),
          ),
        ),
          ),
    );
  }
}