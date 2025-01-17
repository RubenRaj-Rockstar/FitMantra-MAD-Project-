import 'package:flutter/material.dart';

import '../common/color_extension.dart';

enum RoundButtonType { bgGradient, bgSGradient, textGradient}

class RoundButton extends StatelessWidget {
  final String title;
  final RoundButtonType type;
  final VoidCallback onPressed;
  final double fontSize;
  final double elevation;
  
  const RoundButton({super.key,
                     required this.title,
                     this.type = RoundButtonType.bgGradient, 
                     this.fontSize = 16,
                     this.elevation = 1,
                     required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
                                 colors: type == RoundButtonType.bgSGradient ? TColor.secondaryG : TColor.primaryG,
                                 ),
                                 borderRadius: BorderRadius.circular(25), 
                                 boxShadow: type == RoundButtonType.bgGradient || type == RoundButtonType.bgSGradient 
                                  ? const [
                                    BoxShadow(
                                      color: Colors.red,
                                       blurRadius: 2, 
                                       offset: Offset(0, 2))
                                       ] 
                                       : null  ),
                       child: MaterialButton(
                              onPressed: onPressed,
                              height: 50, 
                             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                             textColor: TColor.black,
                             minWidth: double.maxFinite,
                             elevation: type == RoundButtonType.bgGradient || type == RoundButtonType.bgSGradient ? 0 : elevation,
                             color: type == RoundButtonType.bgGradient || type == RoundButtonType.bgSGradient 
                             ? Colors.transparent : TColor.white,
                             child:type == RoundButtonType.bgGradient || type == RoundButtonType.bgSGradient 
                             ? Text(title,
                               
                               style: TextStyle(
                                     color: TColor.white, 
                                     fontSize: fontSize,
                                     fontWeight: FontWeight.w700)) 
                                     : ShaderMask(
                              blendMode: BlendMode.srcIn,
                              shaderCallback: (bounds){
                               return LinearGradient(
                                 colors: TColor.primaryG,
                                 begin: Alignment.centerLeft,
                                 end: Alignment.centerRight)
                                 .createShader(Rect.fromLTRB(0, 0, bounds.width, bounds.height));
                              },
                                child:Text(title,
                               
                               style: TextStyle(
                                     color: TColor.primaryColor1, 
                                     fontSize: 16,
                                     fontWeight: FontWeight.w700)),
                            
                               ),
        ),
    );
  }
}