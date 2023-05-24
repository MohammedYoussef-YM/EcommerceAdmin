import 'package:flutter/material.dart';

class CardAdmin extends StatelessWidget {
  final String url;
  final String title;
  final void Function()? onClick;
  const CardAdmin({Key? key, required this.url, required this.title,required this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return           InkWell(
      onTap: onClick,
      child: Card(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(url,width: 80,),
          Text(title)
        ],),),
    );
  }
}
