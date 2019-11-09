import 'package:findprogrammer/profileClient.dart';
import 'package:findprogrammer/viewDevelopmentProjectsClient.dart';
import 'package:findprogrammer/viewFinishProjectsClient.dart';
import 'componentes/helperSQFLITE.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'componentes/variables.dart';
import 'customIcons.dart';
import 'package:findprogrammer/homeClient.dart';
import 'homeProgrammer.dart';
import 'login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:groovin_material_icons/groovin_material_icons.dart';

const IconData menu = IconData(0xe900, fontFamily: "CustomIcons");
Helper helper = new Helper();
var contextoS;

class ViewProfileProgrammer extends StatefulWidget {
  var ID;
  var IDProject;
  ViewProfileProgrammer(this.ID, this.IDProject);
  @override
  _ViewProfileProgrammer createState() =>
      new _ViewProfileProgrammer(this.ID, this.IDProject);
}

class _ViewProfileProgrammer extends State<ViewProfileProgrammer> {
  var comments;
  var ID;
  var IDProject;
  var developer;
  var contextoS;
  _ViewProfileProgrammer(this.ID, this.IDProject);

  @override
  Widget build(BuildContext context) {
    double mediaw = MediaQuery.of(context).size.width;
    double mediah = MediaQuery.of(context).size.height;
    var _scaffoldKey2 = new GlobalKey<ScaffoldState>();
    contextoS=context;
    return Scaffold(
      key: _scaffoldKey2,
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

            InkWell(
              onTap: () {
                Navigator.pop(context);

                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfileClient()));
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
                                      image: NetworkImage(
                                          server+"/images/image_" +
                                              client['ID_USUARIO'].toString() +
                                              ".jpg"))),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: client == null
                                ? Text(
                                    "Cargando",
                                    style: TextStyle(
                                        fontSize: 15.0, color: Colors.white),
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
                                          fontSize: 15.0, color: Colors.white),
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
            InkWell(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ViewFinishProjectsClient()));
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
            ),
            //nuevo wighet
            SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ViewDevelopmentProjectsClient()));
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

            InkWell(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    CupertinoPageRoute(builder: (contex) => Homeclient()));
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
            InkWell(
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
                          content: Text("¿Seguro que quieres cerrar sesion?"),
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
      body: WillPopScope(
        onWillPop: () {
          Navigator.pop(context);
        },
        child: FutureBuilder(
          future: getDeveloper(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              print("se ceero la conexion del get developer");
              print(developer);
              return Container(
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
                                      _scaffoldKey2.currentState.openDrawer();
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
                                  image: NetworkImage(
                                      server+"/images/image_" +
                                          developer[0]['ID_USUARIO']
                                              .toString() +
                                          ".jpg"),
                                )),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            developer[0]['NOMBRE'].toString() +
                                " " +
                                developer[0]['APELLIDO_P'].toString() +
                                " " +
                                developer[0]['APELLIDO_M'].toString(),
                            style: TextStyle(
                                fontSize: mediah * .04, color: Colors.white),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Programador",
                            style:
                                TextStyle(fontSize: 18.0, color: Colors.white),
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
                                      developer[0]['CALIFICACION'].toString() +
                                          "",
                                      style: TextStyle(
                                          fontSize: 12.0, color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) =>
                                          new CupertinoAlertDialog(
                                            title: Column(
                                              children: <Widget>[
                                                Icon(
                                                  Icons.devices_other,
                                                  size: 80,
                                                  color:
                                                      Colors.deepPurpleAccent,
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Text("FindProgrammer",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 20)),
                                              ],
                                            ),
                                            content: Text(
                                                "¿Seguro que quieres contratar a este desarrollador?"),
                                            actions: <Widget>[
                                              FlatButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Text("Cancelar",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 15)),
                                              ),
                                              FlatButton(
                                                onPressed: () async {
                                                  var d = await createPanel();
                                                  if (d == "1") {
                                                         Navigator.pop(context);
                                                    showDialog(
                                                        context: contextoS,
                                                        builder: (context) =>
                                                            new CupertinoAlertDialog(
                                                              title: Column(
                                                                children: <
                                                                    Widget>[
                                                                  Icon(
                                                                    Icons
                                                                        .devices_other,
                                                                    size: 80,
                                                                    color: Colors
                                                                        .deepPurpleAccent,
                                                                  ),
                                                                  SizedBox(
                                                                    height: 20,
                                                                  ),
                                                                  Text(
                                                                      "FindProgrammer",
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .black,
                                                                          fontSize:
                                                                              20)),
                                                                ],
                                                              ),
                                                              content: Text(
                                                                  "El proyecto ha comenzado, ahora puedes comunicarte con tu desarrollador"),
                                                              actions: <Widget>[
                                                                FlatButton(
                                                                  onPressed:
                                                                      () {
                                                                    Navigator.pop(
                                                                        context);
                                                                    //rederigir al panel
                                                                  },
                                                                  child: Text(
                                                                      "Aceptar",
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .black,
                                                                          fontSize:
                                                                              15)),
                                                                ),
                                                              ],
                                                            ));
                                                  } else if (d == "2") {
                                                    Navigator.pop(context);
                                                    showDialog(
                                                        context: contextoS,
                                                        builder: (context) =>
                                                            new CupertinoAlertDialog(
                                                              title: Column(
                                                                children: <
                                                                    Widget>[
                                                                  Icon(
                                                                    Icons
                                                                        .devices_other,
                                                                    size: 80,
                                                                    color: Colors
                                                                        .deepPurpleAccent,
                                                                  ),
                                                                  SizedBox(
                                                                    height: 20,
                                                                  ),
                                                                  Text(
                                                                      "FindProgrammer",
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .black,
                                                                          fontSize:
                                                                              20)),
                                                                ],
                                                              ),
                                                              content: Text(
                                                                  "El proyecto ya esta siendo desarrollado"),
                                                              actions: <Widget>[
                                                                FlatButton(
                                                                  onPressed:
                                                                      () {
                                                                    Navigator.pop(
                                                                        context);
                                                                  },
                                                                  child: Text(
                                                                      "Aceptar",
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .black,
                                                                          fontSize:
                                                                              15)),
                                                                ),
                                                              ],
                                                            ));
                                                  }
//codigo para contratar
                                                },
                                                child: Text("Aceptar",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 15)),
                                              ),
                                            ],
                                          ));
                                },
                                child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Column(
                                    children: <Widget>[
                                      Icon(
                                        GroovinMaterialIcons.wallet_travel,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                      Text(
                                        "Contratar",
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.white),
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
                    Expanded(
                        child: FutureBuilder(
                      future: getComments(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          print(
                              "la conexion se cerro la conexion de los comentario ");
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
                                            comments[position]['nombre']
                                                    .toString() +
                                                " " +
                                                comments[position]['apellido_P']
                                                    .toString() +
                                                " " +
                                                comments[position]['apellido_M']
                                                    .toString(),
                                            textAlign: TextAlign.justify,
                                            style: TextStyle(
                                                fontSize: 20.0,
                                                color: Colors.white)),
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
              );
            } else {
              print("no se ha cerrado la conexion");
              return Stack(
                children: <Widget>[
                  Container(
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
                                          _scaffoldKey2.currentState
                                              .openDrawer();
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
                                        image: AssetImage(
                                            'assets/images/mountains.jpg'))),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Nombre porgramador",
                                style: TextStyle(
                                    fontSize: mediah * .04,
                                    color: Colors.white),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Programador",
                                style: TextStyle(
                                    fontSize: 18.0, color: Colors.white),
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
                                              fontSize: 14.0,
                                              color: Colors.white),
                                        ),
                                        Text(
                                          "10",
                                          style: TextStyle(
                                              fontSize: 12.0,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Column(
                                        children: <Widget>[
                                          Icon(
                                            GroovinMaterialIcons.wallet_travel,
                                            color: Colors.white,
                                            size: 30,
                                          ),
                                          Text(
                                            "Contratar",
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                color: Colors.white),
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
      ),
    );
  }

  Future getComments() async {
    //print("se esta obteiendo los comentarios");
    // print(desarrollador['ID_USUARIO']);
    try {
      final response = await http.post(
          server+"/loadComments.php",
          //"http://192.168.0.5/findprogrammerDB/loadComments.php",
          body: {"ID_USUARIO": developer[0]['ID_USUARIO'].toString()}).timeout(Duration(seconds: 7));

      var comments = json.decode(response.body);
      this.comments = comments;
      //   print("se obtuvieron los comentarios");
    } catch (f) {
      // print("hubo un error obteniendo los comentarios");
      //print(f.toString());
    }
  }

  Future getDeveloper() async {
    //print("el id es: ");
    //print(this.ID.toString());
    try {
      final response = await http.post(
          server+"/loadDeveloper.php",
          //"http://192.168.0.5/findprogrammerDB/loadDeveloper.php",
          body: {"ID_USUARIO": this.ID.toString()}).timeout(Duration(seconds: 7));

      var developer = json.decode(response.body);
      this.developer = developer;

      // print("se obtuvieron la info del desarrollador");
      //print("wwwwwwwwwwwwwwwwwwwwwwwwwww");
      //print(this.developer);
    } catch (f) {
      //print("hubo un error obteniendo la info del desarollador");
      //print(f.toString());
    }
  }

  Future<String> createPanel() async {
    print("el id es: ");
    print(this.ID.toString());
    try {
      final response = await http.post(
          server+"/createPanel.php",
          //"http://192.168.0.5/findprogrammerDB/createPanel.php",
          body: {
            "ID_USUARIO": this.ID.toString(),
            "ID_PROYECTO": this.IDProject.toString(),
          }).timeout(Duration(seconds: 7));
      print("respuesta del server:");
      print(response.body);
      if (response.body == "1") {
        print("si se registrooooooooooooooooooo");
      } else if (response.body == "2") {
        print("este proyecto ya tiene desarrolador");
      }

      return response.body;
    } catch (f) {
      print(f.toString());
    }
  }

  Future funciones() async {
    await getDeveloper();
    await getComments();
  }
}
