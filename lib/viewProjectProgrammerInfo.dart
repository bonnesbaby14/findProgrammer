import 'package:findprogrammer/viewAvailableProjects.dart';
import 'package:findprogrammer/viewFinishProjectsProgrammer.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'componentes/helperSQFLITE.dart';
import 'componentes/variables.dart';
import 'customIcons.dart';
import 'package:async/async.dart';
import 'login.dart';
import 'profileProgrammer.dart';
import 'package:http/http.dart' as http;
import 'viewDevelopmentProjectsProgrammer.dart';
import 'package:flutter/cupertino.dart';
import 'homeProgrammer.dart';
import 'package:groovin_material_icons/groovin_material_icons.dart';

const IconData menu = IconData(0xe900, fontFamily: "CustomIcons");

var contextoS;
var listReqNF = List<Widget>();

class ViewProjectProgrammerInfo extends StatefulWidget {
  String ID;
  ViewProjectProgrammerInfo(this.ID);
  @override
  _ViewProjectProgrammerInfo createState() =>
      new _ViewProjectProgrammerInfo(this.ID);
}

class _ViewProjectProgrammerInfo extends State<ViewProjectProgrammerInfo> {
  String ID;
  _ViewProjectProgrammerInfo(this.ID);
  final AsyncMemoizer _asyncMemorizer = new AsyncMemoizer();
  var dataProject, reqFuncionales, reqNoFuncionales, avances, clienteP;
  Helper helper = new Helper();
  @override
  Widget build(BuildContext context) {
    setState(() {});
    var _scaffoldKey3 = new GlobalKey<ScaffoldState>();
    return Scaffold(
        key: _scaffoldKey3,
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
                                Text("Código de Proyecto",
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
                                    placeholder: "Código de proyecto...",
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
                                Text("Cerrar Sesión",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 20)),
                              ],
                            ),
                            content: Text("¿Seguro que quieres cerrar sesión?"),
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
                                  "Cerrar Sesión",
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
        body: FutureBuilder(
          future: _asyncMemorizer.runOnce(() async {
            await getInfooProject();
          }),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              print("se entro una vez y se recopilaron los datos ");
              print("+++++++++++++++++++++++++++++++++++++++++++");

              return Container(
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
                                      _scaffoldKey3.currentState.openDrawer();
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
                            dataProject[0]["TITULO"],
                            style:
                                TextStyle(fontSize: 25.0, color: Colors.white),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "por: Gabriel Rodriguez",
                            style:
                                TextStyle(fontSize: 18.0, color: Colors.white),
                          ),
                          Container(
                            width: (MediaQuery.of(context).size.width / 4) * 3,
                            height: 90,
                            child: ListView(
                              children: <Widget>[
                                Text(
                                  dataProject[0]["DESCRIPCION"],
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      fontSize: 14.0, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 100,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                InkWell(
                                  onTap: () {
                                    applyForProject();
                                  },
                                  child: Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(20, 10, 20, 10),
                                    child: Column(
                                      children: <Widget>[
                                        Icon(
                                          GroovinMaterialIcons.comment_question,
                                          color: Colors.white,
                                          size: 30,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          " Solicitar \nProyecto ",
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
                                  child: Text("Avances",
                                      style: TextStyle(
                                          fontSize: 27.0, color: Colors.white)),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
                                  child: Text(
                                      "-Se requieren Avances 'cada 15 dias' .",
                                      style: TextStyle(
                                          fontSize: 14.0, color: Colors.white)),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
                                  child: Text("-Se requieren Entregables.",
                                      style: TextStyle(
                                          fontSize: 14.0, color: Colors.white)),
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
                                          fontSize: 27.0, color: Colors.white)),
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
                                                    : dataProject[0]["F_TIPO_DE_PROYECTO"] == "4"
                                                        ? Text("Aplicación Escritorio MAC",
                                                            style: TextStyle(fontSize: 14.0, color: Colors.white))
                                                        : dataProject[0]["F_TIPO_DE_PROYECTO"] == "5" ? Text("Proyecto de Redes", style: TextStyle(fontSize: 14.0, color: Colors.white)) : Text("ERROR", style: TextStyle(fontSize: 14.0, color: Colors.white))),
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
              );
            } else {
              return Stack(
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
                                          _scaffoldKey3.currentState
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
                                "_________________",
                                style: TextStyle(
                                    fontSize: 25.0, color: Colors.white),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "por: _______________",
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
                                      "___________________________________________",
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                          fontSize: 14.0, color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 100,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    InkWell(
                                      onTap: () {},
                                      child: Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(20, 10, 20, 10),
                                        child: Column(
                                          children: <Widget>[
                                            Icon(
                                              GroovinMaterialIcons
                                                  .comment_question,
                                              color: Colors.white,
                                              size: 30,
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              " Solicitar \nProyecto ",
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
                                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                      child: Text("___________",
                                          style: TextStyle(
                                              fontSize: 26.0,
                                              color: Colors.white)),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
                                      child: Text(
                                          "_____________                          ",
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              color: Colors.white)),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
                                      child: Text("____________",
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              color: Colors.white)),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
                                      child: Text("___________________",
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              color: Colors.white)),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
                                      child: Text("-_______________",
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
                                      child: Text("_____________",
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
                                      child: Text("____________",
                                          style: TextStyle(
                                              fontSize: 27.0,
                                              color: Colors.white)),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                      child: Text("____________",
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
              );
            }
          },
        ));
  }

  Future getInfooProject() async {
    print("77777777777777777777777777777777777777777777777777777777");
    print(this.ID);

    try {
      final response = await http.post(

          // "http://192.168.0.5/findprogrammerDB/loadInfoProject.php",
          server + "/loadInfoProject.php",

          // "http://192.168.84.114/findprogrammerDB/loadInfoProject.php",
          body: {
            "ID_PROYECTO": this.ID,
            "TYPE": "1"
          }).timeout(Duration(seconds: 7));

      var dataProject = json.decode(response.body);
      this.dataProject = dataProject;
    } catch (f) {}
  }

  Future<List> getReqFProject() async {
    final response = await http.post(server + "/loadInfoProject.php",
        // "http://192.168.0.5/findprogrammerDB/loadInfoProject.php",
        //  "http://192.168.84.114/findprogrammerDB/loadInfoProject.php",
        body: {
          "ID_PROYECTO": this.ID,
          "TYPE": "2"
        }).timeout(Duration(seconds: 7));

    var dataProject = json.decode(response.body);
    this.reqFuncionales = dataProject;
  }

  Future<List> getAvancesProject() async {
    final response = await http.post(server + "/loadInfoProject.php",
        // "http://192.168.84.114/findprogrammerDB/loadInfoProject.php",
        //"http://192.168.0.5/findprogrammerDB/loadInfoProject.php",
        body: {
          "ID_PROYECTO": this.ID,
          "TYPE": "4"
        }).timeout(Duration(seconds: 7));

    var dataProject = json.decode(response.body);
    this.avances = dataProject;
  }

  Future<List> getClientProject() async {
    final response = await http.post(
        // "http://192.168.84.114/findprogrammerDB/loadInfoProject.php",
        server + "/loadInfoProject.php",
        // "http://192.168.0.5/findprogrammerDB/loadInfoProject.php",
        body: {
          "ID_PROYECTO": this.ID,
          "TYPE": "5"
        }).timeout(Duration(seconds: 7));

    var dataProject = json.decode(response.body);
    this.clienteP = dataProject;
  }

  Future applyForProject() async {
    print(desarrollador);
    final response = await http.post(
        // "http://192.168.84.114/findprogrammerDB/loadInfoProject.php",
        server + "/applyForProject.php",
        // "http://192.168.0.5/findprogrammerDB/loadInfoProject.php",
        body: {
          "ID_PROYECTO": this.ID.toString(),
          "ID_DESARROLLADOR": desarrollador['ID_DESARROLLADOR'].toString(),
        }).timeout(Duration(seconds: 7));

    var dataProject = json.decode(response.body);
    print(dataProject);
    if (dataProject == 2) {
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
                content: Text("Ya has solicitado este proyecto"),
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
    } else if (dataProject == true) {
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
                content: Text("La solicitud se hizo correctamente"),
                actions: <Widget>[
                  FlatButton(
                    onPressed: () {
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
    }
  }
}
