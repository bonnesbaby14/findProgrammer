import 'package:findprogrammer/homeProgrammer.dart';
import 'package:findprogrammer/login.dart';
import 'package:findprogrammer/profileProgrammer.dart';
import 'package:findprogrammer/viewAvailableProjects.dart';
import 'package:findprogrammer/viewDevelopmentProjectsProgrammer.dart';
import 'package:findprogrammer/viewFinishProjectsProgrammer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'componentes/helperSQFLITE.dart';
import 'componentes/variables.dart';
import 'customIcons.dart';
import 'dart:convert';
import 'package:groovin_material_icons/groovin_material_icons.dart';

const IconData menu = IconData(0xe900, fontFamily: "CustomIcons");

var contextoS;
var requerimietos;
TextEditingController reqS = TextEditingController();
TextEditingController reqEdit = TextEditingController();

class ViewCreateReq extends StatefulWidget {
  var ID;

  ViewCreateReq(this.ID);
  @override
  _ViewCreateReq createState() => new _ViewCreateReq(ID);
}

class _ViewCreateReq extends State<ViewCreateReq> {
  var ID;
  _ViewCreateReq(this.ID);
  @override
  void initState() {
    getReq();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _scaffoldKey = new GlobalKey<ScaffoldState>();
    Helper helper = new Helper();
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
                                      image: NetworkImage(server +
                                          "images/image_" +
                                          desarrollador['ID_USUARIO']
                                              .toString() +
                                          ".jpg"),
                                    )),
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
                                      actions: <Widget>[
                                        FlatButton(
                                          onPressed: () async {
                                            await enviarReq();
                                            Navigator.pop(context);
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
                                          Text("Enviar Requerimientos",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20)),
                                          SizedBox(
                                            height: 20,
                                          ),
                                        ],
                                      ),
                                      content: Text(
                                        "¿Seguro que quieres enviar los requerimientos al cliente?",
                                      ),
                                    ));
                          },
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                            child: Column(
                              children: <Widget>[
                                Icon(
                                  GroovinMaterialIcons.send,
                                  color: Colors.white,
                                  size: 30,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "        Enviar \n Requerimientos",
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
                              builder: (context) => ListView(
                                children: <Widget>[
                                  CupertinoAlertDialog(
                                      actions: <Widget>[
                                        FlatButton(
                                          onPressed: () async {
                                            await createReq();
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
                                          Text("Añadir requerimiento",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20)),
                                          SizedBox(
                                            height: 20,
                                          ),
                                        ],
                                      ),
                                      content: CupertinoTextField(
                                        maxLines: null,
                                        controller: reqS,
                                        keyboardType: TextInputType.multiline,
                                        placeholder: "Requerimientos...",
                                        placeholderStyle:
                                            TextStyle(color: Colors.black38),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                                width: 0.5,
                                                color:
                                                    Colors.deepPurpleAccent)),
                                      ))
                                ],
                              ),
                            );
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
                                  "     Añadir\nRequerimiento",
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
                            return InkWell(
                              onTap: () {
                                reqEdit.text =
                                    requerimietos[position]['REQUERIMIENTO'];

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
                                              Text("Requerimiento",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 20)),
                                            ],
                                          ),
                                          content: Text(
                                              "¿Quieres eliminar o editar requerimiento ?"),
                                          actions: <Widget>[
                                            FlatButton(
                                              onPressed: () async {
                                                await deleteReq(
                                                    requerimietos[position]
                                                        ['ID_REQ_F']);
                                              },
                                              child: Text("Eliminar",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 15)),
                                            ),
                                            FlatButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                                showDialog(
                                                    context: context,
                                                    builder: (context) =>
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
                                                              Text("Editar",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          20)),
                                                            ],
                                                          ),
                                                          content:
                                                              CupertinoTextField(
                                                            controller: reqEdit,
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
                                                          actions: <Widget>[
                                                            FlatButton(
                                                              onPressed:
                                                                  () async {
                                                                //Aqui se modifica los requrimienos
                                                                await editReq(
                                                                    requerimietos[
                                                                            position]
                                                                        [
                                                                        'ID_REQ_F']);
                                                              },
                                                              child: Text(
                                                                  "Editar",
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
                                              child: Text("Editar",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 15)),
                                            ),
                                          ],
                                        ));
                              },
                              child: Card(
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
                                        Icons.delete,
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
      final response = await cliente1.post(server + "/loadReq.php",
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
      final response = await cliente1.post(server + "/acceptReq.php",
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
      final response = await cliente1.post(server + "/correReq.php",
          // "http://192.168.0.5/findprogrammerDB/acceptReq.php",
          body: {"ID": ID.toString()}).timeout(Duration(seconds: 7));

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

  Future<void> deleteReq(var id) async {
    var cliente1 = new http.Client();
    print(
        "=========================================================================");
    print("se manda a eliminar los requerimientos");

    try {
      final response = await cliente1.post(server + "/deleteReq.php",
          // "http://192.168.0.5/findprogrammerDB/acceptReq.php",
          body: {"ID": id.toString()}).timeout(Duration(seconds: 7));

      var s = json.decode(response.body);
      print(s);
      if (s == 1) {
        print("se mndarona borrar  los req");
        Navigator.pop(context);
        setState(() {});
      } else {
        print("no se mandaron a borrar los req");
      }
    } catch (f) {
      print("hubo un error borrando los requerimeintos");
      print(f.toString());
    } finally {
      cliente1.close();
      setState(() {});
    }
    setState(() {
      getReq();
    });
  }

  Future<void> editReq(var id) async {
    var cliente1 = new http.Client();
    print(
        "=========================================================================");
    print("se manda a editar el requerimientos los requerimientos");

    try {
      final response = await cliente1.post(server + "/editReqP.php",
          // "http://192.168.0.5/findprogrammerDB/acceptReq.php",
          body: {
            "ID": id.toString(),
            "REQ": reqEdit.text,
          }).timeout(Duration(seconds: 7));

      var s = json.decode(response.body);
      print(s);
      if (s == 1) {
        print("se mndarona editar  los req");
        Navigator.pop(context);
        setState(() {});
      } else {
        print("no se mandaron a editar los req");
      }
    } catch (f) {
      print("hubo un error editando los requerimeintos");
      print(f.toString());
    } finally {
      cliente1.close();
      setState(() {
        getReq();
      });
    }
  }

  Future<void> createReq() async {
    var cliente1 = new http.Client();
    print(
        "=========================================================================");
    print("se manda aceptar los requerimientos");

    try {
      final response = await cliente1.post(server + "/createReq.php",
          // "http://192.168.0.5/findprogrammerDB/acceptReq.php",
          body: {
            "ID": ID.toString(),
            "REQ": reqS.text
          }).timeout(Duration(seconds: 7));

      var s = json.decode(response.body);
      print(s);
      if (s == 1) {
        print("se crearon los req");
        Navigator.pop(context);
      } else {
        print("no se crearon los req");
      }
    } catch (f) {
      print("hubo un error creando los requerimeintos");
      print(f.toString());
    } finally {
      cliente1.close();
      setState(() {
        getReq();
      });
    }
  }

  Future<void> enviarReq() async {
    var cliente1 = new http.Client();
    print(
        "=========================================================================");
    print("se manda enviando los requerimientos");

    try {
      final response = await cliente1.post(server + "/enviarReq.php",
          // "http://192.168.0.5/findprogrammerDB/acceptReq.php",
          body: {"ID": ID.toString()}).timeout(Duration(seconds: 7));
      print(response.body);
      var s = json.decode(response.body);

      if (s == 1) {
        print("se enviando los req");
        Navigator.pop(context);
      } else {
        print("no se enviando los req");
      }
    } catch (f) {
      print("hubo un error enviando los requerimeintos");
      print(f.toString());
    } finally {
      cliente1.close();
      setState(() {});
    }
  }
}
