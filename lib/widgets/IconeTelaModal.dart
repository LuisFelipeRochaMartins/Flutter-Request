import 'package:flutter/material.dart';

class IconeTelaModal extends StatelessWidget {

  final Icon? icon;
  final VoidCallback? onPressed;
  final Widget conteudo;

  const IconeTelaModal({
    super.key, 
    this.icon, 
    this.onPressed, 
    required this.conteudo, 
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        if (onPressed != null) {
          onPressed!();
        }

        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return conteudo;
          },
        );
      },
      icon: icon as Icon,
    );
  }
}