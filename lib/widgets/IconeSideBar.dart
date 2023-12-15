import 'package:flutter/material.dart';

class IconeSideBar extends StatelessWidget {

  final Icon? icon;
  final String? path;

  const IconeSideBar({
    Key? key, 
    this.icon,
    this.path,
  }) : super(key : key);
  

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: () => Navigator.pushNamed(context, path.toString()), icon: icon as Icon);
  }

}