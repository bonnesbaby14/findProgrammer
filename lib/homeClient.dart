import 'package:findprogrammer/profileClient.dart';
import 'package:findprogrammer/viewDevelopmentProjectsClient.dart';
import 'package:findprogrammer/viewFinishProjectsClient.dart';
import 'package:findprogrammer/claseAlertCreateProject.dart';
import 'componentes/variables.dart';
import 'viewProjectClient.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'login.dart';
import 'componentes/helperSQFLITE.dart';
import 'package:http/http.dart' as http;
import 'customIcons.dart';
import 'package:groovin_material_icons/groovin_material_icons.dart';

var contextoS;
bool bva = false;
Helper helper = new Helper();
List<Map<String, dynamic>> clientList = List();
Map<String, dynamic> client = Map();
var myProjects;
var dataResponse;

const IconData menu = IconData(0xe900, fontFamily: "CustomIcons");

class Homeclient extends StatefulWidget {
  @override
  _Homeclient createState() => new _Homeclient();
}

class _Homeclient extends State<Homeclient> {
  @override
  void initState() {
    if(statusRed){
      print("se conculta la red");
getProject();
    }else{
      print("se conculta la db local");
      getProjectOfline();
    }
    getClient();
    
  }

  @override
  Widget build(BuildContext context) {
    contextoS = context;
    var _scaffoldKeyhome = new GlobalKey<ScaffoldState>();

    return RefreshIndicator(
      color: Colors.deepPurpleAccent,
      onRefresh: () async {  
        if(statusRed){
await getProject();
    }else{
      await getProjectOfline();
    }
       
        await Future.delayed(Duration(milliseconds: 500));
        setState(() {});
      },
      child: WillPopScope(
        onWillPop: () {
          //esto es provicional para pruebas
          helper.DeleteCliente();
          this.dispose();
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
                                                client['ID_USUARIO']
                                                    .toString() +
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
                                                client['APELLIDO_P']
                                                    .toString() +
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
                              builder: (context) =>
                                  ViewFinishProjectsClient()));
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
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.transparent.withOpacity(0.3),
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
                                        color: Colors.deepPurpleAccent,
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
                                    Text("¿Seguro que quieres cerrar sesion?"),
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
                  )
                ],
              ),
            ),
            appBar: null,
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.white24,
              child: Icon(GroovinMaterialIcons.plus_circle_multiple_outline),
              onPressed: () async {
                await showDialog(
                    context: context,
                    builder: (_) => AlertCreatePorject()).whenComplete(() {});
                if (dataResponse == "1") {
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
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 20)),
                              ],
                            ),
                            content:
                                Text("El proyecto se registro correctamente"),
                            actions: <Widget>[
                              FlatButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  setState(() {});
                                },
                                child: Text("Aceptar",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15)),
                              ),
                            ],
                          ));
                } else {
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
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 20)),
                              ],
                            ),
                            content: Text(
                                "El proyecto no se registro, intentalo mas tarde. "),
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
                }
              },
            ),
            resizeToAvoidBottomPadding: false,
            backgroundColor: Colors.white,
            body: myProjects != null
                ? Container(
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      image: DecorationImage(
                        colorFilter: new ColorFilter.mode(
                            Colors.black.withOpacity(0.3), BlendMode.dstATop),
                        image: AssetImage('assets/images/mountains.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    padding: EdgeInsets.fromLTRB(5.0, 0, 5.0, 0),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: kToolbarHeight,
                        ),
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    IconButton(
                                      onPressed: () {
                                        _scaffoldKeyhome.currentState
                                            .openDrawer();
                                      },
                                      icon: Icon(
                                        CustomIcons.menu,
                                        color: Colors.white,
                                        size: 42,
                                      ),
                                    ),
                                    Text(
                                      "   Bienvenido",
                                      style: TextStyle(
                                          fontSize: 30.0, color: Colors.white),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(70, 0, 0, 0),
                                  child: Container(
                                    width: 450.0,
                                    height: 1.5,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            )),
                        Expanded(
                          child: ListView.builder(
                            itemCount:
                                myProjects == null ? 0 : myProjects.length,
                            itemBuilder: (BuildContext context, int position) {
                              return GestureDetector(
                                onTap: () {
                                  print(myProjects[position]['ID_PROYECTO']);

                                  print("ya se va entrar ");
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ViewProjectClient(
                                                  myProjects[position]
                                                      ['ID_PROYECTO'].toString())));
                                print("se termino-------------");
                                                                },
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  elevation: 10,
                                  color: Color.fromARGB(450, 41, 39, 42),
                                  child: Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.face,
                                        size: 100,
                                        color: Colors.white,
                                      ),
                                      Column(
                                        children: <Widget>[
                                          SizedBox(
                                            height: 25,
                                          ),
                                          Container(
                                            width: ((MediaQuery.of(context)
                                                            .size
                                                            .width /
                                                        4) *
                                                    2) +
                                                20,
                                            child: Text(
                                                myProjects[position]['TITULO']
                                                    .toString(),
                                                style: TextStyle(
                                                    fontSize: 30.0,
                                                    color: Colors.white)),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Container(
                                            width: ((MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    4) *
                                                2),
                                            child: Text(
                                                myProjects[position]
                                                        ['FECHA_DE_PUBLICACION']
                                                    .toString(),
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
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  )
                : Stack(
                    children: <Widget>[
                      Container(
                        height: MediaQuery.of(context).size.height,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          image: DecorationImage(
                            colorFilter: new ColorFilter.mode(
                                Colors.black.withOpacity(0.3),
                                BlendMode.dstATop),
                            image: AssetImage('assets/images/mountains.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        padding: EdgeInsets.fromLTRB(5.0, 0, 5.0, 0),
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: kToolbarHeight,
                            ),
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        IconButton(
                                          onPressed: () {
                                            _scaffoldKeyhome.currentState
                                                .openDrawer();
                                          },
                                          icon: Icon(
                                            CustomIcons.menu,
                                            color: Colors.white,
                                            size: 42,
                                          ),
                                        ),
                                        Text(
                                          "   Bienvenido",
                                          style: TextStyle(
                                              fontSize: 30.0,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(70, 0, 0, 0),
                                      child: Container(
                                        width: 450.0,
                                        height: 1.5,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                )),
                            Expanded(
                              child: ListView.builder(
                                itemCount: 5,
                                itemBuilder:
                                    (BuildContext context, int position) {
                                  return GestureDetector(
                                    onTap: () {},
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      elevation: 10,
                                      color: Color.fromARGB(450, 41, 39, 42),
                                      child: Row(
                                        children: <Widget>[
                                          Icon(
                                            Icons.face,
                                            size: 100,
                                            color: Colors.white,
                                          ),
                                          Column(
                                            children: <Widget>[
                                              SizedBox(
                                                height: 25,
                                              ),
                                              Container(
                                                width: ((MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            4) *
                                                        2) +
                                                    20,
                                                child: Text("___________",
                                                    style: TextStyle(
                                                        fontSize: 30.0,
                                                        color: Colors.white)),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Container(
                                                width: ((MediaQuery.of(context)
                                                            .size
                                                            .width /
                                                        4) *
                                                    2),
                                                child: Text("________",
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
                              ),
                            ),
                            SizedBox(
                              height: 20,
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
      ),
    );
  }

  void getClient() async {
    try {
      clientList = await helper.SelectCliente();
   
      print("!!!!!!!!!!!!!!!!!!11");
      print(clientList[0]['NOMBRE']);
      print("!!!!!!!!!!!!!!!!!!11");
      client = clientList.first;
      print("se obtuvo el cliente en getcliente en homecliente");
    } catch (e) {
      print("aqui hay un error de no se que, funcion getClient en homecliente" +
          e.toString());
    }
    setState(() {});
  }
 void getProjectOfline() async {
    try {
      myProjects = await helper.SelectProjectInfo();
      print("se obtuvo los proyectos ofline");
      print(myProjects);     
    } catch (e) {
      print("aqui hay un error de no se que, funcion getClient en homecliente" +
          e.toString());
    }
    setState(() {});
  }
  Future getProject() async {
    var cliente = http.Client();
    try {
      print("ID" + client['ID_USUARIO'].toString());
      final response = await cliente.post(server + "/loadMyProjects.php",
          // "http://192.168.0.5/findprogrammerDB/loadMyProjects.php",
          body: {
            "ID": client['ID_USUARIO'].toString(),
          }).timeout(Duration(seconds: 10));

      var datauser = json.decode(response.body);

      myProjects = datauser;

helper.DeleteProyectoInfo();
      for (int x = 0; x < myProjects.length; x++) {
        Map<String, dynamic> mapProyecto = Map();
        mapProyecto['ID_PROYECTO'] = datauser[x]['ID_PROYECTO'];
        mapProyecto['TITULO'] = datauser[x]['TITULO'];
        mapProyecto['DESCRIPCION'] = datauser[x]['DESCRIPCION'];
        mapProyecto['FECHA_DE_PUBLICACION'] =
            datauser[x]['FECHA_DE_PUBLICACION'];
        mapProyecto['PRESUPUESTO'] = datauser[x]['PRESUPUESTO'];
        mapProyecto['F_TIPO_DE_PROYECTO'] = datauser[x]['F_TIPO_DE_PROYECTO'];
        mapProyecto['F_TERMINADO'] = datauser[x]['F_TERMINADO'];
        mapProyecto['F_VISIBILIDAD'] = datauser[x]['F_VISIBILIDAD'];
        mapProyecto['F_EN_DESARROLLO'] = datauser[x]['F_EN_DESARROLLO'];
        mapProyecto['F_ABANDONO_C'] = datauser[x]['F_ABANDONO_C'];
        mapProyecto['F_ABANDONO_D'] = datauser[x]['F_ABANDONO_D'];
        mapProyecto['OBSERVACIONESABANDONO'] =
            datauser[x]['OBSERVACIONESABANDONO'];
        mapProyecto['INTERVALO_DE_AVANCES'] =
            datauser[x]['INTERVALO_DE_AVANCES'];
        mapProyecto['F_S_ENTREGABLES'] = datauser[x]['F_S_ENTREGABLES'];
        mapProyecto['FK_CLIENTE'] = datauser[x]['FK_CLIENTE'];
        mapProyecto['codigo'] = datauser[x]['codigo'];
        
        var insertarPRoeycto =
              await helper.InsertProyectoInfo(mapProyecto);
              print(">>>>$insertarPRoeycto<<<<<");
      }

      print(datauser);
      setState(() {});
    } catch (d) {
      print("error obteniendo proyecto funcion get proyecto en homeclient" +
          d.toString());
    } finally {
      setState(() {});
      cliente.close();
    }
  }
}

//fin de clase normal
Future registerProject() async {
  print("se entro a la funcion");
  print(intFrecuencia);
  var cliente = http.Client();
  try {
    final response = await cliente
        .post(server + "/registerProject.php", body: {
          "ID_USUARIO": client['ID_USUARIO'].toString(),
          "TITULO": tdcTitulo.text.toString(),
          "DESCRIPCION": tdcDescripcion.text.toString(),
          "PRESUPUESTO": tdcPresupuesto.text.toString(),
          "TIPO": intTipo.toString(),
          "TIEMPO": intFrecuencia.toString(),
          "ENTREGABLES": flat ? "1" : "0",
        })
        .timeout(Duration(seconds: 7))
        .whenComplete(() {
          print(
              "Se termino la funcion de register de proyecto en home cliente");
        });

    dataResponse = response.body;
    print("se creo el proyecto posiblemente en homecliente");
    print(dataResponse);
  } catch (d) {
    print("error registrando el proyecto en homcliente");
    print(d.toString());
  } finally {
    cliente.close();
  }
}
