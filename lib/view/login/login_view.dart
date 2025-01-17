import 'package:fitmantra/common/color_extension.dart';
import 'package:fitmantra/common_widget/round_button.dart';
import 'package:fitmantra/common_widget/round_textField.dart';
import 'package:fitmantra/view/login/complete_profile_view.dart';
import 'package:fitmantra/view/login/welcome_view.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State <LoginView> createState() =>  _LoginViewState();
}

class  _LoginViewState extends State <LoginView> {

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
      MaterialPageRoute(builder: (context) => const WelcomeView()),
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
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TColor.black,
      body: SingleChildScrollView(
        child: SafeArea(
          child:Container(

            height: media.height,
           
      
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                Text(
                  "Hey there!," , 
                  style: TextStyle(color: TColor.white, fontSize: 18),
                ),
            
            
                Text(
                  "Welcome Back" , 
                  style: TextStyle(color: TColor.white, fontSize: 24, fontWeight: FontWeight.w700),
                ), 
            
            
                SizedBox(
                  height: media.width * 0.05, 
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
                  obscureText:  !_isPasswordVisible,
                  rigtIcon: TextButton(
                    onPressed: (){
                      setState(() {
        _isPasswordVisible = !_isPasswordVisible; // Toggle the state
                    });
                    },
                     child: Container(
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    
                        SizedBox(
                  height: media.width * 0.08, 
                  ),
                       
                       
                        Text(
                            "Forgot your password?",
                            style: TextStyle(
                              color: TColor.white, 
                              fontSize: 13, 
                              decoration: TextDecoration.underline,
                              
                               ),
                          ),
                          
                          
                        
                        
                    ],
                  ),
                  


                  SizedBox(
                  height: media.width * 0.55, 
                  ),
                  

                  RoundButton(title: "Login", onPressed: _validateAndRegister),
                 

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
                    Navigator.pop(context);
                  } , child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [ 
                    Text(
                      "Don't have an account?",
                      style: TextStyle(
                        color: TColor.white, 
                        fontSize: 14),
                     ),
                     

                 

                  Text(
                      " Register",
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