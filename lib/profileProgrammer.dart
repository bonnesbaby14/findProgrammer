import 'viewAvailableProjects.dart';
import 'package:findprogrammer/viewFinishProjectsProgrammer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'customIcons.dart';
import 'package:findprogrammer/homeClient.dart';
import 'homeProgrammer.dart';
import 'login.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'viewDevelopmentProjectsProgrammer.dart';
import 'package:groovin_material_icons/groovin_material_icons.dart';

const IconData menu = IconData(0xe900, fontFamily: "CustomIcons");

var contextoS;

class ProfileProgrammer extends StatefulWidget {
  @override
  _ProfileProgrammer createState() => new _ProfileProgrammer();
}

class _ProfileProgrammer extends State<ProfileProgrammer> {
  var comments;
  @override
  Widget build(BuildContext context) {
    double mediaw = MediaQuery.of(context).size.width;
    double mediah = MediaQuery.of(context).size.height;
    var _scaffoldKey = new GlobalKey<ScaffoldState>();
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

                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfileProgrammer()));
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
                                          image: AssetImage(
                                              'assets/images/mountains.jpeg'),
                                        )),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(10),
                                  child: desarrollador == null
                                      ? Text(
                                          "Cargando",
                                          style: TextStyle(
                                              fontSize: 15.0,
                                              color: Colors.white),
                                        )
                                      : Container(
                                          width: 150,
                                          child: Text(
                                            desarrollador['NOMBRE'].toString() +
                                                " " +
                                                desarrollador['APELLIDO_P']
                                                    .toString() +
                                                " " +
                                                desarrollador['APELLIDO_M']
                                                    .toString(),
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeProgrammer()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          
                          borderRadius:
                              BorderRadius.all(Radius.circular(15.0))),
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
                                        GroovinMaterialIcons.flash_circle,
                                        size: 35,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Text(
                                      "Tendencias",
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
                  //otro widget

                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ViewFinishProjectsProgrammer()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.all(Radius.circular(15.0))),
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
                                      "Proyectos Realizados",
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
                              builder: (context) => ViewDevelopmentProjectsProgrammer()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.all(Radius.circular(15.0))),
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
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ViewAvailableProjects()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.all(Radius.circular(15.0))),
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
                                      "Proyectos Disponibles",
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
                                    Text("Codigo de Proyecto",
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 20)),
                                  ],
                                ),
                                content: Column(
                                  children: <Widget>[
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Container(
                                      child: CupertinoTextField(
                                        placeholder: "Codigo de proyecto...",
                                        placeholderStyle:
                                            TextStyle(color: Colors.black38),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                                width: 0.5,
                                                color:
                                                    Colors.deepPurpleAccent)),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                  ],
                                ),
                                actions: <Widget>[
                                  FlatButton(
                                    onPressed: () {},
                                    child: Text("Aceptar",
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
                          borderRadius:
                              BorderRadius.all(Radius.circular(15.0))),
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
                                        GroovinMaterialIcons.keyboard,
                                        size: 35,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(9),
                                    child: Text(
                                      "Ingresar Codigo",
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
                          borderRadius:
                              BorderRadius.all(Radius.circular(15.0))),
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
                  ),
                ],
              ),
            ),
        appBar: null,
        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.white,
        body: new Container(
          height: mediah,
          decoration: BoxDecoration(
            color: Colors.deepPurpleAccent,
            image: DecorationImage(
              colorFilter: new ColorFilter.mode(
                  Colors.black.withOpacity(0.5), BlendMode.dstATop),
              image: AssetImage('assets/images/mountains.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          padding: EdgeInsets.fromLTRB(2.0, 0, 2.0, 0),
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: (mediah / 2) + 60,
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
                    Container(
                      width: mediah * .15,
                      height: mediah * .15,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage('assets/images/mountains.jpeg'),
                          )),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      desarrollador['NOMBRE'].toString() +
                          " " +
                          desarrollador['APELLIDO_P'].toString() +
                          " " +
                          desarrollador['APELLIDO_M'].toString(),
                      style: TextStyle(
                          fontSize: mediah * .04, color: Colors.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Programador",
                      style: TextStyle(fontSize: 18.0, color: Colors.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: <Widget>[
                              Icon(
                                Icons.star_half,
                                color: Colors.white,
                                size: 30,
                              ),
                              Text(
                                "Califiación",
                                style: TextStyle(
                                    fontSize: 14.0, color: Colors.white),
                              ),
                              Text(
                                desarrollador['CALIFICACION'].toString() + "",
                                style: TextStyle(
                                    fontSize: 12.0, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: <Widget>[
                              Icon(
                                GroovinMaterialIcons.edit_outline,
                                color: Colors.white,
                                size: 30,
                              ),
                              Text(
                                "Editar Perfil",
                                style: TextStyle(
                                    fontSize: 14.0, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: FutureBuilder(
                future: getComments(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    print("la conexion se cerro");
                    print(comments);
                    return ListView.builder(
                      itemCount: comments == null ? 0 : comments.length,
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
                                  Text(
                                      comments[position]['nombre'].toString() +
                                          " " +
                                          comments[position]['apellido_P']
                                              .toString() +
                                          " " +
                                          comments[position]['apellido_M']
                                              .toString(),
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                          fontSize: 20.0, color: Colors.white)),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    width: 220,
                                    child: Text(
                                        comments[position]['COMENTARIO']
                                            .toString(),
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                          fontSize: 10.0,
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
                    );
                  } else {
                    print("la conexion no se ha cerrado");

                    return CircularProgressIndicator(
                      strokeWidth: 10,
                    );
                  }
                },
              )),
            ],
          ),
        ));
  }

  Future getComments() async {
    print(
        "=========================================================================");
    print("se esta obteiendo los comentarios");
    print(desarrollador['ID_USUARIO']);
    try {
      final response = await http
          .post("https://findprogrammerceti.000webhostapp.com/loadComments.php",
              // "http://192.168.0.5/findprogrammerDB/loadComments.php",
              body: {"ID_USUARIO": desarrollador['ID_USUARIO'].toString()});

      var comments = json.decode(response.body);
      this.comments = comments;
      print("se obtuvieron los comentarios");
    } catch (f) {
      print("hubo un error obteniendo los comentarios");
      print(f.toString());
    }
  }
}
