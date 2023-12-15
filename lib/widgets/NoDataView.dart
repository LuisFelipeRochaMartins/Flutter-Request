import 'package:flutter/material.dart';

class NoDataView extends StatelessWidget {
  const NoDataView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Não existe dados para ser exibido", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
    ); 
  }

}