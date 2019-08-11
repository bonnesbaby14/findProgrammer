import 'package:findprogrammer/profileProgrammer.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'viewProjectProgrammerInfo.dart';
import 'componentes/helperSQFLITE.dart';
import 'customIcons.dart';
import 'package:groovin_material_icons/groovin_material_icons.dart';

const IconData menu = IconData(0xe900, fontFamily: "CustomIcons");

List<Map<String, dynamic>> desarrolladorList = List();
Map<String, dynamic> desarrollador = Map();
var contextoS;
Helper helper = new Helper();
var projects;

  @override
class ChatProgrammer  extends StatefulWidget {
  _ChatProgrammer createState() => new _ChatProgrammer();
}

class _ChatProgrammer extends State<ChatProgrammer> {
  @override
  void initState() {
    // TODO: implement initState

  }

  @override
  Widget build(BuildContext context) {
    var _scaffoldKeyhome = new GlobalKey<ScaffoldState>();
    var _keydos = new GlobalKey();

    return WillPopScope(
        onWillPop: () {
          //esto es provicional para pruebas
          helper.DeleteDesarrollador();
          Navigator.pop(context);
        },
        child: Scaffold(
          key: _scaffoldKeyhome,
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
              ],
            ),
          ),
          appBar: AppBar(
          title: Text("Mensajes"),
          backgroundColor: Color(0xFF272D34),
        ),
          resizeToAvoidBottomPadding: false,
          backgroundColor: Colors.white,
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
                          itemCount: 15,
                          itemBuilder: (context, int item) {
                            return false?Column(
                              children: <Widget>[
                                Row(
                                  
                                  children: <Widget>[
                                  
                                  Padding(padding: EdgeInsets.only(left: 20), child: Text("01:58 a.m   11/08/2019"),),
                                  Expanded(child: Text(""),),
                                ],),
                                Container(
                              margin: EdgeInsets.only(bottom: 1, top: 1),
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
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)),
                                          gradient: LinearGradient(
                                              begin: Alignment.topRight,
                                              end: Alignment.bottomLeft,
                                              stops: [
                                                0.1,
                                                1
                                              ],
                                              colors: [
                                                Color(0xFF610B5E),
                                                Color(0xFFBDBDBD)
                                              ])),
                                      child: Container(
                                          margin: EdgeInsets.all(20),
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .60,
                                            child: Text(
                                                "ww dddddd",style: TextStyle(color: Colors.white  ),),
                                          )
                                          )
                                          ),
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
                            ):Column(
                              children: <Widget>[
                                 Row(
                                  
                                  children: <Widget>[
                                  Expanded(child: Text(""),),
                                  Padding(padding: EdgeInsets.only(right: 20), child: Text("01:58 a.m   11/08/2019"),),
                                  
                                ],),

Container(
                              margin: EdgeInsets.only(bottom: 1, top: 1),
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
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)),
                                          gradient: LinearGradient(
                                              begin: Alignment.topRight,
                                              end: Alignment.bottomLeft,
                                              stops: [
                                                0.1,
                                                1
                                              ],
                                              colors: [
                                                Color(0xFFBDBDBD),
                                                Color(0xFF08088A)
                                              ])),
                                      child: Container(
                                          margin: EdgeInsets.all(20),
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .65,
                                            child: Text(
                                                "loremdddd",style: TextStyle(color: Colors.white),),
                                          )
                                          )
                                          ),
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
                            )
                            
                            
                            ;
                          });
                    } else {
                      return ListView();
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
                        decoration:
                            InputDecoration.collapsed(hintText: "Mensaje"),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: (){

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
        )
    );
  }

 Future loadMessage() async {}

}
