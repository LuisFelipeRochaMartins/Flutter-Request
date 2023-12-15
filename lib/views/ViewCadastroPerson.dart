import 'package:flutter/material.dart';
import 'package:trabalho_final/api/EndPoints.dart';
import 'package:trabalho_final/models/Person.dart';
import 'package:trabalho_final/widgets/Input.dart';

class ViewCadastroPerson extends StatelessWidget {
  const ViewCadastroPerson({super.key});
  
  @override
  Widget build(BuildContext context) {
    var pessoa = Person();
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    return  Container(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: formKey,
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Input(placeholder: "Digite o nome" , icon: const Icon(Icons.web_rounded), valida: true, controller: nameController , onChanged: (value) => pessoa.name = nameController.text),
            Input(placeholder: "Digite o email", icon: const Icon(Icons.email)      , valida: true, controller: emailController, onChanged: (value) => pessoa.email = emailController.text),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    EndPoints.addNewPerson(pessoa);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Data')),
                    );
                    Navigator.pop(context, true);
                  }
                },
                child: const Text('Enviar'),
              ),
            ),
          ],
        ),
      )
    );
  }
}