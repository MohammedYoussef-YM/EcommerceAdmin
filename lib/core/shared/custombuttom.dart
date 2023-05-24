import 'package:admin/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustumButtom extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const CustumButtom({Key? key, this.onPressed, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10,right: 20,left: 20),
      child: MaterialButton(
        onPressed: onPressed,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: AppColor.primaryColor,
      textColor: AppColor.white,
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Text(text),
      ),
    );
  }
}
