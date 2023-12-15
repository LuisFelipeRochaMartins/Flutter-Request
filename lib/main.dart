import 'package:flutter/material.dart';
import 'package:trabalho_final/views/ViewHome.dart';
import 'package:trabalho_final/views/ViewPerson.dart';
import 'package:trabalho_final/views/ViewSteam.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Aplicativo",
    initialRoute: '/',
    theme: ThemeData.dark(),
    routes: {
      '/' :       (context) => const ViewHome(),
      '/person' : (context) => const ViewPersons(),
      '/steam'  : (context) => const ViewSteam()
    }
  ));
}