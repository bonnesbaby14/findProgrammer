import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'componentes/variables.dart';
import 'customIcons.dart';
import 'dart:convert';
import 'package:groovin_material_icons/groovin_material_icons.dart';

const IconData menu = IconData(0xe900, fontFamily: "CustomIcons");
var _scaffoldKey = new GlobalKey<ScaffoldState>();
var contextoS;
TextEditingController reqOb = new TextEditingController();
var requerimietos;

class ViewAdvance extends StatefulWidget {
  var ID;

  ViewAdvance(this.ID);
  @override
  _ViewAdvance createState() => new _ViewAdvance(ID);
}

class _ViewAdvance extends State<ViewAdvance> {
  var ID;
  var listAvances;
  var avances;
  _ViewAdvance(this.ID);
  @override
  void initState() {
    getLastAvance();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("el id para req es");
    print(ID);

    listAvances = new List<Widget>();
    if (avances != null) {
      for (int z = 0; z < avances.length; z++) {
        listAvances.add(Padding(
          padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
          child: Text("\n Nuevo avance!!!!",
              style: TextStyle(fontSize: 24.0, color: Colors.white)),
        ));
        listAvances.add(Padding(
          padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
          child: Text("________________________________________",
              style: TextStyle(fontSize: 19.0, color: Colors.white)),
        ));
        listAvances.add(Padding(
          padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
          child: Text("Tiempo trabajado: " + avances[z]["TIEMPO_TRABAJO"],
              style: TextStyle(fontSize: 19.0, color: Colors.white)),
        ));

        listAvances.add(Padding(
          padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
          child: Text("Fecha de entrega: " + avances[z]["FECHA_ENTREGA"],
              style: TextStyle(fontSize: 19.0, color: Colors.white)),
        ));
        listAvances.add(Padding(
          padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
          child: Text("Decripcion: " + avances[z]["DESCRIPCION"],
              style: TextStyle(fontSize: 19.0, color: Colors.white)),
        ));
        listAvances.add(Padding(
          padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
          child: Text("Porcentaje del proyecto: " + avances[z]["PORCENTAJE"],
              style: TextStyle(fontSize: 19.0, color: Colors.white)),
        ));

        listAvances.add(Padding(
          padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
          child: Text("Observaciones: " + avances[z]["OBSERVACIONES"],
              style: TextStyle(fontSize: 19.0, color: Colors.white)),
        ));

        listAvances.add(Padding(
          padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
          child: InkWell(
            onTap: () {},
            child: Text("Enlaces: " + avances[z]["ENLACES"],
                style: TextStyle(fontSize: 19.0, color: Colors.white)),
          ),
        ));
        listAvances.add(Padding(
          padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
          child: Text("No. de cambios: " + avances[z]["No_CAMBIOS"],
              style: TextStyle(fontSize: 19.0, color: Colors.white)),
        ));
      }
    }

    return Scaffold(
        key: _scaffoldKey,
        drawer: Container(
          width: 260.0,
          decoration: BoxDecoration(
            color: Color(0xFF272D34),
          ),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 30,
              ),

              Row(
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(15),
                            child: Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage(
                                        'assets/images/mountains.jpeg'),
                                  )),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              "Gabriel Rodriguez",
                              style: TextStyle(
                                  fontSize: 18.0, color: Colors.white),
                            ),
                          )
                        ],
                      )),
                ],
              ),
//linea de separacin
              Padding(
                padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                child: Container(
                  width: 450.0,
                  height: 0.5,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15.0))),
                child: Row(
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.all(1),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.fromLTRB(5, 4, 15, 4),
                              child: Container(
                                child: Icon(
                                  GroovinMaterialIcons.check_all,
                                  size: 35,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Text(
                                "Proyectos Terminados",
                                style: TextStyle(
                                    fontSize: 17.0, color: Colors.white),
                              ),
                            ),
                          ],
                        )),
                  ],
                ),
              ),
//nuevo wighet
              SizedBox(
                height: 15,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15.0))),
                child: Row(
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.all(1),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.fromLTRB(5, 4, 15, 4),
                              child: Container(
                                child: Icon(
                                  GroovinMaterialIcons.worker,
                                  size: 35,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(9),
                              child: Text(
                                "Proyectos en Desarrollo",
                                style: TextStyle(
                                    fontSize: 17.0, color: Colors.white),
                              ),
                            )
                          ],
                        )),
                  ],
                ),
              ),

//nuevo wighet
              SizedBox(
                height: 15,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15.0))),
                child: Row(
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.all(1),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.fromLTRB(5, 4, 15, 4),
                              child: Container(
                                child: Icon(
                                  GroovinMaterialIcons.new_box,
                                  size: 35,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(9),
                              child: Text(
                                "Proyectos Publicados",
                                style: TextStyle(
                                    fontSize: 17.0, color: Colors.white),
                              ),
                            )
                          ],
                        )),
                  ],
                ),
              ),

//nuevo wighet
              SizedBox(
                height: 15,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.transparent.withOpacity(0.3),
                    borderRadius: BorderRadius.all(Radius.circular(15.0))),
                child: Row(
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.all(1),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.fromLTRB(5, 4, 15, 4),
                              child: Container(
                                child: Icon(
                                  GroovinMaterialIcons.exit_to_app,
                                  size: 35,
                                  color: Colors.deepPurpleAccent,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(9),
                              child: Text(
                                "Cerrar Sesion",
                                style: TextStyle(
                                    fontSize: 17.0, color: Colors.white),
                              ),
                            )
                          ],
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
        appBar: null,
        resizeToAvoidBottomPadding: false,
        body: new Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: Colors.deepPurpleAccent,
            image: DecorationImage(
              colorFilter: new ColorFilter.mode(
                  Colors.black.withOpacity(0.25), BlendMode.dstATop),
              image: AssetImage('assets/images/mountains.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          padding: EdgeInsets.fromLTRB(2.0, 0, 2.0, 0),
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: (MediaQuery.of(context).size.height / 2)-90,
                decoration: BoxDecoration(
                    color: Colors.deepPurpleAccent,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30))),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: IconButton(
                              onPressed: () {
                                _scaffoldKey.currentState.openDrawer();
                              },
                              icon: Icon(
                                CustomIcons.menu,
                                color: Colors.white,
                                size: 42,
                              )),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text("Nuevo Avance",
                          textAlign: TextAlign.justify,
                          style:
                              TextStyle(fontSize: 30.0, color: Colors.white)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) => CupertinoAlertDialog(
                                      title: Column(
                                        children: <Widget>[
                                          Icon(
                                            Icons.devices_other,
                                            size: 80,
                                            color: Colors.deepPurpleAccent,
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Text("Aceptar Avance",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20)),
                                        ],
                                      ),
                                      content: Text(
                                          "¿Seguro que quieres aceptar el avance?"),
                                      actions: <Widget>[
                                        FlatButton(
                                          onPressed: () async {
                                            await acceptAdvance(avances[0]["ID_AVANCES"]);
                                          },
                                          child: Text("Aceptar",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15)),
                                        ),
                                        FlatButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text("Cancelar",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15)),
                                        ),
                                      ],
                                    ));
                          },
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                            child: Column(
                              children: <Widget>[
                                Icon(
                                  GroovinMaterialIcons.check_circle,
                                  color: Colors.white,
                                  size: 30,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Aceptar \n Avance",
                                  style: TextStyle(
                                      fontSize: 14.0, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) => CupertinoAlertDialog(
                                      actions: <Widget>[
                                        FlatButton(
                                          onPressed: () async {
                                             await noAcceptAdvance(avances[0]["ID_AVANCES"]);
                                          },
                                          child: Text("Enviar",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15)),
                                        ),
                                        FlatButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text("Cancelar",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15)),
                                        ),
                                      ],
                                      title: Column(
                                        children: <Widget>[
                                          Icon(
                                            Icons.devices_other,
                                            size: 80,
                                            color: Colors.deepPurpleAccent,
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Text("Solicitar corrección",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20)),
                                        ],
                                      ),
                                      content: Column(
                                        children: <Widget>[
                                          Text(
                                              "¿Seguro que quieres enviar la corrección al programador?"),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          CupertinoTextField(
                                            controller: reqOb,
                                            placeholder:
                                                "Que quieres cambiar...",
                                            maxLines: null,
                                            placeholderStyle: TextStyle(
                                                color: Colors.black38),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    width: 0.5,
                                                    color: Colors
                                                        .deepPurpleAccent)),
                                          ),
                                        ],
                                      ),
                                    ));
                          },
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              children: <Widget>[
                                Icon(
                                  GroovinMaterialIcons.edit_outline,
                                  color: Colors.white,
                                  size: 30,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "  Solicitar\nCorreción",
                                  style: TextStyle(
                                      fontSize: 14.0, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Expanded(
                  child: listAvances != null
                      ? Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          elevation: 10,
                          color: Color.fromARGB(450, 41, 39, 42),
                          child: Column(
                            children: listAvances,
                          ),
                        )
                      : CircularProgressIndicator(
                          strokeWidth: 10,
                        ))
            ],
          ),
        ));
  }

  Future getLastAvance() async {
    var cliente1 = new http.Client();
    print(
        "=========================================================================");
    print("se esta obteiendo los el ultimo avance");

    try {
      final response = await cliente1.post(
          server+"/loadLastAdvance.php",
          // "http://192.168.0.5/findprogrammerDB/loadReq.php",
          body: {"ID": ID.toString()}).timeout(Duration(seconds: 7));

      var s = json.decode(response.body);
      this.avances = s;
      print(avances);
      print("se obtuvieron los el avance");
    } catch (f) {
      print("hubo un error obteniendo los el avance");
      print(f.toString());
    } finally {
      cliente1.close();
      setState(() {});
    }
  }

Future acceptAdvance(id) async {
    var cliente1 = new http.Client();
    print(
        "=========================================================================");
    print("se manda aceptar los advance");

    try {
      final response = await cliente1
          .post(server+"/acceptAdvance.php",
              // "http://192.168.0.5/findprogrammerDB/acceptReq.php",
              body: {"ID": id.toString()}).timeout(Duration(seconds: 7));

      var s = json.decode(response.body);
      print(s);
      if (s == 1) {
        print("se acceptaron los advance");
        Navigator.pop(context);
      } else {
        print("no se aceptaron los advance");
      }
    } catch (f) {
      print("hubo un error aceptado  los avance");
      print(f.toString());
    } finally {
      cliente1.close();
     
    }
  }


  Future noAcceptAdvance(id) async {
    var cliente1 = new http.Client();
    print(
        "=========================================================================");
    print("se manda aceptar los advance");
    print(ID.toString());

    try {
      final response = await cliente1
          .post(server+"/noAcceptAdvance.php",
              // "http://192.168.0.5/findprogrammerDB/acceptReq.php",
              body: {"ID": id.toString(),"obs":reqOb.text,"id":ID.toString()}).timeout(Duration(seconds: 7));

      var s = json.decode(response.body);
      print(s);
      if (s == 1) {
        print("se no acceptaron los advance");
        Navigator.pop(context);
      } else {
        print("no no se aceptaron los advance");
      }
    } catch (f) {
      print("hubo un error no aceptado  los avance");
      print(f.toString());
    } finally {
      cliente1.close();
     
    }
  }

}


