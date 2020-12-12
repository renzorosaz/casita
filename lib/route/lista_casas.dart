import 'package:casashp/route/list_estudiantesxCasa.dart';
import 'package:casashp/utils/httphelper.dart';
import 'package:flutter/material.dart';

class CasasListPage extends StatefulWidget {
  @override
  _CasasListPageState createState() => _CasasListPageState();
}

class _CasasListPageState extends State<CasasListPage> {
  HttpHelper helper;
  @override
  void initState() {
    helper = HttpHelper();
    super.initState();
  }

  List casasImg = [
    "https://images-na.ssl-images-amazon.com/images/I/915wv-U37QL._AC_SY679_.jpg",
    "https://www.tienda-medieval.com/30619-large_default/bandera-de-pared-de-la-casa-slytherin-harry-potter.jpg",
    "https://images-na.ssl-images-amazon.com/images/I/91m0fktyyCL._AC_SY679_.jpg",
    "https://images-na.ssl-images-amazon.com/images/I/71IgpxIE-cL._AC_SX522_.jpg"
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: FutureBuilder(
          future: helper.getCasas(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List casas = snapshot.data;
              return ListView.builder(

                  itemCount: casas.length,
                  itemBuilder: (c, i) => GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (c) =>
                                      ListEstudiantesPage(casas[i])));
                        },
                        child: ListTile(
                             
                            title: Text(casas[i]),
                            leading: Image.network(casasImg[i],fit:BoxFit.fill),
                          ),
                        // child: Container(
                        //   decoration: BoxDecoration(
                        //       image: DecorationImage(
                        //           image: NetworkImage(casasImg[i]))),
                        //   child: Text(casas[i]),
                        // ),
                      ));
            } else if (snapshot.hasError) {
              return Text("Error");
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ))
      ],
    );
  }
}
