import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  String titleappbar;
  final void Function()? onPressedIconFavorite;
  final void Function()? onPressedSearch;
  final void Function(String)? onChange;
  final TextEditingController mycontroller;
  CustomAppBar({Key? key,required this.titleappbar, this.onPressedSearch,required this.onPressedIconFavorite, this.onChange,required this.mycontroller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.only(top: 10),
      child: Row(children: [
        Expanded(
            child: TextFormField(
              controller: mycontroller,
              onChanged: onChange,
              decoration: InputDecoration(
                  prefixIcon: IconButton(icon: const Icon(Icons.search),onPressed: onPressedSearch,),
                  hintText: titleappbar,
                  hintStyle: const TextStyle(fontSize: 16),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10)),
                  filled: true,
                  fillColor: Colors.grey[200]),
            )),
        const SizedBox(width: 10),
        Container(
          decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10)),
          width: 60,
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: IconButton(
              onPressed: onPressedIconFavorite,
              icon: Icon(
                Icons.favorite_border_outlined,
                size: 26,
                color: Colors.grey[600],
              )),
        ),
      ]),
    );
  }
}
