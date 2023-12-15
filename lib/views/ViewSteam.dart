import 'package:flutter/material.dart';
import 'package:trabalho_final/api/EndPoints.dart';
import 'package:trabalho_final/models/Games.dart';
import 'package:trabalho_final/widgets/LoadingView.dart';

class ViewSteam extends StatefulWidget {
  const ViewSteam({super.key});

  @override
  State<StatefulWidget> createState() => _ViewSteam();
}

class _ViewSteam extends State<ViewSteam> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: EndPoints.getWishListGames(),
        builder: (BuildContext context, AsyncSnapshot<List<Games>?> snapshot) {
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
                  key: ValueKey<String> (snapshot.data![index].name!),
                  child: Card(
                      child: ListTile(
                      contentPadding: const EdgeInsets.all(8.0),
                      leading: const Icon(Icons.gamepad),
                      title: Text(snapshot.data![index].name!),
                      subtitle: Text(snapshot.data![index].review! + "  " + snapshot.data![index].price.toString()),
                  )),
                );
              }
            );
          } else {
              return const Center(child: LoadingView());
          } 
        } 
      ),
    );
  }

}