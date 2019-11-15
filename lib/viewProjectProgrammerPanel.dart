import 'package:findprogrammer/chatProgrammer.dart';
import 'package:findprogrammer/createAdvance.dart';
import 'package:findprogrammer/profileProgrammer.dart';
import 'package:findprogrammer/viewAvailableProjects.dart';

import 'package:findprogrammer/viewCreateReq.dart';
import 'package:findprogrammer/viewDevelopmentProjectsProgrammer.dart';
import 'package:findprogrammer/viewFinishProjectsProgrammer.dart';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'componentes/helperNotifications.dart';
import 'componentes/helperSQFLITE.dart';
import 'componentes/variables.dart';
import 'customIcons.dart';
import 'package:async/async.dart';
import 'homeProgrammer.dart';
import 'package:flutter/cupertino.dart';
import 'package:groovin_material_icons/groovin_material_icons.dart';

import 'login.dart';

const IconData menu = IconData(0xe900, fontFamily: "CustomIcons");

var contextoS;

var listReqF = List<Widget>();
var listAvances = List<Widget>();
var dataResponse;
var finish;

var dataProjectw, reqFuncionales, avances, cliente;
TextEditingController reporte = TextEditingController();
TextEditingController comentario = new TextEditingController();
TextEditingController razon = new TextEditingController();
var calificacion;
var responseA;
Helper helper = new Helper();
var IDout;

class ViewProjectProgrammerPanel extends StatefulWidget {
  var ID;
  ViewProjectProgrammerPanel(this.ID);
  @override
  _ViewProjectProgrammerPanel createState() =>
      new _ViewProjectProgrammerPanel(ID);
}

class _ViewProjectProgrammerPanel extends State<ViewProjectProgrammerPanel> {
  var ID;
  final notification = FlutterLocalNotificationsPlugin();

  _ViewProjectProgrammerPanel(this.ID);
  @override
  void initState() {
    final settingAndroid =
        AndroidInitializationSettings('ic_launcher_background');
    final settingIos = IOSInitializationSettings(
        onDidReceiveLocalNotification: (id, title, body, payload) =>
            onSelectNotification(payload));
    notification.initialize(InitializationSettings(settingAndroid, settingIos),
        onSelectNotification: onSelectNotification);
        
      

    funciones();
    // TODO: implement initState
    super.initState();
  }

  Future onSelectNotification(payload) async {}
  @override
  Widget build(BuildContext context) {
    IDout = ID;
    contextoS = context;

    var _scaffoldKey = new GlobalKey<ScaffoldState>();

    listReqF = new List<Widget>();
    listAvances = new List<Widget>();
    if (avances != null) {
      for (int z = 0; z < avances.length; z++) {
        listAvances.add(Padding(
          padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
          child: Text("_______________________________________",
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
      if (dataProjectw[0]['F_A_CORRECION_REQ_C'] == "1") {
        listReqF.add(Padding(
          padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
          child: Text("Estado: No aceptados",
              style: TextStyle(fontSize: 14.0, color: Colors.white)),
        ));
        listReqF.add(Padding(
          padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
          child: Text(
              "Observaciones: " + dataProjectw[0]['OBSERVACIONES'].toString(),
              style: TextStyle(fontSize: 14.0, color: Colors.white)),
        ));

        listReqF.add(Padding(
          padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
          child: Text("____________________________",
              style: TextStyle(fontSize: 14.0, color: Colors.white)),
        ));
      }
      for (int x = 0; x < reqFuncionales.length; x++) {
        listReqF.add(Padding(
          padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
          child: Text(reqFuncionales[x]["REQUERIMIENTO"].toString(),
              style: TextStyle(fontSize: 14.0, color: Colors.white)),
        ));
      }
    }

    return RefreshIndicator(
      onRefresh: () async {
        await funciones();
        await Future.delayed(Duration(milliseconds: 500));
        setState(() {});
      },
      child: Scaffold(
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
                    Navigator.pop(contextoS);
                    Navigator.push(
                        contextoS,
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
                                          image: NetworkImage(server +
                                              "/images/image_" +
                                              desarrollador['ID_USUARIO']
                                                  .toString() +
                                              ".jpg"))),
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
                    if (!statusRed) {
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
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 20)),
                                  ],
                                ),
                                content: Text(
                                    "No hay conexión a internet, intenta más tarde"),
                                actions: <Widget>[
                                  FlatButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text("Aceptar",
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 15)),
                                  ),
                                ],
                              ));
                      return;
                    }
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomeProgrammer()));
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
                                      GroovinMaterialIcons.flash_circle,
                                      size: 35,
                                      color: Colors.deepPurpleAccent,
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
                    if (!statusRed) {
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
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 20)),
                                  ],
                                ),
                                content: Text(
                                    "No hay conexión a internet, intenta más tarde"),
                                actions: <Widget>[
                                  FlatButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text("Aceptar",
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 15)),
                                  ),
                                ],
                              ));
                      return;
                    }
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ViewFinishProjectsProgrammer()));
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
                            builder: (context) =>
                                ViewDevelopmentProjectsProgrammer()));
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
                    if (!statusRed) {
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
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 20)),
                                  ],
                                ),
                                content: Text(
                                    "No hay conexión a internet, intenta más tarde"),
                                actions: <Widget>[
                                  FlatButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text("Aceptar",
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 15)),
                                  ),
                                ],
                              ));
                      return;
                    }
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ViewAvailableProjects()));
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
if (!statusRed) {
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
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20)),
                                      ],
                                    ),
                                    content: Text(
                                        "No hay conexión a internet, intenta más tarde"),
                                    actions: <Widget>[
                                      FlatButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("Aceptar",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15)),
                                      ),
                                    ],
                                  ));
                          return;
                        }
                        if (sistemaBloqueado) {
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
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20)),
                                      ],
                                    ),
                                    content: Text("Sistema bloqueado :c"),
                                    actions: <Widget>[
                                      FlatButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("Aceptar",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15)),
                                      ),
                                    ],
                                  ));
                        } else {
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
                                        Text("Código de Proyecto",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20)),
                                      ],
                                    ),
                                    content: Column(
                                      children: <Widget>[
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Container(
                                          child: CupertinoTextField(
                                            controller: tecCodigo,
                                            placeholder:
                                                "Código de proyecto...",
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
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                      ],
                                    ),
                                    actions: <Widget>[
                                      FlatButton(
                                        onPressed: () async {
                                          await createPanel2(context);
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
                        }
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
                                      GroovinMaterialIcons.keyboard,
                                      size: 35,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(9),
                                  child: Text(
                                    "Ingresar Código",
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
                                  Text("Cerrar Sesión",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 20)),
                                ],
                              ),
                              content:
                                  Text("¿Seguro que quieres cerrar sesión?"),
                              actions: <Widget>[
                                FlatButton(
                                  onPressed: () async{
                                 await helper.DeleteComents();
                                  await helper.DeleteDesarrollador();
                                  await helper.DeleteProyecto1();
                                  await helper.DeleteProyecto2();
                                  await helper.DeleteProyecto6();
                                  await helper.DeleteProyecto4();
                                  await helper.DeleteProyecto5();
                                  await helper.DeleteProyectoInfo();

                                  await helper.DeleteCliente();
                                  Navigator.pop(context);
                                  await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Login()));
                                },
                                  child: Text("Cerrar Sesión",
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
                                    "  ",
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
          ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
          body: dataProjectw != null &&
                  listReqF != null &&
                  listAvances != null &&
                  cliente != null
              ? Container(
                  height: MediaQuery.of(context).size.height,
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
                        height: (MediaQuery.of(context).size.height / 2) + 50,
                        decoration: BoxDecoration(
                            color: Colors.deepPurpleAccent,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(30),
                                bottomRight: Radius.circular(30))),
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              dataProjectw[0]['TITULO'],
                              style: TextStyle(
                                  fontSize: 25.0, color: Colors.white),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "por: " +
                                  utf8
                                      .decode(
                                          base64.decode(cliente[0]['nombre']))
                                      .toString() +
                                  " " +
                                  utf8
                                      .decode(base64
                                          .decode(cliente[0]['apellido_p']))
                                      .toString() +
                                  " " +
                                  utf8
                                      .decode(base64
                                          .decode(cliente[0]['apellido_m']))
                                      .toString(), //aqui añadir cliente
                              style: TextStyle(
                                  fontSize: 18.0, color: Colors.white),
                            ),
                            Container(
                              width:
                                  (MediaQuery.of(context).size.width / 4) * 3,
                              height: 90,
                              child: ListView(
                                children: <Widget>[
                                  Text(
                                    dataProjectw[0]['DESCRIPCION'],
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                        fontSize: 14.0, color: Colors.white),
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
                                      InkWell(
                                        onTap: () {if (dataProjectw[0]['F_TERMINADO'] ==
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
                                                          Text("FindProgramemr",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize:
                                                                      20)),
                                                        ],
                                                      ),
                                                      content: Text(
                                                          "El proyecto ya fue finalizado!!!"),
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
                                                          "No hay conexión a internet, intenta más tarde"),
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
                                                      CreateAvance(this.ID)));
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              20, 10, 20, 10),
                                          child: Column(
                                            children: <Widget>[
                                              Icon(
                                                GroovinMaterialIcons.package_up,
                                                color: Colors.white,
                                                size: 30,
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                "Enviar Avance",
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
                                          if (dataProjectw[0]['F_TERMINADO'] ==
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
                                                          Text("FindProgrammer",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize:
                                                                      20)),
                                                        ],
                                                      ),
                                                      content: Text(
                                                          "El proyecto ya fue finalizado!!!"),
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
                                                          "No hay conexión a internet, intenta más tarde"),
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
                                                      ChatProgrammer(
                                                          dataProjectw[0]
                                                              ['ID_PROYECTO'],
                                                          desarrollador[
                                                              'ID_USUARIO'],
                                                          dataProjectw[0]
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
                                                "  Contactar\n    Cliente",
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
                                          if (dataProjectw[0]['F_TERMINADO'] ==
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
                                                          Text("FindProgrammer",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize:
                                                                      20)),
                                                        ],
                                                      ),
                                                      content: Text(
                                                          "El proyecto ya fue finalizado!!!"),
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
                                                          "No hay conexión a internet, intenta más tarde"),
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
                                          if (dataProjectw[0]['F_REQ_F'] ==
                                              "0") {
                                            Navigator.push(
                                                context,
                                                CupertinoPageRoute(
                                                    builder: (context) =>
                                                        ViewCreateReq(ID)));
                                          } else {
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
                                                          Text("Requerimientos",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize:
                                                                      20)),
                                                        ],
                                                      ),
                                                      content: Text(
                                                          "Los requermientos ya fueron creados!!!"),
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
                                          }
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              20, 10, 20, 10),
                                          child: Column(
                                            children: <Widget>[
                                              Icon(
                                                GroovinMaterialIcons
                                                    .tooltip_outline,
                                                color: Colors.white,
                                                size: 30,
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                "Requerimientos",
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
                                          if (dataProjectw[0]['F_TERMINADO'] ==
                                              "1") {
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
                                                          "El proyecto ya fue finalizado!!!"),
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
                                                          "No hay conexión a internet, intenta más tarde"),
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
                                                                "Abandnar proyecto",
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
                                                                              content: Text("Abandonaste este proyecto con exito cuando el cliente sea notificado el proyecto desaparecerá de tus proyectos en desarrollo."),
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
                                          if (dataProjectw[0]['F_TERMINADO'] ==
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
                                                          Text("FindProgrammer",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize:
                                                                      20)),
                                                        ],
                                                      ),
                                                      content: Text(
                                                          "El proyecto ya fue finalizado!!!"),
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
                                                          "No hay conexión a internet, intenta más tarde"),
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
                                                        Text("Reportar cliente",
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
                                                              "El cliente...",
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
                                                "  Reportar \n  Cliente",
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
                                          if (dataProjectw[0]['F_TERMINADO'] ==
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
                                                          Text("FindProgramemr",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize:
                                                                      20)),
                                                        ],
                                                      ),
                                                      content: Text(
                                                          "El proyecto ya fue finalizado!!!"),
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
                                                          "No hay conexión a internet, intenta más tarde"),
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
                                          if (dataProjectw[0]['F_TERMINADO'] ==
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
                                          if (dataProjectw[0]
                                                  ['F_TERMINADO_D'] ==
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
                      //////////////////////////////////////////
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
                                  Column(children: listReqF),
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
                                  dataProjectw[0]['INTERVALO_DE_AVANCES'] == "0"
                                      ? Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(15, 5, 0, 0),
                                          child: Text(
                                              "-Se requieren Avances 'cada 15 dias'.",
                                              style: TextStyle(
                                                  fontSize: 14.0,
                                                  color: Colors.white)),
                                        )
                                      : dataProjectw[0]
                                                  ['INTERVALO_DE_AVANCES'] ==
                                              "1"
                                          ? Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  15, 5, 0, 0),
                                              child: Text(
                                                  "-Se requieren Avances 'cada 20 dias' .",
                                                  style: TextStyle(
                                                      fontSize: 14.0,
                                                      color: Colors.white)),
                                            )
                                          : Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  15, 5, 0, 0),
                                              child: Text(
                                                  "-Se requieren Avances 'cada 30 dias' .",
                                                  style: TextStyle(
                                                      fontSize: 14.0,
                                                      color: Colors.white)),
                                            ),
                                  dataProjectw[0]['F_S_ENTREGABLES'] == "1"
                                      ? Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(15, 5, 0, 0),
                                          child: Text(
                                              "-Se requieren Entregables.",
                                              style: TextStyle(
                                                  fontSize: 14.0,
                                                  color: Colors.white)),
                                        )
                                      : Container(),
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
                                      child: dataProjectw[0]["F_TIPO_DE_PROYECTO"] == "0"
                                          ? Text("Aplicación Movil Android",
                                              style: TextStyle(
                                                  fontSize: 14.0,
                                                  color: Colors.white))
                                          : dataProjectw[0]["F_TIPO_DE_PROYECTO"] == "1"
                                              ? Text("Aplicación Movil IOS",
                                                  style: TextStyle(
                                                      fontSize: 14.0,
                                                      color: Colors.white))
                                              : dataProjectw[0]["F_TIPO_DE_PROYECTO"] == "2"
                                                  ? Text("Aplicación Escritorio Windows",
                                                      style: TextStyle(
                                                          fontSize: 14.0,
                                                          color: Colors.white))
                                                  : dataProjectw[0]["F_TIPO_DE_PROYECTO"] == "3"
                                                      ? Text("Aplicación Escritorio MAC OS",
                                                          style: TextStyle(
                                                              fontSize: 14.0,
                                                              color:
                                                                  Colors.white))
                                                      : dataProjectw[0]["F_TIPO_DE_PROYECTO"] == "4"
                                                          ? Text("Aplicación Web",
                                                              style: TextStyle(fontSize: 14.0, color: Colors.white))
                                                          : dataProjectw[0]["F_TIPO_DE_PROYECTO"] == "5" ? Text("Proyecto de Redes", style: TextStyle(fontSize: 14.0, color: Colors.white)) : Text("ERROR", style: TextStyle(fontSize: 14.0, color: Colors.white))),
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
                                    child: Text("Avances Entregados",
                                        style: TextStyle(
                                            fontSize: 27.0,
                                            color: Colors.white)),
                                  ),
                                  Column(children: listAvances),
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
                      height: MediaQuery.of(context).size.height,
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
                            height:
                                (MediaQuery.of(context).size.height / 2) + 50,
                            decoration: BoxDecoration(
                                color: Colors.deepPurpleAccent,
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(30),
                                    bottomRight: Radius.circular(30))),
                            child: Column(
                              children: <Widget>[
                                SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                      child: IconButton(
                                          onPressed: () {
                                            _scaffoldKey.currentState
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
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "________",
                                  style: TextStyle(
                                      fontSize: 25.0, color: Colors.white),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "________",
                                  style: TextStyle(
                                      fontSize: 18.0, color: Colors.white),
                                ),
                                Container(
                                  width:
                                      (MediaQuery.of(context).size.width / 4) *
                                          3,
                                  height: 90,
                                  child: ListView(
                                    children: <Widget>[
                                      Text(
                                        "________",
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
                                                      .package_up,
                                                  color: Colors.white,
                                                  size: 30,
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  "______",
                                                  style: TextStyle(
                                                      fontSize: 14.0,
                                                      color: Colors.white),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
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
                                                  "_____",
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
                                                      .tooltip_outline,
                                                  color: Colors.white,
                                                  size: 30,
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  "________",
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
                                                  "_____",
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
                                                  "______",
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
                                                  "_______",
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
                                                      .check_circle,
                                                  color: Colors.white,
                                                  size: 30,
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  "____",
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
                                            EdgeInsets.fromLTRB(10, 17, 0, 0),
                                        child: Text("Requerimientos",
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
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(15, 5, 0, 0),
                                        child: Text("______________",
                                            style: TextStyle(
                                                fontSize: 14.0,
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
                                        child: Text("Avances",
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
                                        child: Text("Tipo de Proyecto:",
                                            style: TextStyle(
                                                fontSize: 27.0,
                                                color: Colors.white)),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(10, 0, 0, 0),
                                        child: Text("__________",
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
                                        child: Text("Avances Entregados",
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
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(15, 5, 0, 0),
                                        child: Text("______________",
                                            style: TextStyle(
                                                fontSize: 14.0,
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
                    //inicio del cnter
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
      dataProjectw = await helper.SelectProyecto1();
      if (dataProjectw.isEmpty) {
        Navigator.pop(context);
      }
      print("se obtuvo los uno ofline");
      print(dataProjectw);
    } catch (e) {
      print("aqui hay un error de no se que, funcion getClient en homecliente" +
          e.toString());
    }
    setState(() {});
  }

  Future getInfooProject() async {
    var cliente1 = http.Client();
    try {
      final response = await cliente1.post(server + "/loadInfoProject.php",
          //"http://192.168.0.5/findprogrammerDB/loadInfoProject.php",

          body: {
            "ID_PROYECTO": this.ID,
            "TYPE": "1"
          }).timeout(Duration(seconds: 7));
      print("si hizo ");
      var dataProject1 = json.decode(response.body);
      dataProjectw = dataProject1;
      helper.DeleteProyecto1();
      for (int x = 0; x < dataProjectw.length; x++) {
        var insertarPRoeycto = await helper.InsertProyecto1(dataProjectw[x]);
        print(">>>>$insertarPRoeycto<<<<<");
      }
      print(
          "Se obtuvo info de proyecto en getInfoPryect en viewproyectProgrammerPanel ");
      print("FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF");
      print(dataProjectw);

      if (dataProjectw[0]['F_ABANDONO_C'] == "1") {
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
                          dataProjectw[0]['OBSERVACIONESABANDONO'].toString()),
                  actions: <Widget>[
                    FlatButton(
                      onPressed: () {
                        confirmar(ID);
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => HomeProgrammer()));
                      },
                      child: Text("Aceptar",
                          style: TextStyle(color: Colors.black, fontSize: 15)),
                    ),
                  ],
                ));

        return;
      }

      String fechaReporte = dataProjectw[0]['NEXT_ADVANCE'];
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
   
      }
      if (difference <= 0) {
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
                  content: Text("Debes entregar un reporte hoy!!!!"),
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

      if (dataProjectw[0]['F_A_CORRECION_REQ_C'] == "1") {
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
                      "El cliente solicitó una nueva versión de los requerimientos \nObservaciones: \n" +
                          dataProjectw[0]['OBSERVACIONES'] +
                          ""),
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
      if (dataProjectw[0]['F_AVANCE_A'] == "1") {
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
                      "El cliente solicitó una nueva versión del avance \nObservaciones: \n" +
                          dataProjectw[0]['OBSERVACIONESA'] +
                          ""),
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

      // print(this.dataProject);
    } catch (f) {
      print("FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF");
      print(
          "error obteniendo info de proyecto en getInfoPryect en viewproyectProgrammerPanel ");
      print(f.toString());
    } finally {
      setState(() {});
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

  Future<List> getReqFProject() async {
    print("entro");
    var cliente1 = http.Client();
    try {
      var response = await cliente1.post(
          //"http://192.168.0.5/findprogrammerDB/loadInfoProject.php",
          server + "/loadInfoProject.php",
          body: {
            "ID_PROYECTO": this.ID,
            "TYPE": "2"
          }).timeout(Duration(seconds: 7));

      var dataProject = json.decode(response.body);
      reqFuncionales = dataProject;
      helper.DeleteProyecto2();
      for (int x = 0; x < reqFuncionales.length; x++) {
        var insertarPRoeycto = await helper.InsertProyecto2(reqFuncionales[x]);
        print(">>>>$insertarPRoeycto<<<<<");
      }

      print(
          "se obtuvieron los requerimientos en getReqFPryect en viewproyectProgrammerPanel");
    } catch (error) {
      print(
          "error obteniendo reqf  en getReqFPryect en viewproyectProgrammerPanel ");
    } finally {
      setState(() {});
      cliente1.close();
    }
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
    var cliente1 = http.Client();
    try {
      final response = await cliente1.post(server + "/loadInfoProject.php",
          //"http://192.168.0.5/findprogrammerDB/loadInfoProject.php",

          body: {
            "ID_PROYECTO": this.ID,
            "TYPE": "4"
          }).timeout(Duration(seconds: 7));

      var dataProject = json.decode(response.body);
      avances = dataProject;

      helper.DeleteProyecto4();
      for (int x = 0; x < avances.length; x++) {
        var insertarPRoeycto = await helper.InsertProyecto4(avances[x]);
        print(">>>>$insertarPRoeycto<<<<<");
      }
      print(
          "Se obtuvieron los avances en getAvancesProject en viewProjectProgrammerPanel");
    } catch (error) {
      print("aqui hubo una excepcion getavancesproyecto en viewProjectClient");
      print(error.toString());
    } finally {
      setState(() {});
      cliente1.close();
    }
  }

  void getCinco() async {
    if (desarrollador.isEmpty) {
      Navigator.pop(context);
    }
    try {
      cliente = await helper.SelectProyecto5();
      print("se obtuvo los cinco ofline");
      print(cliente);
    } catch (e) {
      print("aqui hay un error de no se que, funcion getClient en homecliente" +
          e.toString());
    }
    setState(() {});
  }

  Future<List> getClientProject() async {
    var cliente1 = http.Client();
    try {
      final response = await cliente1
          .post(server + "/loadInfoProject.php",
              //"http://192.168.0.5/findprogrammerDB/loadInfoProject.php",

              body: {"ID_PROYECTO": this.ID, "TYPE": "6"})
          .timeout(Duration(seconds: 7))
          .catchError((error) async {
            print("error en getclientePRoject en viewProjectPRogrammerpanel");
          })
          .timeout(Duration(seconds: 7));

      var dataProject = json.decode(response.body);
      cliente = dataProject;
      helper.DeleteProyecto5();
      for (int x = 0; x < cliente.length; x++) {
        var insertarPRoeycto = await helper.InsertProyecto5(cliente[x]);
        print(">>>>$insertarPRoeycto<<<<<");
      }
      print("Se obtuvo el cliente del proyecto");
      print(cliente);
    } catch (error) {
      print("aqui hubo una excepcion gecliente en viewProjectProgrammerpanel");
      print(error.toString());
    } finally {
      setState(() {});
      cliente1.close();
    }
  }

  Future<void> funciones() async {
    if (statusRed) {
      await getClientProject();
      await getInfooProject();
      await getReqFProject();
      await getAvancesProject();
    } else {
      getUno();
      getDos();
      getCuatro();
      getCinco();
    }

    setState(() {});
  }
}

//fin de clase normal
Future finishProject(ID) async {
  print(ID.toString());
  print(dataProjectw[0]['FK_DESARROLLADOR'].toString());
  print(comentario.text);
  print(calificacion.toString());
  print(desarrollador['ID_USUARIO'].toString());

  try {
    final response = await http.post(server + "/finishProjectD.php", body: {
      "ID": ID.toString(),
      "DESARROLLADOR": desarrollador['ID_USUARIO'].toString(),
      "COMENTARIO": comentario.text,
      "CALIFICACION": calificacion.toString(),
      "CLIENTE": dataProjectw[0]['FK_CLIENTE'].toString(),
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
  print(desarrollador['ID_USUARIO'].toString());
  print(dataProjectw[0]['FK_CLIENTE'].toString());
  print(reporte.text);

  try {
    final response = await http.post(server + "/createReport.php", body: {
      "REMITENTE": desarrollador['ID_USUARIO'].toString(),
      "DESTINATARIO": dataProjectw[0]['FK_CLIENTE'].toString(),
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
        .post(server + "/abandonarD.php", body: {
          "ID_USUARIO": desarrollador['ID_USUARIO'].toString(),
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
