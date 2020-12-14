import 'dart:convert';

import 'package:casashp/models/estudiantesHP.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class HttpHelper {
  String baseUrl = "http://hp-api.herokuapp.com/api/characters/students";
  String baseUrl2 = "http://hp-api.herokuapp.com/api/characters";

  Future<List> getCasas() async {
    var response = await http.get(baseUrl);

    List<String> listaSinDuplicados = new List<String>();

    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      List casas = jsonResponse;
      List casasNom = casas.map((e) => e['house']).toList();

      var distinctIds =
          casasNom.toSet().toList(); // quita duplicados de la lista recuperada

      print(distinctIds);
      return distinctIds;
    } else {
      print(response.statusCode);
    }
  }

  Future<List> getEStudiantesxCasa(String nombreCasa) async {
    var response = await http.get(baseUrl2 + "/house/" + nombreCasa);

    if (response.statusCode == 200) {
      var jsonReponse = convert.jsonDecode(response.body);

      print(jsonReponse);
      List estudiantes = jsonReponse.map((e) => e).toList();
      //¡¡return jsonReponse.map((e) => EstudianteHp.fromJson(e)).toList();

      return estudiantes;
    } else {
      print(response.statusCode);
    }
  }

  Future<EstudianteHp> detalleEstudiante(String nombreEstu) async {
    var response = await http.get(baseUrl);
    print(response);

    if (response.statusCode == 200) {
      EstudianteHp estu;
      var jsonReponse = convert.jsonDecode(response.body);

      List estudiantes = jsonReponse.map((e) => e).toList();
      // List<EstudianteHp> estudiantes = new List<EstudianteHp>.from(jsonReponse);

      //List<String> listaPuntosList = (listaPuntos as List).map((item) => item.toString()).toList();

      for (int i = 0; i < estudiantes.length; i++) {
        if (estudiantes[i]["name"] == nombreEstu) {
          print(estudiantes[i]);
          
            EstudianteHp stuRe= new EstudianteHp.fromJson(estudiantes[i]);
            return stuRe;
        }
      }
      
      
    } else {
      print(response.statusCode);
    }
  }
}
