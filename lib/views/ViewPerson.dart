import 'package:flutter/material.dart';
import 'package:trabalho_final/api/EndPoints.dart';
import 'package:trabalho_final/models/Person.dart';
import 'package:trabalho_final/views/ViewCadastroPerson.dart';
import 'package:trabalho_final/widgets/IconeTelaModal.dart';
import 'package:trabalho_final/widgets/LoadingView.dart';

class ViewPersons extends StatefulWidget {
  const ViewPersons({super.key});

  @override
  State<StatefulWidget> createState() => _ViewPersons();
}

class _ViewPersons extends State<ViewPersons> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastro de Pessoas"),
        actions: const <Widget>[
          IconeTelaModal(icon: Icon(Icons.person_add), conteudo: ViewCadastroPerson()),
        ],
      ),
      body: FutureBuilder(
        future: EndPoints.getPersons(),
        builder: (BuildContext context, AsyncSnapshot<List<Person>?> snapshot)  {
          if (snapshot.hasData && snapshot.data != null && snapshot.data!.isNotEmpty) {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (BuildContext context, int index) {
                return Dismissible(
                  direction: DismissDirection.endToStart,
                  background: Container(
                    color: Colors.black,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: const Icon(Icons.delete_forever),
                  ),
                  key: ValueKey<int> (snapshot.data![index].id!),
                  onDismissed: (DismissDirection direction) async {
                    EndPoints.deletePerson(snapshot.data![index].id);
                  },
                  child: Card(
                      child: ListTile(
                      contentPadding: const EdgeInsets.all(8.0),
                      leading: const Icon(Icons.person),
                      title: Text(snapshot.data![index].name!),
                      subtitle: Text(snapshot.data![index].email.toString()),
                  )),
                );
              }
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: LoadingView());
          } else {
            return Center(
              child: ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/person'),
                child: const Text("Adicionar nova pessoa"),
              ),
            );
          }
        } 
      ),
      );
  }
}