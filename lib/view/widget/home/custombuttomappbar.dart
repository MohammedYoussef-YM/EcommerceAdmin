import 'package:admin/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomButtomAppBar extends StatelessWidget {
  final void Function() onPressed;
  final String textbutton;
  final IconData iconData;
  final bool active;
  const CustomButtomAppBar({Key? key,required this.onPressed, required this.textbutton, required this.iconData,required this.active}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [Icon(iconData,color:active == true ? AppColor.primaryColor: AppColor.grey2),
          Text(textbutton,style: TextStyle(color:active == true ? AppColor.primaryColor: AppColor.grey2),),
        ],
      ),);
  }
}
