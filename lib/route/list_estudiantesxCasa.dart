import 'package:casashp/models/estudiantesHP.dart';
import 'package:casashp/route/detalleEstudiante.dart';
import 'package:casashp/utils/httphelper.dart';
import 'package:flutter/material.dart';

class ListEstudiantesPage extends StatefulWidget {

  String casa;
  ListEstudiantesPage(this.casa);

  @override
  _ListEstudiantesPageState createState() =>
      _ListEstudiantesPageState(this.casa);
}

class _ListEstudiantesPageState extends State<ListEstudiantesPage> {
  HttpHelper helper;
  String casa;
  _ListEstudiantesPageState(this.casa);

  @override
  void initState() {
    helper = HttpHelper();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Estudiantes"),
      ),
      body: FutureBuilder<List>(
        future: helper.getEStudiantesxCasa(casa),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
           // List<EstudianteHp> estudiantes = snapshot.data;
            List estudiantes = snapshot.data;

            return ListView.builder(
                itemCount:estudiantes.length ,
                itemBuilder: (c, i) {
                  return ListTile(
                    leading: Container(
                        child: Image.network(estudiantes[i]["image"])),
                    subtitle: Text(estudiantes[i]["yearOfBirth"].toString()),
                    title: Text(estudiantes[i]["name"].toString()),
                    onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (c) {
                      return DetallEstudiantePage(estudiantes[i]["name"]);
                    }));
                  },
                  );

                  // return ListTile(
                  //   leading: Container(
                  //       child: Image.network(estudiantes[i].image)),
                  //   subtitle: Text(estudiantes[i].yearOfBirth.toString()),
                  //   title: Text(estudiantes[i].name),
                  //   onTap: () {
                  //   Navigator.push(context, MaterialPageRoute(builder: (c) {
                  //     return DetallEstudiantePage(estudiantes[i].name);
                  //   }));
                  // },
                  // );
                });
          }
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }

          return Text("Cargando");
        },
      ),
    );
  }
}
