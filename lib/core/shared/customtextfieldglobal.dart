import 'package:flutter/material.dart';

class CustomTextFieldAuthGlobal extends StatelessWidget {
  final String hintText;
  final String labeltext;
  final IconData iconDate;
  final TextEditingController? mycontroller;
  final String? Function(String?) valid;
  final void Function()? onTabIcon;
  final bool isNumber;
  final bool? obscureText;

  const CustomTextFieldAuthGlobal(
      {Key? key,
      required this.hintText,
      required this.labeltext,
      required this.iconDate,
      required this.mycontroller,
      required this.valid,
      required this.isNumber,
      this.obscureText,
      this.onTabIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 25),
      child: TextFormField(
        keyboardType: isNumber ? const TextInputType.numberWithOptions(decimal: true) : TextInputType.text,
        validator: valid,
        controller: mycontroller,
        obscureText: obscureText == null || obscureText == false ? false : true,
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(fontSize: 14),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
            label: Container(
                margin: const EdgeInsets.symmetric(horizontal: 9),
                child: Text(labeltext)),
            suffixIcon: InkWell(onTap: onTabIcon,child: Icon(iconDate),),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
            )),
      ),
    );
  }
}
