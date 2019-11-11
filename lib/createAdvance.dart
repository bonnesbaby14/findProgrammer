import 'package:findprogrammer/componentes/helperSQFLITE.dart';
import 'package:findprogrammer/profileProgrammer.dart';
import 'package:findprogrammer/viewProjectProgrammerPanel.dart';

import 'componentes/reqRadio.dart';

import 'componentes/variables.dart';
import 'viewAvailableProjects.dart';
import 'package:findprogrammer/viewFinishProjectsProgrammer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'homeProgrammer.dart';
import 'login.dart';
import 'package:http/http.dart' as http;
import 'viewDevelopmentProjectsProgrammer.dart';
import 'package:groovin_material_icons/groovin_material_icons.dart';

const IconData menu = IconData(0xe900, fontFamily: "CustomIcons");

TextEditingController tdcTimepo = TextEditingController();
TextEditingController tdcNumeroCambio = TextEditingController();
TextEditingController tdcCambios = TextEditingController();
TextEditingController tdcRequerimientos = TextEditingController();
TextEditingController tdcObservaciones = TextEditingController();
TextEditingController tdcDescripcion = TextEditingController();
TextEditingController tdcEnlaces = TextEditingController();
var IDout2;
int intReq = 0;
double intPorcentaje = 0;
var serverResponse2;
var boleanos = new List<bool>();
String sReq = "";
bool flat = false;
var listRadios = new List<Widget>();
var req = new List<ReqRadio>();

class CreateAvance extends StatefulWidget {
  var ID;

  CreateAvance(this.ID);
  @override
  _CreateAvance createState() => new _CreateAvance(ID);
}

class _CreateAvance extends State<CreateAvance> {
  _CreateAvance(IDout2);

  @override
  void initState() {
    req = new List<ReqRadio>();
    // TODO: implement initState
    for (int x = 0; x < reqFuncionales.length; x++) {
      req.add(ReqRadio(reqFuncionales[x]["ID_REQ_F"].toString(),
          reqFuncionales[x]["REQUERIMIENTO"].toString(), false));
    }
  }

  var _scaffoldKey1 = new GlobalKey<ScaffoldState>();
  Helper helper = new Helper();
  @override
  Widget build(BuildContext context) {
    try {
      if (req != null) {
        listRadios = new List<Widget>();
        for (int x = 0; x < req.length; x++) {
          listRadios.add(Padding(
            padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 130,
                  child: Text(
                    req[x].req,
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.black45),
                  ),
                ),
                Material(
                    color: Colors.transparent,
                    child: Checkbox(
                      activeColor: Colors.deepPurpleAccent,
                      onChanged: (e) {
                        print("clicl");
                        setState(() {
                          print(req[x].valor);
                          req[x].valor = e;
                          print("clicl");
                          print(req[x].valor);
                        });
                      },
                      value: req[x].valor,
                    ))
              ],
            ),
          ));
        }
      }

      return Scaffold(
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
          ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
          body: Container(
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
              child: CupertinoAlertDialog(
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
                    Text("Entregar Avance",
                        style: TextStyle(color: Colors.black, fontSize: 20)),
                  ],
                ),
                content: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 15,
                    ),
                    CupertinoTextField(
                      controller: tdcTimepo,
                      placeholder: "Tiempo de trabajo...",
                      placeholderStyle: TextStyle(color: Colors.black38),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              width: 0.5, color: Colors.deepPurpleAccent)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: CupertinoTextField(
                        controller: tdcDescripcion,
                        placeholder: "Descripción",
                        placeholderStyle: TextStyle(color: Colors.black38),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                width: 0.5, color: Colors.deepPurpleAccent)),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: CupertinoTextField(
                        controller: tdcNumeroCambio,
                        placeholder: "Número de cambios",
                        placeholderStyle: TextStyle(color: Colors.black38),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                width: 0.5, color: Colors.deepPurpleAccent)),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: CupertinoTextField(
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
                        controller: tdcCambios,
                        placeholder: "Cambio No.1...",
                        placeholderStyle: TextStyle(color: Colors.black38),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                width: 0.5, color: Colors.deepPurpleAccent)),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CupertinoTextField(
                      controller: tdcObservaciones,
                      placeholder: "Observaciones...",
                      placeholderStyle: TextStyle(color: Colors.black38),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              width: 0.5, color: Colors.deepPurpleAccent)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Porcentaje de proyecto"),
                    CupertinoSlider(
                      onChanged: (e) {
                        setState(() {
                          intPorcentaje = e;
                        });
                      },
                      max: 10,
                      min: 0,
                      activeColor: Colors.deepPurpleAccent,
                      value: intPorcentaje,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Requerimientos completados",
                      style: TextStyle(color: Colors.black45),
                    ),
                    Column(
                      children: listRadios,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CupertinoTextField(
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      controller: tdcEnlaces,
                      placeholder: "Enlaces...",
                      placeholderStyle: TextStyle(color: Colors.black38),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              width: 0.5, color: Colors.deepPurpleAccent)),
                    ),
                  ],
                ),
                actions: <Widget>[
                  FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("Cancelar",
                        style: TextStyle(color: Colors.black, fontSize: 15)),
                  ),
                  FlatButton(
                    onPressed: () async {
                      sReq = "";
                      for (int x = 0; x < req.length; x++) {
                        sReq += req[x].id.toString() +
                            "-" +
                            req[x].valor.toString() +
                            "/";
                      }
                      if (dataProjectw[0]['F_S_ENTREGABLES'] == "1" &&
                          tdcEnlaces.text == "") {
                        print("se detecto que se debe icluir avances");
                        await showDialog(
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
                                      "Este proyecto requiere entregables con cada avance."),
                                  actions: <Widget>[
                                    FlatButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                        return;
                                      },
                                      child: Text("Aceptar",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15)),
                                    ),
                                  ],
                                ));
                      } else {
                        await createAdvance1();
                        if (serverResponse2 == "1") {
                          await showDialog(
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
                                        "El Avance se registró correctamente"),
                                    actions: <Widget>[
                                      FlatButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                          Navigator.pop(context);
                                          setState(() {});
                                        },
                                        child: Text("Aceptar",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15)),
                                      ),
                                    ],
                                  ));
                        } else {
                          Navigator.pop(context);
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
                                        "El Avance no se registró, inténtalo mas tarde. "),
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
                        }
                      }
                    },
                    child: Text("Enviar Avance",
                        style: TextStyle(color: Colors.black, fontSize: 15)),
                  ),
                ],
              )));
    } catch (e) {
      print(e.toString());
    }
  }
}

Future createAdvance1() async {
  var cliente1 = new http.Client();
  print("object");
  print(tdcTimepo.text);
  print(tdcNumeroCambio.text);
  print(tdcCambios.text);
  print(tdcObservaciones.text);
  print(intPorcentaje.toStringAsFixed(2));
  print(tdcDescripcion.text);
  print(sReq);
  print(IDout.toString());
  print(tdcEnlaces.text);
  print("se entro a la funcuon");
  try {
    final response = await cliente1.post(
        //"http://192.168.0.5/findprogrammerDB/registerAdvance.php",
        server + "/registerAdvance2.php",
        body: {
          "TIEMPO": tdcTimepo.text,
          "NOCAMBIOS": tdcNumeroCambio.text,
          "CAMBIOS": tdcCambios.text,
          "OBSERVACIONES": tdcObservaciones.text,
          "PORCENTAJE": intPorcentaje.toStringAsFixed(2),
          "DESCRIPCION": tdcDescripcion.text,
          "REQ": sReq,
          "ID": IDout.toString(),
          "ENLACES": tdcEnlaces.text,
        }).timeout(Duration(seconds: 7));
    print("aqui sigo");
    serverResponse2 = response.body;
    print(serverResponse2);
    print("se creo el avance en viewProjectProgrammer paenel");
  } catch (d) {
    print("no se creo el avance en viewProjectProgrammerpaenel");
    print(d.toString());
  } finally {
    print("se cerro el cliente");
    cliente1.close();
  }
}
