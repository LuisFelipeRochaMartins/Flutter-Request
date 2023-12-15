import 'package:flutter/material.dart';
import 'package:trabalho_final/widgets/IconeSideBar.dart';

class ViewHome extends StatefulWidget {
  const ViewHome({super.key});

  @override
  State<StatefulWidget> createState() => _ViewHome(); 
}


class _ViewHome extends State<ViewHome> {
  dynamic person;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Trabalho Final"),
        actions: const <Widget>[
          IconeSideBar(icon: Icon(Icons.person), path: '/person'),
          IconeSideBar(icon: Icon(Icons.shopping_cart_rounded), path: '/steam')
        ],
      ),
    );
  }
}

