import 'dart:convert';
import 'dart:async';
import 'package:findprogrammer/homeClient.dart';
import 'package:findprogrammer/homeProgrammer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'componentes/helperSQFLITE.dart';
import 'main.dart';
import 'package:http/http.dart' as http;
import 'package:groovin_material_icons/groovin_material_icons.dart';

class Login extends StatefulWidget {
  @override
  _Login createState() => new _Login();
}

class _Login extends State<Login> {
  // Future<Database> database=openDatabase(
  //   join( getDatabasesPath(),'sqflitefindprogrammer.db')
  // );

  bool hiden1 = true;
  TextEditingController contrasena = TextEditingController();
  TextEditingController mail = TextEditingController();
  Helper helper = new Helper();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = new GoogleSignIn();

  Future _testSing() async {
    final GoogleSignInAccount googleuser = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleaut =
        await googleuser.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleaut.accessToken, idToken: googleaut.idToken);
    final FirebaseUser user =
        (await _auth.signInWithCredential(credential)).user;
    print(user.providerId);
    print(user.email);
  }

  // Future  _testSing()async{
  //   await googleSignIn.signIn();
  //   print("innicios de sesion");
  //   print(googleSignIn.currentUser.displayName);
  //   await print(googleSignIn.currentUser.id);
  // }

/*
   _testSing(){
  googleSignIn.signOut();
  }
*/



  Future<List> login() async {
    try {
      final response = await http
          .post("https://findprogrammerceti.000webhostapp.com/login.php", body: {
        "mail": mail.text.toLowerCase().trim(),
        "password": contrasena.text,
      }).catchError((eeee) {
        print("sssss");
        return null;
      });

      var datauser = json.decode(response.body);
      print(datauser.toString());

      if (datauser.length == 0) {
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
                      Text("Iniciar Sesión",
                          style: TextStyle(color: Colors.black, fontSize: 20)),
                    ],
                  ),
                  content: Text("El correo o la contraseña son incorrectas"),
                  actions: <Widget>[
                    FlatButton(
                      child: Text("Aceptar",
                          style: TextStyle(color: Colors.black, fontSize: 15)),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ));
        mail.text = "";
        contrasena.text = "";
        setState(() {});

      } else {
        if (datauser[0] == 1) {
          Map<String, dynamic> MapDesarrollador = Map();

          print(response.body);

          MapDesarrollador['ID_USUARIO'] =datauser[1]['USUARIO'];
          MapDesarrollador['NOMBRE'] = datauser[1]['NOMBRE'];
          MapDesarrollador['APELLIDO_P'] = datauser[1]['APELLIDO_P'];
          MapDesarrollador['APELLIDO_M'] = datauser[1]['APELLIDO_M'];
          MapDesarrollador['CORREO'] = datauser[1]['CORREO'];
          MapDesarrollador['FOTO'] = datauser[1]['FOTO'];
          MapDesarrollador['CALIFICACION'] = datauser[1]['CALIFICACION'];
          MapDesarrollador['F_ESTADO_REGISTRO'] =datauser[1]['F_ESTADO_REGISTRO'];
          MapDesarrollador['PASSWORD'] = datauser[1]['PASSWORD'];
          MapDesarrollador['TELEFONO'] = datauser[1]['TELEFONO'];
          MapDesarrollador['F_BAJA_USUARIO'] = datauser[1]['F_BAJA_USUARIO'];
          MapDesarrollador['F_ESTADO_LOGIN'] = datauser[1]['F_ESTADO_LOGIN'];
          MapDesarrollador['CURP'] = datauser[1]['CURP'];
          MapDesarrollador['F_USUARIO_APRUEBA'] =datauser[1]['F_USUARIO_APRUEBA'];
          MapDesarrollador['F_D_WEB'] = datauser[1]['F_D_WEB'];
          MapDesarrollador['F_D_M_ANDROID'] = datauser[1]['F_D_M_ANDROID'];
          MapDesarrollador['F_D_M_IOS'] = datauser[1]['F_D_M_IOS'];
          MapDesarrollador['F_D_E_WINDOWS'] = datauser[1]['F_D_E_WINDOWS'];
          MapDesarrollador['F_D_E_MAC'] = datauser[1]['F_D_E_MAC'];
          MapDesarrollador['F_D_REDES'] = datauser[1]['F_D_REDES'];
          MapDesarrollador['PREPARACION'] = datauser[1]['PREPARACION'];
          MapDesarrollador['PROYECTOS_TRABAJADOS'] =datauser[1]['PROYECTOS_TRABAJADOS'];
          MapDesarrollador['F_SISTEMA_BLOQUEADO'] =datauser[1]['F_SISTEMA_BLOQUEADO'];
          print(MapDesarrollador.toString());
          
//insertar datos del programador logueado.
          var insertDesarrollador =
              await helper.InsertDesarrollador(MapDesarrollador);
          print("//$insertDesarrollador//");
          if (insertDesarrollador == 1) {
          } else {}
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => HomeProgrammer()));




        } else if (datauser[0] == 2) {
          Map<String, dynamic> MapCliente = Map();

          print(response.body);

          MapCliente['ID_USUARIO'] = datauser[1]['ID_USUARIO'];
          MapCliente['NOMBRE'] = datauser[1]['NOMBRE'];
          MapCliente['APELLIDO_P'] = datauser[1]['APELLIDO_P'];
          MapCliente['APELLIDO_M'] = datauser[1]['APELLIDO_M'];
          MapCliente['CORREO'] = datauser[1]['CORREO'];
          MapCliente['FOTO'] = datauser[1]['FOTO'];
          MapCliente['CALIFICACION'] = datauser[1]['CALIFICACION'];
          MapCliente['F_ESTADO_REGISTRO'] = datauser[1]['F_ESTADO_REGISTRO'];
          MapCliente['PASSWORD'] = datauser[1]['PASSWORD'];
          MapCliente['TELEFONO'] = datauser[1]['TELEFONO'];
          MapCliente['F_BAJA_USUARIO'] = datauser[1]['F_BAJA_USUARIO'];
          MapCliente['F_ESTADO_LOGIN'] = datauser[1]['F_ESTADO_LOGIN'];
          MapCliente['CURP'] = datauser[1]['CURP'];
          MapCliente['F_USUARIO_APRUEBA'] = datauser[1]['F_USUARIO_APRUEBA'];

          print(MapCliente.toString());

//insertar datos del programador logueado.
          var insertCliente = await helper.InsertCliente(MapCliente);
          print("//$insertCliente//");

          if (insertCliente == 1) {
          } else {}

          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Homeclient()));
        }
      }

      return datauser;
    } on Exception {
      print("sssskiki");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      body: WillPopScope(
        onWillPop: () {
          Navigator.pop(context);
          return;
        },
        child: new Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: Colors.deepPurpleAccent,
            image: DecorationImage(
              colorFilter: new ColorFilter.mode(
                  Colors.black.withOpacity(0.3), BlendMode.dstATop),
              image: AssetImage('assets/images/mountains.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: ListView(
            padding: EdgeInsets.fromLTRB(22.0, 0, 22.0, 0),
            children: <Widget>[
              SizedBox(
                height: kToolbarHeight,
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Inicia Sesion",
                    style: TextStyle(fontSize: 42.0, color: Colors.white),
                  )),
              Padding(
                padding: EdgeInsets.fromLTRB(8.0, 1, 8.0, 0),
                child: Container(
                  width: 35.0,
                  height: 1.5,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: ((MediaQuery.of(context).size.height) / 10) - 30,
              ),
              Theme(
                data: ThemeData(
                    hintColor: white,
                    primaryColor: white,
                    primaryColorDark: white),
                child: TextFormField(
                  controller: mail,
                  style: new TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    labelText: "Correo",
                    fillColor: Colors.white,
                  ),
                  cursorColor: Colors.white,
                ),
              ),

              SizedBox(
                height: 30.0,
              ),
              Theme(
                data: ThemeData(
                    hintColor: white,
                    primaryColor: white,
                    primaryColorDark: white),
                child: TextFormField(
                  controller: contrasena,
                  style: new TextStyle(
                    color: Colors.white,
                  ),
                  obscureText: hiden1 ? true : false,
                  decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      labelText: "Contraseña",
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            hiden1 = !hiden1;
                          });
                        },
                        icon: hiden1
                            ? Icon(
                                Icons.visibility_off,
                                color: Colors.grey,
                              )
                            : Icon(
                                Icons.visibility,
                                color: Colors.white,
                              ),
                      )),
                ),
              ),

              SizedBox(
                height: 55.0,
              ),
              Align(
                child: SizedBox(
                  height: 50.0,
                  width: 270.0,
                  child: OutlineButton(
                    borderSide: BorderSide(color: Colors.white),
                    onPressed: () {
                      if (mail.text == "" || contrasena.text == "") {
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
                                      Text("Iniciar Sesión",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20)),
                                    ],
                                  ),
                                  content: Text(
                                      "Alguno de los campos esta vacio, llenalos para poder continuar"),
                                  actions: <Widget>[
                                    FlatButton(
                                      child: Text("Aceptar",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15)),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ],
                                ));
                        return;
                      }

                      login();
                    },
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    child: Text(
                      "Inicia Sesion",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: 15.0,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "---------- o Inicia con  ----------",
                  style: TextStyle(color: Colors.white, fontSize: 12.0),
                ),
              ),

              SizedBox(
                height: 15.0,
              ),
              Align(
                child: SizedBox(
                  height: 50.0,
                  width: 270.0,
                  child: OutlineButton(
                    borderSide: BorderSide(color: Colors.white),
                    onPressed: () {
                      _testSing();
                      //googleSignIn.signOut();
                    },
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          GroovinMaterialIcons.google,
                          color: Colors.white,
                        ),
                        Text(
                          "  Google",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
              ),

              //fin de el listview
            ],
          ),
        ),
      ),
    );
  }
}
