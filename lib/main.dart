import 'package:casashp/route/lista_casas.dart';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Casas Potter',
      home: Scaffold(
          appBar: AppBar(
            title: Text('Harry Potter'),
          ),
          body: CasasListPage()),
    );
  }
}


