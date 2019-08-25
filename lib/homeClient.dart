import 'package:findprogrammer/profileClient.dart';
import 'viewProjectClient.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
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

const IconData menu = IconData(0xe900, fontFamily: "CustomIcons");

class Homeclient extends StatefulWidget {
  @override
  _Homeclient createState() => new _Homeclient();
}

class _Homeclient extends State<Homeclient> {
  @override
  void initState() {
    // TODO: implement initState
    getClient();

    getProject();
  }

  @override
  Widget build(BuildContext context) {
    var _scaffoldKeyhome = new GlobalKey<ScaffoldState>();
    var _keydos = new GlobalKey();
    return WillPopScope(
      onWillPop: () {
        //esto es provicional para pruebas
        helper.DeleteCliente();
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
                                      image: AssetImage(
                                          'assets/images/mountains.jpeg'),
                                    )),
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
        appBar: null,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white24,
          child: Icon(GroovinMaterialIcons.plus_circle_multiple_outline),
          onPressed: () {
//alertCreateProject(context);
          },
        ),
        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.white,
        body: FutureBuilder(
          key: _keydos,
          future: getProject(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              print("spuestamente la conexion se cerro");
              return new Container(
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
                                    _scaffoldKeyhome.currentState.openDrawer();
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
                        itemCount: myProjects == null ? 0 : myProjects.length,
                        itemBuilder: (BuildContext context, int position) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ViewProjectClient(
                                          myProjects[position]
                                              ['ID_PROYECTO'])));
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
                                                    ['FECHA_DE_INICIO']
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
              );
            } else {
              print("spuestamente la conexion no ha terminado");

              return Stack(
                children: <Widget>[
                  Container(
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
                            itemCount: 5,
                            itemBuilder: (BuildContext context, int position) {
                              return GestureDetector(
                                onTap: () {},
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
                        color: Color.fromARGB(1000,75, 74, 75),
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
                              Colors.white
                              ),
                        ),
                            ),
                            ),
                        Text("Cargando",
                                                style: TextStyle(
                                                    fontSize: 30.0,
                                                    color: Colors.white)
                                                    )
                          ],
                        )
                      ),
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

  void getClient() async {
    try {
      clientList = await helper.SelectCliente();
      client = clientList.first;
      print("se obtuvo el cliente");
       print(client);
       print("ID"+client['ID_CLIENTE'].toString()+"sssss");
    } catch (e) {
      print("aqui hay un error de no se que, funcion getClient" + e.toString());
    }
    setState(() {});
  }

  Future getProject() async {
    try {
      print("ID"+client['ID_CLIENTE'].toString());
      final response = await http.post(
          "https://findprogrammerceti.000webhostapp.com/loadMyProjects.php",
          body: {
            "ID": client['ID_CLIENTE'].toString(),
          });

      var datauser = json.decode(response.body);

      print(datauser);
      myProjects = datauser;
    } catch (d) {}
  }
}
