import 'package:findprogrammer/login.dart';
import 'package:findprogrammer/profileClient.dart';
import 'package:findprogrammer/viewDevelopmentProjectsClient.dart';
import 'package:findprogrammer/viewProjectProgrammerPanel.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'homeClient.dart';
import 'componentes/helperSQFLITE.dart';
import 'homeProgrammer.dart';
import 'package:flutter/cupertino.dart';
import 'customIcons.dart';
import 'package:groovin_material_icons/groovin_material_icons.dart';

const IconData menu = IconData(0xe900, fontFamily: "CustomIcons");

List<Map<String, dynamic>> desarrolladorList = List();

var contextoS;
Helper helper = new Helper();
var projects;

class ViewFinishProjectsClient extends StatefulWidget {
  @override
  _ViewFinishProjectsClient createState() => new _ViewFinishProjectsClient();
}

class _ViewFinishProjectsClient extends State<ViewFinishProjectsClient> {
  @override
  void initState() {
    // TODO: implement initState
  }

  @override
  Widget build(BuildContext context) {
    var _scaffoldKeyhome = new GlobalKey<ScaffoldState>();
    var _keydos = new GlobalKey();

    return RefreshIndicator(
      color: Colors.deepPurpleAccent,
      onRefresh: () async {
        await Future.delayed(Duration(milliseconds: 500));
        setState(() {});
      },
      child: WillPopScope(
          onWillPop: () {
            //esto es provicional para pruebas
            helper.DeleteDesarrollador();
            Navigator.pop(context);
          },
          child: Scaffold(
            key: _scaffoldKeyhome,
            drawer:Container(
            width: 260.0,
            decoration: BoxDecoration(
              color: Color(0xFF272D34),
            ),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 30,
                ),

                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProfileClient()));
                  },
                  child: Row(
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
                                        image:NetworkImage("http://findprogrammerceti.000webhostapp.com/images/image_"+client['ID_USUARIO'].toString()+".jpg")
                                      )),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: client == null
                                    ? Text(
                                        "Cargando",
                                        style: TextStyle(
                                            fontSize: 15.0,
                                            color: Colors.white),
                                      )
                                    : Container(
                                        width: 150,
                                        child: Text(
                                          client['NOMBRE'].toString() +
                                              " " +
                                              client['APELLIDO_P'].toString() +
                                              " " +
                                              client['APELLIDO_M'].toString(),
                                          style: TextStyle(
                                              fontSize: 15.0,
                                              color: Colors.white),
                                        ),
                                      ),
                              )
                            ],
                          )),
                    ],
                  ),
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
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  
                  },
                  child: Container(
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
                                      GroovinMaterialIcons.check_all,
                                      size: 35,
                                      color: Colors.deepPurpleAccent,
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
                ),
//nuevo wighet
                SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ViewDevelopmentProjectsClient()));
                  },
                  child: Container(
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
                ),
//nuevo wighet
                SizedBox(
                  height: 15,
                ),
GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Homeclient()));
                },
                child: Container(
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
              ),
//nuevo wighet
                SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) => new CupertinoAlertDialog(
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
                                  Text("Cerrar Sesion",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 20)),
                                ],
                              ),
                              content:
                                  Text("¿Seguro que quieres cerrar sesion?"),
                              actions: <Widget>[
                                FlatButton(
                                  onPressed: () {
                                      helper.DeleteCliente();
                                    Navigator.pop(context);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Login()));
                                  },
                                  child: Text("Cerrar Sesion",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 15)),
                                ),
                                FlatButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text("Cancelar",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 15)),
                                ),
                              ],
                            ));
                  },
                  child: Container(
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
                                      GroovinMaterialIcons.exit_to_app,
                                      size: 35,
                                      color: Colors.grey,
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
                )
              ],
            ),
          ),
            appBar: null,
            resizeToAvoidBottomPadding: false,
            backgroundColor: Colors.white,
            body: FutureBuilder(
              key: _keydos,
              future: getFinishProjects(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  print("spuestamente la conexion se cerro clave");
                  print(
                      "esta es la respuesta del servidor-----------------------------------");
                  print(projects);

                  return new Container(
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      image: DecorationImage(
                        colorFilter: new ColorFilter.mode(
                            Colors.black.withOpacity(0.3), BlendMode.dstATop),
                        image: AssetImage('assets/images/mountains.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    padding: EdgeInsets.fromLTRB(5.0, 0, 5.0, 0),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: kToolbarHeight,
                        ),
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    IconButton(
                                      onPressed: () {
                                        _scaffoldKeyhome.currentState
                                            .openDrawer();
                                      },
                                      icon: Icon(
                                        CustomIcons.menu,
                                        color: Colors.white,
                                        size: 42,
                                      ),
                                    ),
                                    Text(
                                      "   Realizados",
                                      style: TextStyle(
                                          fontSize: 30.0, color: Colors.white),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(70, 0, 0, 0),
                                  child: Container(
                                    width: 450.0,
                                    height: 1.5,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            )),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: projects == null ? 0 : projects.length,
                            itemBuilder: (BuildContext context, int position) {
                              return GestureDetector(
                                onTap: () {
                                 
                                },
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  elevation: 10,
                                  color: Color.fromARGB(450, 41, 39, 42),
                                  child: Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.face,
                                        size: 100,
                                        color: Colors.white,
                                      ),
                                      Column(
                                        children: <Widget>[
                                          SizedBox(
                                            height: 25,
                                          ),
                                          Container(
                                            width: ((MediaQuery.of(context)
                                                            .size
                                                            .width /
                                                        4) *
                                                    2) +
                                                20,
                                            child: Text(
                                                projects[position]['TITULO']
                                                    .toString(),
                                                style: TextStyle(
                                                    fontSize: 30.0,
                                                    color: Colors.white)),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Container(
                                            width: ((MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    4) *
                                                2),
                                            child: Text(
                                                projects[position]
                                                        ['FECHA_DE_PUBLICACION']
                                                    .toString(),
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
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  );
                } else {
                  print("spuestamente la conexion no ha terminado clave ");

                  return Stack(
                    children: <Widget>[
                      Container(
                        height: MediaQuery.of(context).size.height,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          image: DecorationImage(
                            colorFilter: new ColorFilter.mode(
                                Colors.black.withOpacity(0.3),
                                BlendMode.dstATop),
                            image: AssetImage('assets/images/mountains.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        padding: EdgeInsets.fromLTRB(5.0, 0, 5.0, 0),
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: kToolbarHeight,
                            ),
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        IconButton(
                                          onPressed: () {
                                            _scaffoldKeyhome.currentState
                                                .openDrawer();
                                          },
                                          icon: Icon(
                                            CustomIcons.menu,
                                            color: Colors.white,
                                            size: 42,
                                          ),
                                        ),
                                        Text(
                                          "   Realizados",
                                          style: TextStyle(
                                              fontSize: 30.0,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(70, 0, 0, 0),
                                      child: Container(
                                        width: 450.0,
                                        height: 1.5,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                )),
                            Expanded(
                              child: ListView.builder(
                                itemCount: 5,
                                itemBuilder:
                                    (BuildContext context, int position) {
                                  return GestureDetector(
                                    onTap: () {},
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      elevation: 10,
                                      color: Color.fromARGB(450, 41, 39, 42),
                                      child: Row(
                                        children: <Widget>[
                                          Icon(
                                            Icons.face,
                                            size: 100,
                                            color: Colors.white,
                                          ),
                                          Column(
                                            children: <Widget>[
                                              SizedBox(
                                                height: 25,
                                              ),
                                              Container(
                                                width: ((MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            4) *
                                                        2) +
                                                    20,
                                                child: Text("___________",
                                                    style: TextStyle(
                                                        fontSize: 30.0,
                                                        color: Colors.white)),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Container(
                                                width: ((MediaQuery.of(context)
                                                            .size
                                                            .width /
                                                        4) *
                                                    2),
                                                child: Text("________",
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
                                    ),
                                  );
                                },
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                      Center(
                        child: SizedBox(
                          width: 250,
                          height: 250,
                          child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              elevation: 100,
                              color: Color.fromARGB(1000, 75, 74, 75),
                              child: Column(
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(20),
                                    child: SizedBox(
                                      height: 120,
                                      width: 120,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 10,
                                        valueColor: new AlwaysStoppedAnimation(
                                            Colors.white),
                                      ),
                                    ),
                                  ),
                                  Text("Cargando",
                                      style: TextStyle(
                                          fontSize: 30.0, color: Colors.white))
                                ],
                              )),
                        ),
                      )
                    ],
                  );
                }
              },
            ),
          )),
    );
  }

  Future getFinishProjects() async {
    try {
      print("-------------------------------------");

      final response = await http.post(
          //"http://192.168.84.114/findProgrammerDB/loadDevelopmentProjects.php",

           "https://findprogrammerceti.000webhostapp.com/loadFinishProjects.php",
          body: {
            "ID": client['ID_USUARIO'].toString(),
          });

      var datauser = json.decode(response.body);
      print(datauser);
      projects = datauser;
      print(
          "se obtuvo los proyectos en desarrollo********************************");
      print(projects);
    } catch (d) {
      print("hubo un error obteniendo los proyectos en desarrollo");
      print(d.toString());
    }
  }
}
