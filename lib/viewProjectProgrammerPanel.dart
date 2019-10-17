import 'package:findprogrammer/chatProgrammer.dart';
import 'package:findprogrammer/createAdvance.dart';
import 'package:findprogrammer/profileProgrammer.dart';
import 'package:findprogrammer/viewAvailableProjects.dart';
import 'package:findprogrammer/viewDevelopmentProjectsProgrammer.dart';
import 'package:findprogrammer/viewFinishProjectsProgrammer.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
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
var serverResponse;
var dataProjectw, reqFuncionales, avances, cliente;
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

  _ViewProjectProgrammerPanel(this.ID);
@override
  void initState() {
      funciones();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    IDout = ID;
    contextoS = context;
    final AsyncMemoizer _asyncMemoizer4 = AsyncMemoizer();
    var _scaffoldKey = new GlobalKey<ScaffoldState>();

 listReqF = new List<Widget>();
              listAvances = new List<Widget>();
              if (avances != null) {
                for (int z = 0; z < avances.length; z++) {
                   listAvances.add(Padding(
                    padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
                    child: Text(
                        "_______________________________________",
                        style: TextStyle(fontSize: 14.0, color: Colors.white)),
                  ));
                  listAvances.add(Padding(
                    padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
                    child: Text(
                        "Tiempo trabajado: " + avances[z]["TIEMPO_TRABAJO"],
                        style: TextStyle(fontSize: 14.0, color: Colors.white)),
                  ));

                  listAvances.add(Padding(
                    padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
                    child: Text(
                        "Fecha de entrega: " + avances[z]["FECHA_ENTREGA"],
                        style: TextStyle(fontSize: 14.0, color: Colors.white)),
                  ));
                  listAvances.add(Padding(
                    padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
                    child: Text("Decripcion: " + avances[z]["DESCRIPCION"],
                        style: TextStyle(fontSize: 14.0, color: Colors.white)),
                  ));
                  listAvances.add(Padding(
                    padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
                    child: Text(
                        "Porcentaje del proyecto: " + avances[z]["PORCENTAJE"],
                        style: TextStyle(fontSize: 14.0, color: Colors.white)),
                  ));

                  listAvances.add(Padding(
                    padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
                    child: Text("Observaciones: " + avances[z]["OBSERVACIONES"],
                        style: TextStyle(fontSize: 14.0, color: Colors.white)),
                  ));

                  listAvances.add(Padding(
                    padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
                    child: Text("No. de cambios: " + avances[z]["No_CAMBIOS"],
                        style: TextStyle(fontSize: 14.0, color: Colors.white)),
                  ));
                }
              }

              if (reqFuncionales != null) {
                for (int x = 0; x < reqFuncionales.length; x++) {
                  listReqF.add(Padding(
                    padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
                    child: Text(reqFuncionales[x]["REQUERIMIENTO"].toString(),
                        style: TextStyle(fontSize: 14.0, color: Colors.white)),
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
                                        image: NetworkImage(
                                            "https://findprogrammerceti.000webhostapp.com/images/image_" +
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
                                          fontSize: 15.0, color: Colors.white),
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
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            width: 0.5,
                                            color: Colors.deepPurpleAccent)),
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
                            content: Text("¿Seguro que quieres cerrar sesion?"),
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
              ),
            ],
          ),
        ),
        appBar: null,
        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.white,
        ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        body:dataProjectw!=null? Container(
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
                            style:
                                TextStyle(fontSize: 25.0, color: Colors.white),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "por: " +
                                cliente[0]['nombre'].toString() +
                                " " +
                                cliente[0]['apellido_p'].toString() +
                                " " +
                                cliente[0]['apellido_m']
                                    .toString(), //aqui añadir cliente
                            style:
                                TextStyle(fontSize: 18.0, color: Colors.white),
                          ),
                          Container(
                            width: (MediaQuery.of(context).size.width / 4) * 3,
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
                                      onTap: (){
                                        Navigator.push(context, CupertinoPageRoute(builder: (context)=>CreateAvance(this.ID)));

                                      },
                                      child: Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(20, 10, 20, 10),
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
                                        Navigator.push(
                                            context,
                                            CupertinoPageRoute(
                                                builder: (context) =>
                                                    ChatProgrammer(
                                                        dataProjectw[0]
                                                            ['ID_PROYECTO'],
                                                        desarrollador[
                                                            'ID_USUARIO'])));
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
                                      onTap: () {},
                                      child: Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(20, 10, 20, 10),
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
                                      onTap: () {},
                                      child: Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(20, 10, 20, 10),
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
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(20, 10, 20, 10),
                                        child: Column(
                                          children: <Widget>[
                                            Icon(
                                              GroovinMaterialIcons.heart_broken,
                                              color: Colors.white,
                                              size: 30,
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "  Reportar \n   Cliente",
                                              style: TextStyle(
                                                  fontSize: 14.0,
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(20, 10, 20, 10),
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
                                          fontSize: 27.0, color: Colors.white)),
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
                                          fontSize: 27.0, color: Colors.white)),
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
                                    : dataProjectw[0]['INTERVALO_DE_AVANCES'] ==
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
                                          fontSize: 27.0, color: Colors.white)),
                                ),
                                Padding(
                                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                    child: dataProjectw[0]["F_TIPO_DE_PROYECTO"] == "0"
                                        ? Text("Aplicación Web",
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                color: Colors.white))
                                        : dataProjectw[0]["F_TIPO_DE_PROYECTO"] == "1"
                                            ? Text("Aplicación Movil Android",
                                                style: TextStyle(
                                                    fontSize: 14.0,
                                                    color: Colors.white))
                                            : dataProjectw[0]["F_TIPO_DE_PROYECTO"] == "2"
                                                ? Text("Aplicación Movil IOS",
                                                    style: TextStyle(
                                                        fontSize: 14.0,
                                                        color: Colors.white))
                                                : dataProjectw[0]["F_TIPO_DE_PROYECTO"] == "3"
                                                    ? Text("Aplicación Escritorio Windows",
                                                        style: TextStyle(
                                                            fontSize: 14.0,
                                                            color:
                                                                Colors.white))
                                                    : dataProjectw[0]["F_TIPO_DE_PROYECTO"] == "4"
                                                        ? Text(
                                                            "Aplicación Escritorio MAC",
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
                                          fontSize: 27.0, color: Colors.white)),
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
              ):Stack(
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
                                    (MediaQuery.of(context).size.width / 4) * 3,
                                height: 90,
                                child: ListView(
                                  children: <Widget>[
                                    Text(
                                      "________",
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Padding(
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
                                      padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
                                      child: Text("______________",
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              color: Colors.white)),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
                                      child: Text("______________",
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              color: Colors.white)),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
                                      child: Text("______________",
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              color: Colors.white)),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
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
                                      padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
                                      child: Text("______________",
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              color: Colors.white)),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
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
                                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                      child: Text("Tipo de Proyecto:",
                                          style: TextStyle(
                                              fontSize: 27.0,
                                              color: Colors.white)),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
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
                                      padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
                                      child: Text("______________",
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              color: Colors.white)),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
                                      child: Text("______________",
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              color: Colors.white)),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
                                      child: Text("______________",
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              color: Colors.white)),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
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
              )
          
        );
        
  }

  Future getInfooProject() async {
    var cliente1 = http.Client();
    try {
      final response = await cliente1.post(
          "https://findprogrammerceti.000webhostapp.com/loadInfoProject.php",
          //"http://192.168.0.5/findprogrammerDB/loadInfoProject.php",

          body: {"ID_PROYECTO": this.ID, "TYPE": "1"});
      print("si hizo ");
      var dataProject1 = json.decode(response.body);
      dataProjectw = dataProject1;
      print(
          "Se obtuvo info de proyecto en getInfoPryect en viewproyectProgrammerPanel ");
      print("FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF");
      print(dataProjectw);
      // print(this.dataProject);
    } catch (f) {
      print("FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF");
      print(
          "error obteniendo info de proyecto en getInfoPryect en viewproyectProgrammerPanel ");
      print(f.toString());
    } finally {
       setState(() {
        
      });
      cliente1.close();
    }
  }

  Future<List> getReqFProject() async {
    print("entro");
    var cliente1 = http.Client();
    try {
      var response = await cliente1.post(
          //"http://192.168.0.5/findprogrammerDB/loadInfoProject.php",
          "https://findprogrammerceti.000webhostapp.com/loadInfoProject.php",
          body: {"ID_PROYECTO": this.ID, "TYPE": "2"});

      var dataProject = json.decode(response.body);
      reqFuncionales = dataProject;

      print(
          "se obtuvieron los requerimientos en getReqFPryect en viewproyectProgrammerPanel");
    } catch (error) {
      print(
          "error obteniendo reqf  en getReqFPryect en viewproyectProgrammerPanel ");
    } finally {
       setState(() {
        
      });
      cliente1.close();
    }
  }

  Future<List> getAvancesProject() async {
    var cliente1 = http.Client();
    try {
      final response = await cliente1.post(
          "https://findprogrammerceti.000webhostapp.com/loadInfoProject.php",
          //"http://192.168.0.5/findprogrammerDB/loadInfoProject.php",

          body: {"ID_PROYECTO": this.ID, "TYPE": "4"});

      var dataProject = json.decode(response.body);
      avances = dataProject;
      print(
          "Se obtuvieron los avances en getAvancesProject en viewProjectProgrammerPanel");
    } catch (error) {
      print("aqui hubo una excepcion getavancesproyecto en viewProjectClient");
      print(error.toString());
    } finally {
       setState(() {
        
      });
      cliente1.close();
    }
  }

  Future<List> getClientProject() async {
    var cliente1 = http.Client();
    try {
      final response = await cliente1.post(
          "https://findprogrammerceti.000webhostapp.com/loadInfoProject.php",
          //"http://192.168.0.5/findprogrammerDB/loadInfoProject.php",

          body: {
            "ID_PROYECTO": this.ID,
            "TYPE": "6"
          }).catchError((error) async {
        print("error en getclientePRoject en viewProjectPRogrammerpanel");
      });

      var dataProject = json.decode(response.body);
      cliente = dataProject;
      print("Se obtuvo el cliente del proyecto");
    } catch (error) {
      print("aqui hubo una excepcion gecliente en viewProjectProgrammerpanel");
      print(error.toString());
    } finally {
      setState(() {
        
      });
      cliente1.close();
    }
  }


Future <void> funciones()async{
await getInfooProject();
      await getReqFProject();
      await getAvancesProject();
      await getClientProject();
setState(() {
  
});
}



}

//fin de clase normal
