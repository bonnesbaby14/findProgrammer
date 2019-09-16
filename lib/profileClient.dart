import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'customIcons.dart';
import 'homeClient.dart';
import 'package:groovin_material_icons/groovin_material_icons.dart';
import 'login.dart';

const IconData menu = IconData(0xe900, fontFamily: "CustomIcons");

var contextoS;

class ProfileClient extends StatefulWidget {
  @override
  _ProfileClient createState() => new _ProfileClient();
}

class _ProfileClient extends State<ProfileClient> {
  @override
  Widget build(BuildContext context) {
    var _scaffoldKeyprofile = new GlobalKey<ScaffoldState>();
    double mediaw = MediaQuery.of(context).size.width;
    double mediah = MediaQuery.of(context).size.height;
    return Scaffold(
        key: _scaffoldKeyprofile,
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
              )
            ],
          ),
        ),
        appBar: null,
        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.white,
        body: new Container(
          height: mediah,
          decoration: BoxDecoration(
            color: Colors.deepPurpleAccent, //aqui cambiar
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
                height: (mediah / 2) + 60,
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
                                _scaffoldKeyprofile.currentState.openDrawer();
                              },
                              icon: Icon(
                                CustomIcons.menu,
                                color: Colors.white,
                                size: 42,
                              )),
                        ),
                      ],
                    ),
                    Container(
                      width: mediah * .15,
                      height: mediah * .15,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage('assets/images/mountains.jpeg'),
                          )),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      client['NOMBRE'].toString() +
                          " " +
                          client['APELLIDO_P'].toString() +
                          " " +
                          client['APELLIDO_M'].toString(),
                      style: TextStyle(
                          fontSize: mediah * .04, color: Colors.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Cliente",
                      style: TextStyle(fontSize: 18.0, color: Colors.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: <Widget>[
                              Icon(
                                Icons.star_half,
                                color: Colors.white,
                                size: 30,
                              ),
                              Text(
                                "Califiación",
                                style: TextStyle(
                                    fontSize: 14.0, color: Colors.white),
                              ),
                              Text(
                                client['CALIFICACION'].toString() + "",
                                style: TextStyle(
                                    fontSize: 12.0, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: <Widget>[
                              Icon(
                                GroovinMaterialIcons.edit_outline,
                                color: Colors.white,
                                size: 30,
                              ),
                              Text(
                                "Editar Perfil",
                                style: TextStyle(
                                    fontSize: 14.0, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 7,
                  key: new GlobalKey(),
                  itemBuilder: (BuildContext context, int position) {
                    return Card(
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
                              Icons.star_half,
                              size: 50,
                              color: Colors.white,
                            ),
                          ),
                          Column(
                            children: <Widget>[
                              SizedBox(
                                height: 25,
                              ),
                              Text(" Alvaro Pintor",
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      fontSize: 20.0, color: Colors.white)),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                width: mediaw * .6,
                                child: Text(
                                    " Presiona demasiado durante la realizacion del proyecto y el pago se retraso bastante.",
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                      fontSize: 10.0,
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
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
