import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'customIcons.dart';
import 'dart:convert';
import 'package:groovin_material_icons/groovin_material_icons.dart';

const IconData menu = IconData(0xe900, fontFamily: "CustomIcons");
var _scaffoldKey = new GlobalKey<ScaffoldState>();
var contextoS;
TextEditingController reqOb=new TextEditingController();
var requerimietos;

class ViewReqFormal extends StatefulWidget {
  var ID;

  ViewReqFormal(this.ID);
  @override
  _ViewReqFormal createState() => new _ViewReqFormal(ID);
}

class _ViewReqFormal extends State<ViewReqFormal> {
  var ID;
  _ViewReqFormal(this.ID);
  @override
  void initState() {
    getReq();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("el id para req es");
    print(ID);

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
                height: (MediaQuery.of(context).size.height / 2),
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
                      child: Text("Requerimientos \n                  Formales",
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
                                          Text("Aceptar Requerimientos",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20)),
                                        ],
                                      ),
                                      content: Text(
                                          "¿Seguro que quieres aceptar los requermientos? El proramador se apegará a ellos para desarrollar el proyecto, por lo cual solo estará obligado a cumplir lo acordado en estos mismos."),
                                      actions: <Widget>[
                                        FlatButton(
                                          onPressed: () async {
                                            await acceptReq();
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
                                  "        Aceptar \n Requerimientos",
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
                                            await noAcceptReq();
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
                                                            placeholder: "Que quieres cambiar...",
                                                            maxLines: null,
                                                            placeholderStyle:
                                                          
                                                                TextStyle(
                                                                    color: Colors
                                                                        .black38),
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
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
                  child: requerimietos != null
                      ? ListView.builder(
                          itemCount:
                              requerimietos == null ? 0 : requerimietos.length,
                          itemBuilder: (BuildContext context, int position) {
                            return Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              elevation: 10,
                              color: Color.fromARGB(450, 41, 39, 42),
                              child: Row(
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(20),
                                    child: Icon(
                                      Icons.star_half,
                                      size: 50,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Column(
                                    children: <Widget>[
                                      SizedBox(
                                        height: 25,
                                      ),
                                      Container(
                                        width: 220,
                                        child: Text(
                                            requerimietos[position]
                                                    ['REQUERIMIENTO']
                                                .toString(),
                                            textAlign: TextAlign.justify,
                                            style: TextStyle(
                                              fontSize: 20.0,
                                              color: Colors.white,
                                            )),
                                      ),
                                      SizedBox(
                                        height: 25,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        )
                      : CircularProgressIndicator(
                          strokeWidth: 10,
                        ))
            ],
          ),
        ));
  }

  Future getReq() async {
    var cliente1 = new http.Client();
    print(
        "=========================================================================");
    print("se esta obteiendo los reqermientos");

    try {
      final response = await cliente1
          .post("https://findprogrammerceti.000webhostapp.com/loadReq.php",
              // "http://192.168.0.5/findprogrammerDB/loadReq.php",
              body: {"ID": ID.toString()}).timeout(Duration(seconds: 7));

      var s = json.decode(response.body);
      requerimietos = s;
      print("se obtuvieron los requerimientos");
    } catch (f) {
      print("hubo un error obteniendo los requerimeintos");
      print(f.toString());
    } finally {
      cliente1.close();
      setState(() {});
    }
  }

  Future acceptReq() async {
    var cliente1 = new http.Client();
    print(
        "=========================================================================");
    print("se manda aceptar los requerimientos");

    try {
      final response = await cliente1
          .post("https://findprogrammerceti.000webhostapp.com/acceptReq.php",
              // "http://192.168.0.5/findprogrammerDB/acceptReq.php",
              body: {"ID": ID.toString()}).timeout(Duration(seconds: 7));

      var s = json.decode(response.body);
      print(s);
      if (s == 1) {
        print("se acceptaron los req");
        Navigator.pop(context);
      } else {
        print("no se aceptaron los req");
      }
    } catch (f) {
      print("hubo un error obteniendo los requerimeintos");
      print(f.toString());
    } finally {
      cliente1.close();
      setState(() {});
    }
  }

  Future noAcceptReq() async {
    var cliente1 = new http.Client();
    print(
        "=========================================================================");
    print("se manda corregir los requerimientos");

    try {
      final response = await cliente1
          .post("https://findprogrammerceti.000webhostapp.com/correReq.php",
              // "http://192.168.0.5/findprogrammerDB/acceptReq.php",
              body: {"ID": ID.toString(),
              "obs":reqOb.text
              }).timeout(Duration(seconds: 7));

      var s = json.decode(response.body);
      print(s);
      if (s == 1) {
        print("se mndarona corrgir los req");
        Navigator.pop(context);
        Navigator.pop(context);
      } else {
        print("no se mandaron a corrgir los req");
      }
    } catch (f) {
      print("hubo un error corrigiendo los requerimeintos");
      print(f.toString());
    } finally {
      cliente1.close();
      setState(() {});
    }
  }
}
