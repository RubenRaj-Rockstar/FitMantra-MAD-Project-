import 'package:fitmantra/common/color_extension.dart';
import 'package:flutter/material.dart';

class TabButton extends StatelessWidget {

  final String icon;
  final String selectIcon;
  final VoidCallback onTap;
  final bool isActive;

  const TabButton({super.key, required this.icon, required this.selectIcon, required this.isActive, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: onTap,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                  Image.asset( isActive ? selectIcon : icon, 
                  width: 30, height: 30, fit: BoxFit.fitWidth ),

                   SizedBox(
                    height: isActive ? 8: 12,
                    ),

                  if(isActive)


                  Container(width: 4, height: 4, decoration: BoxDecoration(gradient: LinearGradient(colors: TColor.primaryG,), borderRadius: BorderRadius.circular(2)),

                  ),
                ]), 
                );
  }
}