import 'dart:convert';
import 'package:findprogrammer/chatClient.dart';
import 'package:findprogrammer/homeProgrammer.dart';
import 'package:findprogrammer/profileClient.dart';
import 'package:findprogrammer/viewAdvance.dart';
import 'package:findprogrammer/viewDevelopmentProjectsClient.dart';
import 'package:findprogrammer/viewFinishProjectsClient.dart';
import 'package:findprogrammer/viewHireProgrammer.dart';
import 'package:findprogrammer/viewReqFormal.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'claseAlertEditProject.dart';
import 'componentes/helperNotifications.dart';
import 'componentes/helperSQFLITE.dart';
import 'componentes/variables.dart';
import 'customIcons.dart';
import 'login.dart';
import 'homeClient.dart';
import 'package:flutter/cupertino.dart';
import 'package:groovin_material_icons/groovin_material_icons.dart';

const IconData menu = IconData(0xe900, fontFamily: "CustomIcons");

var contextoS;
bool _ligths = false;
var listReqF = List<Widget>();

var listAvances = List<Widget>();
double calificacion;
var finish;
var responseA;
var visitas;
var dataProject, reqFuncionales, avances, desarrollador;
TextEditingController comentario = TextEditingController();
TextEditingController reporte = TextEditingController();
TextEditingController razon = TextEditingController();
Helper helper = new Helper();

class ViewProjectClient extends StatefulWidget {
  String ID;
  ViewProjectClient(this.ID);
  @override
  _ViewProjectClient createState() => new _ViewProjectClient(ID);
}

class _ViewProjectClient extends State<ViewProjectClient> {
  String ID;
  final notification = FlutterLocalNotificationsPlugin();

  _ViewProjectClient(this.ID);

  @override
  void initState() {
    if (statusRed) {
      getInfooProject();
      getReqFProject();
      getAvancesProject();
      getDesarrolladorProject();
      getVisits(ID);
    } else {
      getUno();
      getDos();
      getCuatro();
      getCinco();
      getSeis();
    }

    // TODO: implement initState
  }

  @override
  Widget build(BuildContext context) {
    contextoS = context;

    var _scaffoldKey1 = new GlobalKey<ScaffoldState>();
    double mediaw = MediaQuery.of(context).size.width;
    double mediah = MediaQuery.of(context).size.height;

    listReqF = new List<Widget>();
    listAvances = new List<Widget>();
    if (avances != null) {
      for (int z = 0; z < avances.length; z++) {
        listAvances.add(Padding(
          padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
          child: Text("_______________________________",
              style: TextStyle(fontSize: 14.0, color: Colors.white)),
        ));
        listAvances.add(Padding(
          padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
          child: Text(
              "Tiempo trabajado: " + avances[z]["TIEMPO_TRABAJO"].toString(),
              style: TextStyle(fontSize: 14.0, color: Colors.white)),
        ));

        listAvances.add(Padding(
          padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
          child: Text(
              "Fecha de entrega: " + avances[z]["FECHA_ENTREGA"].toString(),
              style: TextStyle(fontSize: 14.0, color: Colors.white)),
        ));
        listAvances.add(Padding(
          padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
          child: Text("Decripcion: " + avances[z]["DESCRIPCION"].toString(),
              style: TextStyle(fontSize: 14.0, color: Colors.white)),
        ));
        listAvances.add(Padding(
          padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
          child: Text(
              "Porcentaje del proyecto: " + avances[z]["PORCENTAJE"].toString(),
              style: TextStyle(fontSize: 14.0, color: Colors.white)),
        ));

        listAvances.add(Padding(
          padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
          child: Text(
              "Observaciones: " + avances[z]["OBSERVACIONES"].toString(),
              style: TextStyle(fontSize: 14.0, color: Colors.white)),
        ));

        listAvances.add(Padding(
          padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
          child: Text("No. de cambios: " + avances[z]["No_CAMBIOS"].toString(),
              style: TextStyle(fontSize: 14.0, color: Colors.white)),
        ));
        listAvances.add(Padding(
          padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
          child: avances[z]["F_ACEPTADO"] == "1"
              ? Text("Aceptado",
                  style: TextStyle(fontSize: 14.0, color: Colors.white))
              : Text("No   aceptado",
                  style: TextStyle(fontSize: 14.0, color: Colors.white)),
        ));
      }
    }

    if (reqFuncionales != null) {
      for (int x = 0; x < reqFuncionales.length; x++) {
        listReqF.add(Padding(
          padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
          child: Text(reqFuncionales[x]["REQUERIMIENTO"],
              style: TextStyle(fontSize: 14.0, color: Colors.white)),
        ));
      }
    }

    return RefreshIndicator(
      color: Colors.deepPurpleAccent,
      onRefresh: () async {
        if (statusRed) {
          await getInfooProject();
          await getReqFProject();
          await getAvancesProject();
          await getDesarrolladorProject();
          await getVisits(ID);
        } else {
          await getUno();
          await getDos();
          await getCuatro();
          await getCinco();
          await getSeis();
        }

        await Future.delayed(Duration(milliseconds: 500));

        setState(() {});
      },
      child: Scaffold(
          key: _scaffoldKey1,
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
                                          image: NetworkImage(server +
                                              "/images/image_" +
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
                                  Text("¿Seguro que quieres cerrar sesión?"),
                              actions: <Widget>[
                                FlatButton(
                                  onPressed: () {
                                    helper.DeleteComents();
                                    helper.DeleteDesarrollador();
                                    helper.DeleteProyecto1();
                                    helper.DeleteProyecto2();
                                    helper.DeleteProyecto6();
                                    helper.DeleteProyecto4();
                                    helper.DeleteProyecto5();
                                    helper.DeleteProyectoInfo();

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
          body: dataProject != null
              ? Container(
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
                        width: mediaw,
                        height: (mediah / 2) + 73,
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                  child: IconButton(
                                      onPressed: () {
                                        _scaffoldKey1.currentState.openDrawer();
                                      },
                                      icon: Icon(
                                        CustomIcons.menu,
                                        color: Colors.white,
                                        size: 42,
                                      )),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 20, 20, 0),
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        "Visible",
                                        style: TextStyle(
                                            fontSize: 10.0,
                                            color: Colors.white),
                                      ),
                                      CupertinoSwitch(
                                        value: _ligths,
                                        onChanged: (bool value) async {
                                          if (!statusRed) {
                                            await showDialog(
                                                context: context,
                                                builder: (context) =>
                                                    new CupertinoAlertDialog(
                                                      title: Column(
                                                        children: <Widget>[
                                                          Icon(
                                                            Icons.devices_other,
                                                            size: 80,
                                                            color: Colors
                                                                .deepPurpleAccent,
                                                          ),
                                                          SizedBox(
                                                            height: 20,
                                                          ),
                                                          Text("FindProgrammer",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize:
                                                                      20)),
                                                        ],
                                                      ),
                                                      content: Text(
                                                          "No hay conexión a internet, intenta mas tarde"),
                                                      actions: <Widget>[
                                                        FlatButton(
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: Text("Aceptar",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize:
                                                                      15)),
                                                        ),
                                                      ],
                                                    ));
                                            return;
                                          }
                                          await updateState();

                                          setState(() {
                                            _ligths = value;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              alignment: Alignment.center,
                              width: 300,
                              child: Text(
                                dataProject[0]['TITULO'].toString(),
                                style: TextStyle(
                                    fontSize: 23.0, color: Colors.white),
                              ),
                            ),
                            Container(
                              width: (mediaw / 4) * 3,
                              height: mediah * .18,
                              child: ListView(
                                children: <Widget>[
                                  Text(
                                    dataProject[0]['DESCRIPCION'].toString(),
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                        fontSize: 13.0, color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 100,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(20, 10, 20, 10),
                                        child: GestureDetector(
                                          onTap: () async {
                                            if (!statusRed) {
                                              await showDialog(
                                                  context: context,
                                                  builder: (context) =>
                                                      new CupertinoAlertDialog(
                                                        title: Column(
                                                          children: <Widget>[
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
                                                            "No hay conexión a internet, intenta mas tarde"),
                                                        actions: <Widget>[
                                                          FlatButton(
                                                            onPressed: () {
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
                                              return;
                                            }
                                            if (dataProject[0]
                                                    ['F_EN_DESARROLLO'] ==
                                                "1") {
                                              await showDialog(
                                                  context: contextoS,
                                                  builder: (context) =>
                                                      new CupertinoAlertDialog(
                                                        title: Column(
                                                          children: <Widget>[
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
                                                            "El proyecto esta en desarrollo no es posible editarlo"),
                                                        actions: <Widget>[
                                                          FlatButton(
                                                            onPressed: () {
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
                                            } else {
                                              await showDialog(
                                                  context: contextoS,
                                                  builder: (context) =>
                                                      AlertEditPorject(ID));
                                              if (dataResponse == "1") {
                                                showDialog(
                                                    context: contextoS,
                                                    builder: (context) =>
                                                        new CupertinoAlertDialog(
                                                          title: Column(
                                                            children: <Widget>[
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
                                                              "El proyecto se editó correctamente"),
                                                          actions: <Widget>[
                                                            FlatButton(
                                                              onPressed: () {
                                                                Navigator.pop(
                                                                    context);
                                                                setState(() {});
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
                                              } else {
                                                showDialog(
                                                    builder: (context) =>
                                                        new CupertinoAlertDialog(
                                                          title: Column(
                                                            children: <Widget>[
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
                                                              "El proyecto no se editó, inténtalo mas tarde. "),
                                                          actions: <Widget>[
                                                            FlatButton(
                                                              onPressed: () {
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
                                                        ),
                                                    context: contextoS);
                                              }
                                            }
                                          },
                                          child: Column(
                                            children: <Widget>[
                                              Icon(
                                                GroovinMaterialIcons
                                                    .edit_outline,
                                                color: Colors.white,
                                                size: 30,
                                              ),
                                              SizedBox(
                                                height: 8,
                                              ),
                                              Text(
                                                "Editar Proyecto",
                                                style: TextStyle(
                                                    fontSize: 14.0,
                                                    color: Colors.white),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          if (dataProject[0]["F_EN_DESARROLLO"]=="0") {
                                            showDialog(
                                                context: context,
                                                builder: (context) =>
                                                    new CupertinoAlertDialog(
                                                      title: Column(
                                                        children: <Widget>[
                                                          Icon(
                                                            Icons.devices_other,
                                                            size: 80,
                                                            color: Colors
                                                                .deepPurpleAccent,
                                                          ),
                                                          SizedBox(
                                                            height: 20,
                                                          ),
                                                          Text("FindProgrammer",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize:
                                                                      20)),
                                                        ],
                                                      ),
                                                      content: Text(
                                                          "El proyecto no esta en desarrollo"),
                                                      actions: <Widget>[
                                                        FlatButton(
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: Text("Aceptar",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize:
                                                                      15)),
                                                        ),
                                                      ],
                                                    ));
                                            return;
                                          }
                                          if (!statusRed) {
                                            showDialog(
                                                context: context,
                                                builder: (context) =>
                                                    new CupertinoAlertDialog(
                                                      title: Column(
                                                        children: <Widget>[
                                                          Icon(
                                                            Icons.devices_other,
                                                            size: 80,
                                                            color: Colors
                                                                .deepPurpleAccent,
                                                          ),
                                                          SizedBox(
                                                            height: 20,
                                                          ),
                                                          Text("FindProgrammer",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize:
                                                                      20)),
                                                        ],
                                                      ),
                                                      content: Text(
                                                          "No hay conexión a internet, intenta mas tarde"),
                                                      actions: <Widget>[
                                                        FlatButton(
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: Text("Aceptar",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize:
                                                                      15)),
                                                        ),
                                                      ],
                                                    ));
                                            return;
                                          }
                                          print(dataProject);
                                          Navigator.push(
                                              context,
                                              CupertinoPageRoute(
                                                  builder: (context) =>
                                                      ChatClient(
                                                          dataProject[0]
                                                              ['ID_PROYECTO'],
                                                          dataProject[0]
                                                              ['FK_CLIENTE'])));
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.all(10),
                                          child: Column(
                                            children: <Widget>[
                                              Icon(
                                                GroovinMaterialIcons
                                                    .message_bulleted,
                                                color: Colors.white,
                                                size: 30,
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                "  Contactar\nProgramador",
                                                style: TextStyle(
                                                    fontSize: 14.0,
                                                    color: Colors.white),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(20, 10, 20, 10),
                                        child: Column(
                                          children: <Widget>[
                                            Icon(
                                              GroovinMaterialIcons.worker,
                                              color: dataProject[0]
                                                          ['F_EN_DESARROLLO'] ==
                                                      '1'
                                                  ? Colors.green
                                                  : Colors.grey,
                                              size: 30,
                                            ),
                                            SizedBox(
                                              height: 8,
                                            ),
                                            Text(
                                              "Proyecto en \n  desarrollo",
                                              style: TextStyle(
                                                  fontSize: 14.0,
                                                  color: Colors.white),
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
                                                          color: Colors
                                                              .deepPurpleAccent,
                                                        ),
                                                        SizedBox(
                                                          height: 20,
                                                        ),
                                                        Text("FindProgrammer",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 20)),
                                                      ],
                                                    ),
                                                    content: Text(
                                                        "El código del proyecto es: " +
                                                            dataProject[0]
                                                                ['codigo']),
                                                    actions: <Widget>[
                                                      FlatButton(
                                                        onPressed: () {
                                                          Clipboard.setData(
                                                              new ClipboardData(
                                                                  text: dataProject[
                                                                          0][
                                                                      'codigo']));

                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Text("Copiar",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 15)),
                                                      ),
                                                    ],
                                                  ));
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              20, 10, 20, 10),
                                          child: Column(
                                            children: <Widget>[
                                              Icon(
                                                GroovinMaterialIcons
                                                    .code_brackets,
                                                color: Colors.grey,
                                                size: 30,
                                              ),
                                              SizedBox(
                                                height: 8,
                                              ),
                                              Text(
                                                "Obtener  \n  Codigo",
                                                style: TextStyle(
                                                    fontSize: 14.0,
                                                    color: Colors.white),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () async {
                                          if (dataProject[0]["F_EN_DESARROLLO"]=="0") {
                                            showDialog(
                                                context: context,
                                                builder: (context) =>
                                                    new CupertinoAlertDialog(
                                                      title: Column(
                                                        children: <Widget>[
                                                          Icon(
                                                            Icons.devices_other,
                                                            size: 80,
                                                            color: Colors
                                                                .deepPurpleAccent,
                                                          ),
                                                          SizedBox(
                                                            height: 20,
                                                          ),
                                                          Text("FindProgrammer",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize:
                                                                      20)),
                                                        ],
                                                      ),
                                                      content: Text(
                                                          "El proyecto no esta en desarrollo"),
                                                      actions: <Widget>[
                                                        FlatButton(
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: Text("Aceptar",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize:
                                                                      15)),
                                                        ),
                                                      ],
                                                    ));
                                            return;
                                          }
                                          if (!statusRed) {
                                            await showDialog(
                                                context: context,
                                                builder: (context) =>
                                                    new CupertinoAlertDialog(
                                                      title: Column(
                                                        children: <Widget>[
                                                          Icon(
                                                            Icons.devices_other,
                                                            size: 80,
                                                            color: Colors
                                                                .deepPurpleAccent,
                                                          ),
                                                          SizedBox(
                                                            height: 20,
                                                          ),
                                                          Text("FindProgrammer",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize:
                                                                      20)),
                                                        ],
                                                      ),
                                                      content: Text(
                                                          "No hay conexión a internet, intenta mas tarde"),
                                                      actions: <Widget>[
                                                        FlatButton(
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: Text("Aceptar",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize:
                                                                      15)),
                                                        ),
                                                      ],
                                                    ));
                                            return;
                                          }
                                          print("object");
                                          await showDialog(
                                              context: context,
                                              builder:
                                                  (context) =>
                                                      CupertinoAlertDialog(
                                                        title: Column(
                                                          children: <Widget>[
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
                                                                "Abandonar proyecto",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        20)),
                                                          ],
                                                        ),
                                                        content: Column(
                                                          children: <Widget>[
                                                            SizedBox(
                                                              height: 7,
                                                            ),
                                                            Container(
                                                              width: 240,
                                                              child: Text(
                                                                "Escribe la razón del abandono.",
                                                                textAlign:
                                                                    TextAlign
                                                                        .justify,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 8,
                                                            ),
                                                            CupertinoTextField(
                                                              maxLines: null,
                                                              keyboardType:
                                                                  TextInputType
                                                                      .multiline,
                                                              controller: razon,
                                                              placeholder:
                                                                  ".....",
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
                                                                      width:
                                                                          0.5,
                                                                      color: Colors
                                                                          .deepPurpleAccent)),
                                                            ),
                                                          ],
                                                        ),
                                                        actions: <Widget>[
                                                          FlatButton(
                                                            onPressed:
                                                                () async {
                                                              if (razon.text ==
                                                                  "") {
                                                                await showDialog(
                                                                    context:
                                                                        contextoS,
                                                                    builder:
                                                                        (context) =>
                                                                            new CupertinoAlertDialog(
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
                                                                                  Text("FindProgrammer", style: TextStyle(color: Colors.black, fontSize: 20)),
                                                                                ],
                                                                              ),
                                                                              content: Text("Debes escribir una razón para abandonar el proyecto"),
                                                                              actions: <Widget>[
                                                                                FlatButton(
                                                                                  onPressed: () {
                                                                                    Navigator.pop(context);
                                                                                  },
                                                                                  child: Text("Aceptar", style: TextStyle(color: Colors.black, fontSize: 15)),
                                                                                ),
                                                                              ],
                                                                            ));
                                                                return;
                                                              }
                                                              await abandonar(
                                                                  this.ID);
                                                              if (responseA ==
                                                                  "1") {
                                                                Navigator.pop(
                                                                    context);
                                                                await showDialog(
                                                                    context:
                                                                        contextoS,
                                                                    builder:
                                                                        (context) =>
                                                                            new CupertinoAlertDialog(
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
                                                                                  Text("FindProgrammer", style: TextStyle(color: Colors.black, fontSize: 20)),
                                                                                ],
                                                                              ),
                                                                              content: Text("Abandonaste este proyecto con exito cuando el programador sea notificado el proyecto podra ser desarrollado por otro desarrollador."),
                                                                              actions: <Widget>[
                                                                                FlatButton(
                                                                                  onPressed: () {
                                                                                    Navigator.pop(context);
                                                                                  },
                                                                                  child: Text("Aceptar", style: TextStyle(color: Colors.black, fontSize: 15)),
                                                                                ),
                                                                              ],
                                                                            ));
                                                              } else {
                                                                Navigator.pop(
                                                                    context);
                                                                await showDialog(
                                                                    context:
                                                                        contextoS,
                                                                    builder:
                                                                        (context) =>
                                                                            new CupertinoAlertDialog(
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
                                                                                  Text("FindProgrammer", style: TextStyle(color: Colors.black, fontSize: 20)),
                                                                                ],
                                                                              ),
                                                                              content: Text("Ocurrió un error inténtalo mas tarde"),
                                                                              actions: <Widget>[
                                                                                FlatButton(
                                                                                  onPressed: () {
                                                                                    Navigator.pop(context);
                                                                                  },
                                                                                  child: Text("Aceptar", style: TextStyle(color: Colors.black, fontSize: 15)),
                                                                                ),
                                                                              ],
                                                                            ));
                                                              }
                                                            },
                                                            child: Text(
                                                                "Abandonar",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        15)),
                                                          ),
                                                          FlatButton(
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child: Text(
                                                                "Cancelar",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        15)),
                                                          ),
                                                        ],
                                                      ));
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              20, 10, 20, 10),
                                          child: Column(
                                            children: <Widget>[
                                              Icon(
                                                GroovinMaterialIcons.cancel,
                                                color: Colors.white,
                                                size: 30,
                                              ),
                                              SizedBox(
                                                height: 8,
                                              ),
                                              Text(
                                                "Abandonar \n proyecto ",
                                                style: TextStyle(
                                                    fontSize: 14.0,
                                                    color: Colors.white),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          if (dataProject[0]["F_EN_DESARROLLO"]=="0") {
                                            showDialog(
                                                context: context,
                                                builder: (context) =>
                                                    new CupertinoAlertDialog(
                                                      title: Column(
                                                        children: <Widget>[
                                                          Icon(
                                                            Icons.devices_other,
                                                            size: 80,
                                                            color: Colors
                                                                .deepPurpleAccent,
                                                          ),
                                                          SizedBox(
                                                            height: 20,
                                                          ),
                                                          Text("FindProgrammer",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize:
                                                                      20)),
                                                        ],
                                                      ),
                                                      content: Text(
                                                          "El proyecto no esta en desarrollo"),
                                                      actions: <Widget>[
                                                        FlatButton(
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: Text("Aceptar",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize:
                                                                      15)),
                                                        ),
                                                      ],
                                                    ));
                                            return;
                                          }
                                          if (!statusRed) {
                                            showDialog(
                                                context: context,
                                                builder: (context) =>
                                                    new CupertinoAlertDialog(
                                                      title: Column(
                                                        children: <Widget>[
                                                          Icon(
                                                            Icons.devices_other,
                                                            size: 80,
                                                            color: Colors
                                                                .deepPurpleAccent,
                                                          ),
                                                          SizedBox(
                                                            height: 20,
                                                          ),
                                                          Text("FindProgrammer",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize:
                                                                      20)),
                                                        ],
                                                      ),
                                                      content: Text(
                                                          "No hay conexión a internet, intenta mas tarde"),
                                                      actions: <Widget>[
                                                        FlatButton(
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: Text("Aceptar",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize:
                                                                      15)),
                                                        ),
                                                      ],
                                                    ));
                                            return;
                                          }
                                          showDialog(
                                              context: context,
                                              builder: (context) =>
                                                  CupertinoAlertDialog(
                                                    title: Column(
                                                      children: <Widget>[
                                                        Icon(
                                                          Icons.devices_other,
                                                          size: 80,
                                                          color: Colors
                                                              .deepPurpleAccent,
                                                        ),
                                                        SizedBox(
                                                          height: 20,
                                                        ),
                                                        Text(
                                                            "Reportar programador",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 20)),
                                                      ],
                                                    ),
                                                    content: Column(
                                                      children: <Widget>[
                                                        SizedBox(
                                                          height: 7,
                                                        ),
                                                        Container(
                                                          width: 240,
                                                          child: Text(
                                                            "Escribe la razón del reporte.",
                                                            textAlign: TextAlign
                                                                .justify,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 8,
                                                        ),
                                                        CupertinoTextField(
                                                          maxLines: null,
                                                          keyboardType:
                                                              TextInputType
                                                                  .multiline,
                                                          controller: reporte,
                                                          placeholder:
                                                              "El programador...",
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
                                                    actions: <Widget>[
                                                      FlatButton(
                                                        onPressed: () async {
                                                          await createReport(
                                                              context);
                                                        },
                                                        child: Text("Reportar",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 15)),
                                                      ),
                                                      FlatButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Text("Cancelar",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 15)),
                                                      ),
                                                    ],
                                                  ));
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              20, 10, 20, 10),
                                          child: Column(
                                            children: <Widget>[
                                              Icon(
                                                GroovinMaterialIcons
                                                    .heart_broken,
                                                color: Colors.white,
                                                size: 30,
                                              ),
                                              SizedBox(
                                                height: 8,
                                              ),
                                              Text(
                                                "  Reportar \nProgramador",
                                                style: TextStyle(
                                                    fontSize: 14.0,
                                                    color: Colors.white),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          if (!statusRed) {
                                            showDialog(
                                                context: context,
                                                builder: (context) =>
                                                    new CupertinoAlertDialog(
                                                      title: Column(
                                                        children: <Widget>[
                                                          Icon(
                                                            Icons.devices_other,
                                                            size: 80,
                                                            color: Colors
                                                                .deepPurpleAccent,
                                                          ),
                                                          SizedBox(
                                                            height: 20,
                                                          ),
                                                          Text("FindProgrammer",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize:
                                                                      20)),
                                                        ],
                                                      ),
                                                      content: Text(
                                                          "No hay conexión a internet, intenta mas tarde"),
                                                      actions: <Widget>[
                                                        FlatButton(
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: Text("Aceptar",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize:
                                                                      15)),
                                                        ),
                                                      ],
                                                    ));
                                            return;
                                          }
                                          Navigator.push(
                                              context,
                                              CupertinoPageRoute(
                                                  builder: (context) =>
                                                      ViewHireProgrammer(
                                                          this.ID)));
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              20, 10, 20, 10),
                                          child: Column(
                                            children: <Widget>[
                                              Icon(
                                                GroovinMaterialIcons.loupe,
                                                color: Colors.white,
                                                size: 30,
                                              ),
                                              SizedBox(
                                                height: 8,
                                              ),
                                              Text(
                                                "  Programadores \n    Interesados",
                                                style: TextStyle(
                                                    fontSize: 14.0,
                                                    color: Colors.white),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          if (dataProject[0]["F_EN_DESARROLLO"]=="0") {
                                            showDialog(
                                                context: context,
                                                builder: (context) =>
                                                    new CupertinoAlertDialog(
                                                      title: Column(
                                                        children: <Widget>[
                                                          Icon(
                                                            Icons.devices_other,
                                                            size: 80,
                                                            color: Colors
                                                                .deepPurpleAccent,
                                                          ),
                                                          SizedBox(
                                                            height: 20,
                                                          ),
                                                          Text("FindProgrammer",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize:
                                                                      20)),
                                                        ],
                                                      ),
                                                      content: Text(
                                                          "El proyecto no esta en desarrollo"),
                                                      actions: <Widget>[
                                                        FlatButton(
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: Text("Aceptar",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize:
                                                                      15)),
                                                        ),
                                                      ],
                                                    ));
                                            return;
                                          }
                                          if (!statusRed) {
                                            showDialog(
                                                context: context,
                                                builder: (context) =>
                                                    new CupertinoAlertDialog(
                                                      title: Column(
                                                        children: <Widget>[
                                                          Icon(
                                                            Icons.devices_other,
                                                            size: 80,
                                                            color: Colors
                                                                .deepPurpleAccent,
                                                          ),
                                                          SizedBox(
                                                            height: 20,
                                                          ),
                                                          Text("FindProgrammer",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize:
                                                                      20)),
                                                        ],
                                                      ),
                                                      content: Text(
                                                          "No hay conexión a internet, intenta mas tarde"),
                                                      actions: <Widget>[
                                                        FlatButton(
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: Text("Aceptar",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize:
                                                                      15)),
                                                        ),
                                                      ],
                                                    ));
                                            return;
                                          }
                                          if (dataProject[0]['F_TERMINADO'] ==
                                              "1") {
                                            showDialog(
                                                context: context,
                                                builder: (context) =>
                                                    new CupertinoAlertDialog(
                                                      title: Column(
                                                        children: <Widget>[
                                                          Icon(
                                                            Icons.devices_other,
                                                            size: 80,
                                                            color: Colors
                                                                .deepPurpleAccent,
                                                          ),
                                                          SizedBox(
                                                            height: 20,
                                                          ),
                                                          Text(
                                                              "Terminar proyecto",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize:
                                                                      20)),
                                                        ],
                                                      ),
                                                      content: Text(
                                                          "Este proyecto ya ha sido finalizado"),
                                                      actions: <Widget>[
                                                        FlatButton(
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: Text("Aceptar",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize:
                                                                      15)),
                                                        ),
                                                      ],
                                                    ));
                                            return;
                                          }
                                          if (dataProject[0]['F_TERMINADO_C'] ==
                                              "0") {
                                            //el pryecto no esta terminado
                                            showDialog(
                                                context: context,
                                                builder:
                                                    (context) =>
                                                        CupertinoAlertDialog(
                                                          title: Column(
                                                            children: <Widget>[
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
                                                                  "Terminar Proyecto ",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          20)),
                                                            ],
                                                          ),
                                                          content: Column(
                                                            children: <Widget>[
                                                              SizedBox(
                                                                height: 7,
                                                              ),
                                                              Container(
                                                                width: 240,
                                                                child: Text(
                                                                  "¿Seguro que quieres dar por terminado el proyecto?",
                                                                  textAlign:
                                                                      TextAlign
                                                                          .justify,
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                height: 8,
                                                              ),
                                                            ],
                                                          ),
                                                          actions: <Widget>[
                                                            FlatButton(
                                                              onPressed: () {
                                                                Navigator.pop(
                                                                    context);

                                                                showDialog(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (context) =>
                                                                            CupertinoAlertDialog(
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
                                                                                  Text("Terminar Proyecto", style: TextStyle(color: Colors.black, fontSize: 20)),
                                                                                ],
                                                                              ),
                                                                              content: Column(
                                                                                children: <Widget>[
                                                                                  SizedBox(
                                                                                    height: 7,
                                                                                  ),
                                                                                  Container(
                                                                                    width: 240,
                                                                                    child: Text(
                                                                                      "Felicidades por finalizar tu proyecto, para terminar el proyecto oficialmente necesitamos que el programador marque el proyecto finalizado tambien. Mientras lo hace califica y agrega un comentario a este programador!!!",
                                                                                      textAlign: TextAlign.justify,
                                                                                    ),
                                                                                  ),
                                                                                  SizedBox(
                                                                                    height: 8,
                                                                                  ),
                                                                                  FlutterRatingBar(
                                                                                    initialRating: 3,
                                                                                    fillColor: Colors.deepPurpleAccent,
                                                                                    borderColor: Colors.black38,
                                                                                    allowHalfRating: true,
                                                                                    onRatingUpdate: (rating) {
                                                                                      calificacion = rating;
                                                                                    },
                                                                                  ),
                                                                                  Text("Calificacion rango: 0-10", style: TextStyle(color: Colors.black, fontSize: 10)),
                                                                                  SizedBox(
                                                                                    height: 8,
                                                                                  ),
                                                                                  CupertinoTextField(
                                                                                    controller: comentario,
                                                                                    placeholder: "Comenta algo...",
                                                                                    placeholderStyle: TextStyle(color: Colors.black38),
                                                                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(width: 0.5, color: Colors.deepPurpleAccent)),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              actions: <Widget>[
                                                                                FlatButton(
                                                                                  onPressed: () async {
                                                                                    await finishProject(ID);
                                                                                    Navigator.pop(context);
                                                                                    if (finish == "1") {
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
                                                                                                    Text("Terminar proyecto", style: TextStyle(color: Colors.black, fontSize: 20)),
                                                                                                  ],
                                                                                                ),
                                                                                                content: Text("¿El desarrollador ya habia dado por terminado el proyecto asi que oficialmente este proyecto ha concluido. Muchas gracias."),
                                                                                                actions: <Widget>[
                                                                                                  FlatButton(
                                                                                                    onPressed: () {
                                                                                                      helper.DeleteCliente();
                                                                                                      Navigator.pop(context);
                                                                                                    },
                                                                                                    child: Text("Aceptar", style: TextStyle(color: Colors.black, fontSize: 15)),
                                                                                                  ),
                                                                                                ],
                                                                                              ));
                                                                                    }
                                                                                  },
                                                                                  child: Text("Terminar", style: TextStyle(color: Colors.black, fontSize: 15)),
                                                                                ),
                                                                              ],
                                                                            ));
                                                              },
                                                              child: Text(
                                                                  "Aceptar",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          15)),
                                                            ),
                                                            FlatButton(
                                                              child: Text(
                                                                  "Cancelar",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          15)),
                                                              onPressed: () {
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                            ),
                                                          ],
                                                        ));
                                          } else {
                                            //el proyecto ya esta terminado
                                            showDialog(
                                                context: context,
                                                builder: (context) =>
                                                    CupertinoAlertDialog(
                                                      title: Column(
                                                        children: <Widget>[
                                                          Icon(
                                                            Icons.devices_other,
                                                            size: 80,
                                                            color: Colors
                                                                .deepPurpleAccent,
                                                          ),
                                                          SizedBox(
                                                            height: 20,
                                                          ),
                                                          Text(
                                                              "Terminar Proyecto ",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize:
                                                                      20)),
                                                        ],
                                                      ),
                                                      content: Column(
                                                        children: <Widget>[
                                                          SizedBox(
                                                            height: 7,
                                                          ),
                                                          Container(
                                                            width: 240,
                                                            child: Text(
                                                              "Ya marcaste este proyecto como terminado ¿Quieres deshacer eso?",
                                                              textAlign:
                                                                  TextAlign
                                                                      .justify,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 8,
                                                          ),
                                                        ],
                                                      ),
                                                      actions: <Widget>[
                                                        FlatButton(
                                                          onPressed: () async {
                                                            await undoFinishProject(
                                                                ID);
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: Text("Aceptar",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize:
                                                                      15)),
                                                        ),
                                                        FlatButton(
                                                          child: Text(
                                                              "Cancelar",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize:
                                                                      15)),
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                        ),
                                                      ],
                                                    ));
                                          }
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              20, 10, 20, 10),
                                          child: Column(
                                            children: <Widget>[
                                              Icon(
                                                GroovinMaterialIcons
                                                    .check_circle,
                                                color: Colors.white,
                                                size: 30,
                                              ),
                                              SizedBox(
                                                height: 8,
                                              ),
                                              Text(
                                                "Proyecto \nTerminado",
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
                      Expanded(
                        child: ListView(
                          children: <Widget>[
                            Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              elevation: 10,
                              color: Color.fromARGB(450, 41, 39, 42),
                              child: Column(
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(10, 17, 0, 0),
                                    child: Text("Requerimientos",
                                        style: TextStyle(
                                            fontSize: 27.0,
                                            color: Colors.white)),
                                  ),
                                  dataProject[0]['F_EN_DESARROLLO'] == "1"
                                      ? dataProject[0]['F_REQ_F'] == "1"
                                          ? Column(children: listReqF)
                                          : Text("Sin requerimientos creados",
                                              style: TextStyle(
                                                  fontSize: 14.0,
                                                  color: Colors.white))
                                      : Text("Proyecto sin empezar",
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              color: Colors.white)),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                            Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              elevation: 10,
                              color: Color.fromARGB(450, 41, 39, 42),
                              child: Column(
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(10, 17, 0, 0),
                                    child: Text("Entregables",
                                        style: TextStyle(
                                            fontSize: 27.0,
                                            color: Colors.white)),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
                                    child: dataProject[0]
                                                ['INTERVALO_DE_AVANCES'] ==
                                            "0"
                                        ? Text(
                                            "-Se requieren Avances 'cada 15 dias' .",
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                color: Colors.white))
                                        : dataProject[0]
                                                    ['INTERVALO_DE_AVANCES'] ==
                                                "1"
                                            ? Text(
                                                "-Se requieren Avances 'cada mes' .",
                                                style: TextStyle(
                                                    fontSize: 14.0,
                                                    color: Colors.white))
                                            : Text(
                                                "-Se requieren Avances 'cada 2 meses' .",
                                                style: TextStyle(
                                                    fontSize: 14.0,
                                                    color: Colors.white)),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
                                    child: dataProject[0]["F_S_ENTREGABLES"] ==
                                            "1"
                                        ? Text("-Se requieren Entregables.",
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                color: Colors.white))
                                        : Text("-No se requieren Entregables.",
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                color: Colors.white)),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                            Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              elevation: 10,
                              color: Color.fromARGB(450, 41, 39, 42),
                              child: Column(
                                children: <Widget>[
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                    child: Text("Tipo de Proyecto:",
                                        style: TextStyle(
                                            fontSize: 27.0,
                                            color: Colors.white)),
                                  ),
                                  Padding(
                                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                      child: dataProject[0]["F_TIPO_DE_PROYECTO"] == "0"
                                          ? Text("Aplicación Web",
                                              style: TextStyle(
                                                  fontSize: 14.0,
                                                  color: Colors.white))
                                          : dataProject[0]["F_TIPO_DE_PROYECTO"] == "1"
                                              ? Text("Aplicación Movil Android",
                                                  style: TextStyle(
                                                      fontSize: 14.0,
                                                      color: Colors.white))
                                              : dataProject[0]["F_TIPO_DE_PROYECTO"] == "2"
                                                  ? Text("Aplicación Movil IOS",
                                                      style: TextStyle(
                                                          fontSize: 14.0,
                                                          color: Colors.white))
                                                  : dataProject[0]["F_TIPO_DE_PROYECTO"] == "3"
                                                      ? Text("Aplicación Escritorio Windows",
                                                          style: TextStyle(
                                                              fontSize: 14.0,
                                                              color:
                                                                  Colors.white))
                                                      : dataProject[0]["F_TIPO_DE_PROYECTO"] ==
                                                              "4"
                                                          ? Text("Aplicación Escritorio MAC", style: TextStyle(fontSize: 14.0, color: Colors.white))
                                                          : dataProject[0]["F_TIPO_DE_PROYECTO"] == "5" ? Text("Proyecto de Redes", style: TextStyle(fontSize: 14.0, color: Colors.white)) : Text("ERROR", style: TextStyle(fontSize: 14.0, color: Colors.white))),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                            Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              elevation: 10,
                              color: Color.fromARGB(450, 41, 39, 42),
                              child: Column(
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(10, 17, 0, 0),
                                    child: Text("Avances",
                                        style: TextStyle(
                                            fontSize: 27.0,
                                            color: Colors.white)),
                                  ),
                                  Column(
                                    children: listAvances,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                            Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              elevation: 10,
                              color: Color.fromARGB(450, 41, 39, 42),
                              child: Column(
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(10, 17, 0, 0),
                                    child: Text("Desarrollandose por:",
                                        style: TextStyle(
                                            fontSize: 27.0,
                                            color: Colors.white)),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
                                    child: desarrollador.length != 0
                                        ? Text(
                                            utf8.decode(base64.decode(desarrollador[0]['nombre'])).toString() +
                                                " " +
                                                utf8
                                                    .decode(base64.decode(
                                                        desarrollador[0]
                                                            ['apellido_p']))
                                                    .toString() +
                                                " " +
                                                utf8
                                                    .decode(base64.decode(
                                                        desarrollador[0]
                                                            ['apellido_m']))
                                                    .toString(),
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                color: Colors.white))
                                        : Text("Sin desarrollador asignado",
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                color: Colors.white)),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                            Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              elevation: 10,
                              color: Color.fromARGB(450, 41, 39, 42),
                              child: Column(
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(10, 17, 0, 0),
                                    child: Text("No. visitas",
                                        style: TextStyle(
                                            fontSize: 27.0,
                                            color: Colors.white)),
                                  ),
                                  visitas == null
                                      ? Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(15, 5, 0, 0),
                                          child: Text("0",
                                              style: TextStyle(
                                                  fontSize: 14.0,
                                                  color: Colors.white)),
                                        )
                                      : Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(15, 5, 0, 0),
                                          child: Text(
                                              "" + visitas.length.toString(),
                                              style: TextStyle(
                                                  fontSize: 14.0,
                                                  color: Colors.white)),
                                        ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              : Stack(
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
                            width: mediaw,
                            height: (mediah / 2) + 50,
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                      child: IconButton(
                                          onPressed: () {
                                            _scaffoldKey1.currentState
                                                .openDrawer();
                                          },
                                          icon: Icon(
                                            CustomIcons.menu,
                                            color: Colors.white,
                                            size: 42,
                                          )),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(0, 20, 20, 0),
                                      child: Column(
                                        children: <Widget>[
                                          Text(
                                            "Visible",
                                            style: TextStyle(
                                                fontSize: 10.0,
                                                color: Colors.white),
                                          ),
                                          CupertinoSwitch(
                                            value: _ligths,
                                            onChanged: (bool value) {
                                              setState(() {
                                                _ligths = value;
                                              });
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  width: 300,
                                  child: Text(
                                    "_______________________",
                                    style: TextStyle(
                                        fontSize: 25.0, color: Colors.white),
                                  ),
                                ),
                                Container(
                                  width: (mediaw / 4) * 3,
                                  height: 90,
                                  child: ListView(
                                    children: <Widget>[
                                      Text(
                                        "__________________________________________________________________________________________________________",
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 100,
                                  child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    children: <Widget>[
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                20, 10, 20, 10),
                                            child: Column(
                                              children: <Widget>[
                                                Icon(
                                                  GroovinMaterialIcons
                                                      .edit_outline,
                                                  color: Colors.white,
                                                  size: 30,
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  "Editar Proyecto",
                                                  style: TextStyle(
                                                      fontSize: 14.0,
                                                      color: Colors.white),
                                                ),
                                              ],
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {

                                              print(dataProject);
                                              Navigator.push(
                                                  context,
                                                  CupertinoPageRoute(
                                                      builder: (context) =>
                                                          ChatClient(
                                                              dataProject[0][
                                                                  'ID_PROYECTO'],
                                                              dataProject[0][
                                                                  'FK_CLIENTE'])));
                                            },
                                            child: Padding(
                                              padding: EdgeInsets.all(10),
                                              child: Column(
                                                children: <Widget>[
                                                  Icon(
                                                    GroovinMaterialIcons
                                                        .message_bulleted,
                                                    color: Colors.white,
                                                    size: 30,
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    "  Contactar\nProgramador",
                                                    style: TextStyle(
                                                        fontSize: 14.0,
                                                        color: Colors.white),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                20, 10, 20, 10),
                                            child: Column(
                                              children: <Widget>[
                                                Icon(
                                                  GroovinMaterialIcons.worker,
                                                  color: Colors.grey,
                                                  size: 30,
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  "Proyecto en \n  desarrollo",
                                                  style: TextStyle(
                                                      fontSize: 14.0,
                                                      color: Colors.white),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                20, 10, 20, 10),
                                            child: Column(
                                              children: <Widget>[
                                                Icon(
                                                  GroovinMaterialIcons
                                                      .code_brackets,
                                                  color: Colors.grey,
                                                  size: 30,
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  "Obtener  \n  Codigo",
                                                  style: TextStyle(
                                                      fontSize: 14.0,
                                                      color: Colors.white),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                20, 10, 20, 10),
                                            child: Column(
                                              children: <Widget>[
                                                Icon(
                                                  GroovinMaterialIcons.cancel,
                                                  color: Colors.white,
                                                  size: 30,
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  "Cancelar \n proyecto ",
                                                  style: TextStyle(
                                                      fontSize: 14.0,
                                                      color: Colors.white),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                20, 10, 20, 10),
                                            child: Column(
                                              children: <Widget>[
                                                Icon(
                                                  GroovinMaterialIcons
                                                      .heart_broken,
                                                  color: Colors.white,
                                                  size: 30,
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  "  Reportar \nProgramador",
                                                  style: TextStyle(
                                                      fontSize: 14.0,
                                                      color: Colors.white),
                                                ),
                                              ],
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {},
                                            child: Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  20, 10, 20, 10),
                                              child: Column(
                                                children: <Widget>[
                                                  Icon(
                                                    GroovinMaterialIcons.loupe,
                                                    color: Colors.white,
                                                    size: 30,
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    "  Programadores \n    Interesados",
                                                    style: TextStyle(
                                                        fontSize: 14.0,
                                                        color: Colors.white),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                20, 10, 20, 10),
                                            child: Column(
                                              children: <Widget>[
                                                Icon(
                                                  GroovinMaterialIcons
                                                      .check_circle,
                                                  color: Colors.white,
                                                  size: 30,
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  "Proyecto \nTerminado",
                                                  style: TextStyle(
                                                      fontSize: 14.0,
                                                      color: Colors.white),
                                                ),
                                              ],
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
                          Expanded(
                            child: ListView(
                              children: <Widget>[
                                Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  elevation: 10,
                                  color: Color.fromARGB(450, 41, 39, 42),
                                  child: Column(
                                    children: <Widget>[
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(10, 0, 0, 0),
                                        child: Text(
                                            "_______________________________________",
                                            style: TextStyle(
                                                fontSize: 27.0,
                                                color: Colors.white)),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(15, 5, 0, 0),
                                        child: Text(
                                            "_______________________________________",
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                color: Colors.white)),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(15, 5, 0, 0),
                                        child: Text(
                                            "_______________________________________",
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                color: Colors.white)),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(15, 5, 0, 0),
                                        child: Text(
                                            "_______________________________________",
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                color: Colors.white)),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(15, 5, 0, 0),
                                        child: Text(
                                            "_______________________________________",
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                color: Colors.white)),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  ),
                                ),
                                Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  elevation: 10,
                                  color: Color.fromARGB(450, 41, 39, 42),
                                  child: Column(
                                    children: <Widget>[
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(10, 17, 0, 0),
                                        child: Text(
                                            "________________________________________",
                                            style: TextStyle(
                                                fontSize: 27.0,
                                                color: Colors.white)),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(15, 5, 0, 0),
                                        child: Text(
                                            "__________________________________",
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                color: Colors.white)),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(15, 5, 0, 0),
                                        child: Text(
                                            "__________________________________",
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                color: Colors.white)),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(15, 5, 0, 0),
                                        child: Text(
                                            "_______________________________",
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                color: Colors.white)),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(15, 5, 0, 0),
                                        child: Text(
                                            "________________________________________",
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                color: Colors.white)),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  ),
                                ),
                                Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  elevation: 10,
                                  color: Color.fromARGB(450, 41, 39, 42),
                                  child: Column(
                                    children: <Widget>[
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(10, 17, 0, 0),
                                        child: Text("_______________-",
                                            style: TextStyle(
                                                fontSize: 27.0,
                                                color: Colors.white)),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(15, 5, 0, 0),
                                        child: Text(
                                            "__________________________",
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                color: Colors.white)),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(15, 5, 0, 0),
                                        child: Text(
                                            "_______________________________",
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                color: Colors.white)),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  ),
                                ),
                                Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  elevation: 10,
                                  color: Color.fromARGB(450, 41, 39, 42),
                                  child: Column(
                                    children: <Widget>[
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(10, 0, 0, 0),
                                        child: Text("________________",
                                            style: TextStyle(
                                                fontSize: 27.0,
                                                color: Colors.white)),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(10, 0, 0, 0),
                                        child: Text("___________________",
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                color: Colors.white)),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  ),
                                ),
                                Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  elevation: 10,
                                  color: Color.fromARGB(450, 41, 39, 42),
                                  child: Column(
                                    children: <Widget>[
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(10, 17, 0, 0),
                                        child: Text("______________",
                                            style: TextStyle(
                                                fontSize: 27.0,
                                                color: Colors.white)),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(15, 5, 0, 0),
                                        child: Text(
                                            "_____________________________________________",
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                color: Colors.white)),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(15, 5, 0, 0),
                                        child: Text(
                                            "______________________________________________",
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                color: Colors.white)),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(15, 5, 0, 0),
                                        child: Text(
                                            "_____________________________________________",
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                color: Colors.white)),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(15, 5, 0, 0),
                                        child: Text(
                                            "_____________________________________",
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                color: Colors.white)),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(15, 5, 0, 0),
                                        child: Text(
                                            "___________________________________________________________",
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                color: Colors.white)),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(15, 5, 0, 0),
                                        child: Text(
                                            "__________________________________________________________________________________________________",
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                color: Colors.white)),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(15, 5, 0, 0),
                                        child: Text(
                                            "____________________________________________________________",
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                color: Colors.white)),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  ),
                                ),
                                Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  elevation: 10,
                                  color: Color.fromARGB(450, 41, 39, 42),
                                  child: Column(
                                    children: <Widget>[
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(10, 17, 0, 0),
                                        child: Text("____________________",
                                            style: TextStyle(
                                                fontSize: 27.0,
                                                color: Colors.white)),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(15, 5, 0, 0),
                                        child: Text("______________",
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                color: Colors.white)),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  ),
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
                )),
    );
  }

  void getUno() async {
    try {
      dataProject = await helper.SelectProyecto1();
      if (dataProject.isEmpty) {
        Navigator.pop(context);
      }
      print("se obtuvo los uno ofline");
      print(dataProject);
    } catch (e) {
      print("aqui hay un error de no se que, funcion getClient en homecliente" +
          e.toString());
    }
    setState(() {});
  }

  Future getInfooProject() async {
    var cliente1 = http.Client();
    try {
      final response = await cliente1.post(server + "/loadInfoProjectPanel.php",
          //"http://192.168.0.5/findprogrammerDB/loadInfoProject.php",

          body: {
            "ID_PROYECTO": this.ID,
            "TYPE": "1"
          }).timeout(Duration(seconds: 7));

      var dataProject2 = json.decode(response.body);
      dataProject = dataProject2;

      helper.DeleteProyecto1();
      for (int x = 0; x < dataProject2.length; x++) {
        var insertarPRoeycto = await helper.InsertProyecto1(dataProject[x]);
        print(">>>>$insertarPRoeycto<<<<<");
      }

      print("DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD1");
      print(dataProject);
      print("DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD");
      dataProject[0]["F_VISIBILIDAD"] == "1" ? _ligths = true : _ligths = false;

      if (dataProject[0]['F_ABANDONO_D'] == "1") {
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
                      Text("FindProgrammer",
                          style: TextStyle(color: Colors.black, fontSize: 20)),
                    ],
                  ),
                  content: Text(
                      "El cliente decidió abandonar este proyecto, una vez aceptado este mensaje desaparecera de tus proyectos en desarrollo. \n La razón del abandono es la siguiente: " +
                          dataProject[0]['OBSERVACIONESABANDONO'].toString()),
                  actions: <Widget>[
                    FlatButton(
                      onPressed: () {
                        confirmar(ID);
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => Homeclient()));
                      },
                      child: Text("Aceptar",
                          style: TextStyle(color: Colors.black, fontSize: 15)),
                    ),
                  ],
                ));

        return;
      }

      String fechaReporte = dataProject[0]['NEXT_ADVANCE'];
      List<String> dates = fechaReporte.split("-");
      DateTime date = new DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day);
      DateTime last = DateTime(
          int.parse(dates[0]), int.parse(dates[1]), int.parse(dates[2]));

      print("OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO");
      print(date.toString());
      print(last.toString());
      print("OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO");
      var difference = last.difference(date).inDays;
      print(difference);
      if (difference == 0) {
        showOngoingNotification(notification,
            title: 'FindProgrammer',
            body: 'El programador te tiene que entregar un avance hoy!!!',
            id: 0);
      }

      if (dataProject[0]['F_A_CORRECION_REQ_D'] == "1") {
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
                      Text("FindProgrammer",
                          style: TextStyle(color: Colors.black, fontSize: 20)),
                    ],
                  ),
                  content: Text(
                      "El programador creo una nueva version de los requerimientos"),
                  actions: <Widget>[
                    FlatButton(
                      onPressed: () {
                        Navigator.pop(context);

                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => ViewReqFormal(ID)));
                      },
                      child: Text("Ver ahora",
                          style: TextStyle(color: Colors.black, fontSize: 15)),
                    ),
                    FlatButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Ver mas tarde",
                          style: TextStyle(color: Colors.black, fontSize: 15)),
                    ),
                  ],
                ));
      }
      if (dataProject[0]['F_AVANCE_D'] == "1") {
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
                      Text("FindProgrammer",
                          style: TextStyle(color: Colors.black, fontSize: 20)),
                    ],
                  ),
                  content: Text("El programador creo un nuevo avance"),
                  actions: <Widget>[
                    FlatButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => ViewAdvance(ID)));
                      },
                      child: Text("Ver ahora",
                          style: TextStyle(color: Colors.black, fontSize: 15)),
                    ),
                    FlatButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Ver mas tarde",
                          style: TextStyle(color: Colors.black, fontSize: 15)),
                    ),
                  ],
                ));
      }

      // print(this.dataProject);
    } catch (f) {
      print("Error obteniendo la info del proyecto");
      setState(() {});
    } finally {
      print("se cerro la conexion");
      cliente1.close();
    }
  }

  void getDos() async {
    if (reqFuncionales.isEmpty) {
      Navigator.pop(context);
    }
    try {
      reqFuncionales = await helper.SelectProyecto2();
      print("se obtuvo los dos ofline");
      print(reqFuncionales);
    } catch (e) {
      print("aqui hay un error de no se que, funcion getClient en homecliente" +
          e.toString());
    }
    setState(() {});
  }

  Future<void> getReqFProject() async {
    print("entro");
    final response = await http
        .post(
            //"http://192.168.0.5/findprogrammerDB/loadInfoProject.php",
            server + "/loadInfoProject.php",
            body: {"ID_PROYECTO": this.ID, "TYPE": "2"})
        .catchError((error) {})
        .timeout(Duration(seconds: 7));
    try {
      var dataProject = json.decode(response.body);
      reqFuncionales = dataProject;
      helper.DeleteProyecto2();
      for (int x = 0; x < reqFuncionales.length; x++) {
        var insertarPRoeycto = await helper.InsertProyecto2(reqFuncionales[x]);
        print(">>>>$insertarPRoeycto<<<<<");
      }

      print("DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD2");
      print(reqFuncionales);
      print("DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD");
      // print(reqFuncionales);
    } catch (error) {}
  }

  void getCuatro() async {
    if (avances.isEmpty) {
      Navigator.pop(context);
    }
    try {
      avances = await helper.SelectProyecto4();
      print("se obtuvo los cuatro ofline");
      print(avances);
    } catch (e) {
      print("aqui hay un error de no se que, funcion getClient en homecliente" +
          e.toString());
    }
    setState(() {});
  }

  Future<List> getAvancesProject() async {
    print("get desarrollado");
    try {
      final response = await http.post(server + "/loadInfoProject.php",
          //"http://192.168.0.5/findprogrammerDB/loadInfoProject.php",

          body: {
            "ID_PROYECTO": this.ID,
            "TYPE": "4"
          }).timeout(Duration(seconds: 7));

      print(response.body);
      var dataProject = json.decode(response.body);
      avances = dataProject;

      helper.DeleteProyecto4();
      for (int x = 0; x < avances.length; x++) {
        var insertarPRoeycto = await helper.InsertProyecto4(avances[x]);
        print(">>>>$insertarPRoeycto<<<<<");
      }

      print("DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD4");
      print(avances);
      print("DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD");
    } catch (error) {
      print("aqui hubo una excepcion getavancesproyecto en viewProjectClient");
      print(error.toString());
    }
    // print(avances);
  }

  void getCinco() async {
    if (desarrollador.isEmpty) {
      Navigator.pop(context);
    }
    try {
      desarrollador = await helper.SelectProyecto5();
      print("se obtuvo los cinco ofline");
      print(desarrollador);
    } catch (e) {
      print("aqui hay un error de no se que, funcion getClient en homecliente" +
          e.toString());
    }
    setState(() {});
  }

  Future<List> getDesarrolladorProject() async {
    try {
      final response = await http
          .post(server + "/loadInfoProject.php",
              //"http://192.168.0.5/findprogrammerDB/loadInfoProject.php",

              body: {"ID_PROYECTO": this.ID, "TYPE": "5"})
          .timeout(Duration(seconds: 7))
          .catchError((error) async {
            await print("error no se econctro el servidor");
          });

      var dataProject = json.decode(response.body);
      desarrollador = dataProject;

      helper.DeleteProyecto5();
      for (int x = 0; x < desarrollador.length; x++) {
        var insertarPRoeycto = await helper.InsertProyecto5(desarrollador[x]);
        print(">>>>$insertarPRoeycto<<<<<");
      }

      print("DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD5");
      print(desarrollador);
      print("DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD");
      print("-------------------------------------");

      print(
          "se obtuvo el desarrollodor en getdesarrolladorproyect en viewproject cliente");
      setState(() {});
    } catch (error) {
      print("aqui hubo una excepcion getDesarrollador en viewProjectClient");
      print(error.toString());
    }
  }

  Future updateState() async {
    print("entro a updatestate");
    try {
      final response = await http
          .post(server + "/updateStateProject.php",
              //"http://192.168.0.5/findprogrammerDB/loadInfoProject.php",

              body: {
                "ID_PROYECTO": this.ID,
                "ESTADO": _ligths ? "0" : "1",
              })
          .timeout(Duration(seconds: 7))
          .catchError((error) async {
            await print("error no se econcontro el servidor updatestate");
          });

      var dataProject = json.decode(response.body);

      if (dataProject == '1') {
        print("se actualizo el estado de visibilidad");
      } else {
        print("no se actualizo el estado de visiblidad");
      }
    } catch (error) {
      print("aqui hubo una excepcion getavancesproyecto en viewProjectClient");
      print(error.toString());
    }
  } //fin de la clase
}

Future editProject(ID) async {
  try {
    final response = await http.post(
        // "http://192.168.0.5/findprogrammerDB/editProject.php",
        server + "/editProject.php",
        body: {
          "ID": ID.toString(),
          "TITULO": tdcTitulo.text,
          "DESCRIPCION": tdcDescripcion.text,
          "PRESUPUESTO": tdcPresupuesto.text,
          "TIPO": intTipo.toString(),
          "TIEMPO": intFrecuencia.toString(),
          "ENTREGABLES": flat ? "1" : "0",
        }).timeout(Duration(seconds: 7));

    dataResponse = response.body;
    print("Se edito el proyecto con respuesta: ");
    print(dataResponse);
  } catch (d) {
    print("error editando el proyecto:");
    print(d.toString());
  }
}

Future eraseProject(ID) async {
  try {
    final response = await http.post(server + "/eraseProject.php", body: {
      "ID": ID.toString(),
    }).timeout(Duration(seconds: 7));

    dataResponse = response.body;
    print("menaje");
    print(dataResponse);
    print("-------------------------");
  } catch (d) {
    print("error editando el proyecto");
    print(d.toString());
  }
}

Future finishProject(ID) async {
  print(ID.toString());
  print(dataProject[0]['FK_DESARROLLADOR'].toString());
  print(comentario.text);
  print((calificacion * 2).toString());
  print(client['ID_USUARIO'].toString());

  try {
    final response = await http.post(server + "/finishProjectC.php", body: {
      "ID": ID.toString(),
      "DESARROLLADOR": dataProject[0]['FK_DESARROLLADOR'].toString(),
      "COMENTARIO": comentario.text,
      "CALIFICACION": (calificacion * 2).toString(),
      "CLIENTE": client['ID_USUARIO'].toString(),
    }).timeout(Duration(seconds: 7));

    dataResponse = response.body;
    print("Se finalizo el proyecto con respuesta: ");
    print(dataResponse);
    finish = dataResponse;
  } catch (d) {
    print("error finalizando el proyecto:");
    print(d.toString());
  }
}

Future undoFinishProject(ID) async {
  try {
    final response = await http.post(server + "/undoFinishProjectC.php", body: {
      "ID": ID.toString(),
    }).timeout(Duration(seconds: 7));

    dataResponse = response.body;
    print("Se deshizo finalizar el proyecto con respuesta: ");
    print(dataResponse);
  } catch (d) {
    print("error deshaciendo finalizar el proyecto:");
    print(d.toString());
  }
}

Future createReport(context) async {
  print(client['ID_USUARIO'].toString());
  print(desarrollador[0]['ID_USUARIO'].toString());
  print(reporte.text);

  try {
    final response = await http.post(server + "/createReport.php", body: {
      "REMITENTE": client['ID_USUARIO'].toString(),
      "DESTINATARIO": desarrollador[0]['ID_USUARIO'].toString(),
      "REPORTE": reporte.text,
    }).timeout(Duration(seconds: 7));

    print("Se creo el reporte con respuesta: ");
    print(response.body);
    if (response.body == "1") {
      Navigator.pop(context);
      showDialog(
          context: contextoS,
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
                    Text("FindProgrammer",
                        style: TextStyle(color: Colors.black, fontSize: 20)),
                  ],
                ),
                content: Text("El reporte se hizo correctamente."),
                actions: <Widget>[
                  FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Aceptar",
                        style: TextStyle(color: Colors.black, fontSize: 15)),
                  ),
                ],
              ));
    } else if (response.body == "4") {
      Navigator.pop(context);
      showDialog(
          context: contextoS,
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
                    Text("FindProgrammer",
                        style: TextStyle(color: Colors.black, fontSize: 20)),
                  ],
                ),
                content: Text("Ya habías realizado un reporte a este usuario."),
                actions: <Widget>[
                  FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Aceptar",
                        style: TextStyle(color: Colors.black, fontSize: 15)),
                  ),
                ],
              ));
    }
  } catch (d) {
    print("error creando el reporte");
    print(d.toString());
  }
}

Future abandonar(ID) async {
  print("se entro a la funcion abandonar");

  var cliente = http.Client();
  try {
    final response = await cliente
        .post(server + "/abandonarC.php", body: {
          "ID_USUARIO": client['ID_USUARIO'].toString(),
          "PROYECTO": ID.toString(),
          "RAZON": razon.text,
        })
        .timeout(Duration(seconds: 7))
        .whenComplete(() {
          print("Se termino la funcion de abandonar proyecto");
        });

    responseA = response.body;
  } catch (d) {
    print("error abanodonando el prouecto");
    print(d.toString());
  } finally {
    cliente.close();
  }
}

Future confirmar(ID) async {
  print("se entro a la funcion abandonar");

  var cliente = http.Client();
  try {
    final response = await cliente
        .post(server + "/confirmarD.php", body: {
          "PROYECTO": ID.toString(),
        })
        .timeout(Duration(seconds: 7))
        .whenComplete(() {
          print("Se termino la ocnfirmacion");
        });

    responseA = response.body;
  } catch (d) {
    print("error en la confimacion");
    print(d.toString());
  } finally {
    cliente.close();
  }
}

void getSeis() async {
  try {
    visitas = await helper.SelectProyecto6();
    print("se obtuvo los seis ofline");
    print(visitas);
  } catch (e) {
    print("aqui hay un error de no se que, funcion getClient en homecliente" +
        e.toString());
  }
}

Future getVisits(ID) async {
  try {
    final response = await http.post(server + "/getVisits.php", body: {
      "ID": ID.toString(),
    }).timeout(Duration(seconds: 7));
    visitas = null;
    visitas = json.decode(response.body);

    helper.DeleteProyecto6();
    for (int x = 0; x < visitas.length; x++) {
      var insertarPRoeycto = await helper.InsertProyecto6(visitas[x]);
      print(">>>>$insertarPRoeycto<<<<<");
    }

    print("-------------------------");
    print(visitas);
    print(visitas.length);
  } catch (d) {
    print("error editando el proyecto");
    print(d.toString());
  }
}
