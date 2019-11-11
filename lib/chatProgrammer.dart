import 'package:findprogrammer/profileProgrammer.dart';
import 'package:findprogrammer/viewAvailableProjects.dart';
import 'package:findprogrammer/viewDevelopmentProjectsProgrammer.dart';
import 'package:findprogrammer/viewFinishProjectsProgrammer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'componentes/variables.dart';
import 'homeProgrammer.dart';
import 'login.dart';
import 'componentes/helperSQFLITE.dart';
import 'package:groovin_material_icons/groovin_material_icons.dart';

const IconData menu = IconData(0xe900, fontFamily: "CustomIcons");

var contextoS;
Helper helper = new Helper();
var destinatario;

@override
class ChatProgrammer extends StatefulWidget {
  var idProyecto, idDesarrollador, destinor;
  ChatProgrammer(this.idProyecto, this.idDesarrollador, this.destinor);
  _ChatProgrammer createState() =>
      new _ChatProgrammer(idProyecto, idDesarrollador, destinor);
}

class _ChatProgrammer extends State<ChatProgrammer> {
  var mensajes;
  var idProyecto, idDesarrollador, destino;
  _ChatProgrammer(this.idProyecto, this.idDesarrollador, this.destino);
  TextEditingController _textEditingController;
  ScrollController _scrollController;
  @override
  Widget build(BuildContext context) {
    _textEditingController = new TextEditingController();
    _scrollController = new ScrollController();
    return WillPopScope(
        onWillPop: () {
          //esto es provicional para pruebas
          helper.DeleteDesarrollador();
          Navigator.pop(context);
        },
        child: Scaffold(
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
                                          borderRadius:
                                              BorderRadius.circular(10),
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
          appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Mensajes"),
                InkWell(
                  onTap: () {
                    setState(() {
                      _scrollController.animateTo(
                          _scrollController.position.maxScrollExtent,
                          duration: Duration(microseconds: 100),
                          curve: Curves.linear);
                    });
                  },
                  child: Icon(Icons.replay),
                )
              ],
            ),
            backgroundColor: Color(0xFF272D34),
          ),
          resizeToAvoidBottomPadding: true,
          backgroundColor: Colors.white,
          //////////////////////////////////////////////////////////////////////////////////////////////////////////////////7
          body: Container(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: FutureBuilder(
                    future: loadMessage(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return ListView.builder(
                            controller: _scrollController,
                            itemCount:
                                mensajes != null ? mensajes.length - 1 : 0,
                            itemBuilder: (context, int item) {
                              destinatario = mensajes[0];
                              item += 1;
                              print(
                                  "jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj");
                              print(mensajes[item]['FK_REMITENTE']);
                              print(idDesarrollador);
                              print(
                                  "jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj");

                              return mensajes[item]['FK_REMITENTE'] !=
                                      idDesarrollador.toString()
                                  ? Column(
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(left: 20),
                                              child: Text("" +
                                                  mensajes[item]['HORA'] +
                                                  "   " +
                                                  mensajes[item]['FECHA'] +
                                                  ""),
                                            ),
                                            Expanded(
                                              child: Text(""),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              bottom: 1, top: 1),
                                          child: Row(
                                            children: <Widget>[
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    .03,
                                              ),
                                              Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  20)),
                                                      gradient: LinearGradient(
                                                          begin: Alignment
                                                              .topRight,
                                                          end: Alignment
                                                              .bottomLeft,
                                                          stops: [
                                                            0.1,
                                                            1
                                                          ],
                                                          colors: [
                                                            Color(0xFF610B5E),
                                                            Color(0xFFBDBDBD)
                                                          ])),
                                                  child: Container(
                                                      margin:
                                                          EdgeInsets.all(20),
                                                      child: Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            .60,
                                                        child: Text(
                                                          mensajes[item]
                                                              ['MENSAJE'],
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      ))),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    .20,
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    )
                                  : Column(
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            Expanded(
                                              child: Text(""),
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(right: 20),
                                              child: Text("" +
                                                  mensajes[item]['HORA'] +
                                                  "   " +
                                                  mensajes[item]['FECHA'] +
                                                  ""),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              bottom: 1, top: 1),
                                          child: Row(
                                            children: <Widget>[
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    .20,
                                              ),
                                              Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  20)),
                                                      gradient: LinearGradient(
                                                          begin: Alignment
                                                              .topRight,
                                                          end: Alignment
                                                              .bottomLeft,
                                                          stops: [
                                                            0.1,
                                                            1
                                                          ],
                                                          colors: [
                                                            Color(0xFFBDBDBD),
                                                            Color(0xFF08088A)
                                                          ])),
                                                  child: Container(
                                                      margin:
                                                          EdgeInsets.all(20),
                                                      child: Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            .65,
                                                        child: Text(
                                                          mensajes[item]
                                                              ['MENSAJE'],
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      ))),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    .02,
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    );
                            });
                      } else {
                        return CircularProgressIndicator(
                          strokeWidth: 10,
                        );
                      }
                    },
                  ),
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: TextField(
                          controller: _textEditingController,
                          maxLines: null,
                          keyboardType: TextInputType.multiline,
                          decoration:
                              InputDecoration.collapsed(hintText: "Mensaje"),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        if (_textEditingController.text != "") {
                          sendMessage();
                        }
                      },
                      icon: Icon(
                        Icons.send,
                        color: Colors.deepPurpleAccent,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 1,
                )
              ],
            ),
          ),
        ));
  }

  Future loadMessage() async {
    try {
      final response = await http.post(
          //"http://192.168.0.5/findprogrammerDB/openRoom.php",
          server + "/openRoom1.php",
          body: {
            "idProyecto": idProyecto.toString(),
            "idDesarrollador": idDesarrollador.toString(),
          }).timeout(Duration(seconds: 7));

      var dataResponse = response.body;
      print(
          "CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC");
      print(dataResponse);

      mensajes = json.decode(response.body);

      print(mensajes);
      print("-------------------------");
    } catch (d) {
      print("error editando el proyecto");
      print(d.toString());
    }
  }

  Future sendMessage() async {
    try {
      final response = await http.post(
          //"http://192.168.0.5/findprogrammerDB/sendMessage.php",
          server + "/sendMessage.php",
          body: {
            "idRemitente": idDesarrollador.toString(),
            "idDestinatario": destino.toString(),
            "mensaje": _textEditingController.text,
          }).timeout(Duration(seconds: 7));
      print(idDesarrollador.toString());
      print(destinatario.toString());
      print(_textEditingController.text);

      var dataResponse = response.body;
      print("openrzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz");
      print(dataResponse);
      if (dataResponse == "1") {
        print("si esntro");
        setState(() {});
        _scrollController.animateTo(_scrollController.position.maxScrollExtent,
            duration: Duration(microseconds: 500), curve: Curves.linear);
      }

      print("-------------------------");
    } catch (d) {
      print("error mandando el proyecto");
      print(d.toString());
    }
  }
}
