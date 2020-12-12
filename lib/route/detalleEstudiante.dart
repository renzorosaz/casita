import 'package:casashp/models/estudiantesHP.dart';
import 'package:casashp/utils/httphelper.dart';
import 'package:flutter/material.dart';

class DetallEstudiantePage extends StatefulWidget {
  String nombreEstud;
  DetallEstudiantePage(this.nombreEstud);

  @override
  _DetallEstudiantePageState createState() =>
      _DetallEstudiantePageState(this.nombreEstud);
}

class _DetallEstudiantePageState extends State<DetallEstudiantePage> {
  HttpHelper helper;
  String nombreEstud;

  _DetallEstudiantePageState(this.nombreEstud);

  @override
  void initState() {
    helper = HttpHelper();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detalle")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(children: [
            FutureBuilder<EstudianteHp>(
              future: helper.detalleEstudiante(nombreEstud),
              builder:
                  (BuildContext context, AsyncSnapshot<EstudianteHp> snapshot) {
                if (snapshot.hasData) {
                  EstudianteHp estHP = snapshot.data;
                  print(estHP);
                  return ListTile(
                    subtitle: Text(estHP.yearOfBirth.toString()),
                    title: Text(estHP.name),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (c) {
                        return DetallEstudiantePage(estHP.name);
                      }));
                    },
                  );
                } else if (snapshot.hasError) {
                  return Text(snapshot.error);
                }
              },
            ),
          ]),
        ),
      ),
    );
  }
}
