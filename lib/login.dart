import 'dart:convert';
import 'dart:async';
import 'package:findprogrammer/firstScreen.dart';
import 'package:findprogrammer/homeClient.dart';
import 'package:findprogrammer/homeProgrammer.dart';
import 'package:findprogrammer/registerUser.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'componentes/helperSQFLITE.dart';
import 'componentes/variables.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      body: WillPopScope(
        onWillPop: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => FirstScreen()));
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
                    "Inicia Sesión",
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
                  keyboardType: TextInputType.emailAddress,
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
                                      "Alguno de los campos están vacíos, llenálos para poder continuar"),
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
                      try {
                        login();
                      } catch (_) {
                        print("exepcionnnnnnnnnnnnnnnnnnnnnnn");
                      }
                      showDialog(
                          context: context,
                          builder: (context) => Center(
                                child: SizedBox(
                                  width: 250,
                                  height: 250,
                                  child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
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
                                                valueColor:
                                                    new AlwaysStoppedAnimation(
                                                        Colors.white),
                                              ),
                                            ),
                                          ),
                                          Text("Cargando",
                                              style: TextStyle(
                                                  fontSize: 30.0,
                                                  color: Colors.white))
                                        ],
                                      )),
                                ),
                              ));
                    },
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    child: Text(
                      "Inicia Sesión",
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

  Future _testSing() async {
    try {
      final GoogleSignInAccount googleuser = await googleSignIn.signIn();
      final GoogleSignInAuthentication googleaut =
          await googleuser.authentication;
      final AuthCredential credential = GoogleAuthProvider.getCredential(
          accessToken: googleaut.accessToken, idToken: googleaut.idToken);
      final FirebaseUser user =
          (await _auth.signInWithCredential(credential)).user;

      if (user != null) {
        final response = await http.post(
            server+"/google.php",
            body: {
              "google": user.uid.toString(),
              "mail": user.email.toString(),
            }).timeout(Duration(seconds: 7));
        print(user.uid);
        print(response.body);
       
        var respuesta = json.decode(response.body);
        if(respuesta[0]=="3"&&respuesta[1]==true){
            Navigator.push(context, CupertinoPageRoute(builder: (_)=>RegisterUser(respuesta[2]['ID_USUARIO'])));

        }else if(respuesta[0]=="4"){
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
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20)),
                        ],
                      ),
                      content: Text(
                          "Debes completar tu registro para usar FindProgrammer"),
                      actions: <Widget>[
                        FlatButton(
                          onPressed: () {
                            Navigator.pop(context);
                           Navigator.push(context, CupertinoPageRoute(builder: (_)=>RegisterUser(respuesta[1]['ID_USUARIO'])));
                          },
                          child: Text("Aceptar",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 15)),
                        ),
                      ],
                    ));
 
        }else if(respuesta[0]==1){
Map<String, dynamic> MapDesarrollador = Map();

          helper.DeleteDesarrollador();
          MapDesarrollador['ID_USUARIO'] = respuesta[1]['ID_USUARIO'];
          MapDesarrollador['ID_DESARROLLADOR'] =
              respuesta[1]['ID_DESARROLLADOR'];

          MapDesarrollador['GOOGLE_ID'] = respuesta[1]['GOOGLE_ID'];
          MapDesarrollador['NOMBRE'] =utf8.decode(base64.decode(respuesta[1]['NOMBRE'])) ;
          MapDesarrollador['APELLIDO_P'] =utf8.decode(base64.decode(respuesta[1]['APELLIDO_P'])) ;
          MapDesarrollador['APELLIDO_M'] = utf8.decode(base64.decode(respuesta[1]['APELLIDO_M']));
          MapDesarrollador['CORREO'] =utf8.decode(base64.decode(respuesta[1]['CORREO'])) ;
          MapDesarrollador['FOTO'] = respuesta[1]['FOTO'];
          MapDesarrollador['CALIFICACION'] = respuesta[1]['CALIFICACION'];
          MapDesarrollador['F_ESTADO_REGISTRO'] =
              respuesta[1]['F_ESTADO_REGISTRO'];
          MapDesarrollador['PASSWORD'] = respuesta[1]['PASSWORD'];
          MapDesarrollador['TELEFONO'] =utf8.decode(base64.decode(respuesta[1]['TELEFONO'])) ;
          MapDesarrollador['F_BAJA_USUARIO'] = respuesta[1]['F_BAJA_USUARIO'];
          MapDesarrollador['F_ESTADO_LOGIN'] = respuesta[1]['F_ESTADO_LOGIN'];
          MapDesarrollador['CURP'] = utf8.decode(base64.decode(respuesta[1]['CURP']));
           print("llegue aqui[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[{{");
          MapDesarrollador['F_USUARIO_APRUEBA'] =
              respuesta[1]['F_USUARIO_APRUEBA'];
          MapDesarrollador['F_D_WEB'] = respuesta[1]['F_D_WEB'];
          MapDesarrollador['F_D_M_ANDROID'] = respuesta[1]['F_D_M_ANDROID'];
          MapDesarrollador['F_D_M_IOS'] = respuesta[1]['F_D_M_IOS'];
          MapDesarrollador['F_D_E_WINDOWS'] = respuesta[1]['F_D_E_WINDOWS'];
          MapDesarrollador['F_D_E_MAC'] = respuesta[1]['F_D_E_MAC'];
          MapDesarrollador['F_D_REDES'] = respuesta[1]['F_D_REDES'];
          MapDesarrollador['PREPARACION'] = utf8.decode(base64.decode(respuesta[1]['PREPARACION']));
          MapDesarrollador['PROYECTOS_TRABAJADOS'] =utf8.decode(base64.decode( respuesta[1]['PROYECTOS_TRABAJADOS']))
             ;
          MapDesarrollador['F_SISTEMA_BLOQUEADO'] =respuesta[1]['F_SISTEMA_BLOQUEADO'];
          print(MapDesarrollador.toString());

//insertar datos del programador logueado.
          var insertDesarrollador =
              await helper.InsertDesarrollador(MapDesarrollador);
          print("//$insertDesarrollador//");

          Navigator.pop(context);
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => HomeProgrammer()));

        }else if(respuesta[0]==2){

          Map<String, dynamic> MapCliente = Map();

          print(response.body);

helper.DeleteCliente();
         MapCliente['ID_USUARIO'] = respuesta[1]['ID_USUARIO'];
          MapCliente['NOMBRE'] = utf8.decode(base64.decode(respuesta[1]['NOMBRE']));
          MapCliente['APELLIDO_P'] = utf8.decode(base64.decode(respuesta[1]['APELLIDO_P']));
          MapCliente['APELLIDO_M'] = utf8.decode(base64.decode(respuesta[1]['APELLIDO_M']));
          MapCliente['CORREO'] = utf8.decode(base64.decode(respuesta[1]['CORREO']));
          MapCliente['FOTO'] = respuesta[1]['FOTO'];
          MapCliente['CALIFICACION'] = respuesta[1]['CALIFICACION'];
          MapCliente['F_ESTADO_REGISTRO'] = respuesta[1]['F_ESTADO_REGISTRO'];
          MapCliente['PASSWORD'] = respuesta[1]['PASSWORD'];
          MapCliente['TELEFONO'] = utf8.decode(base64.decode(respuesta[1]['TELEFONO']));
          MapCliente['F_BAJA_USUARIO'] = respuesta[1]['F_BAJA_USUARIO'];
          MapCliente['F_ESTADO_LOGIN'] = respuesta[1]['F_ESTADO_LOGIN'];
          MapCliente['CURP'] = utf8.decode(base64.decode(respuesta[1]['CURP']));
          MapCliente['F_USUARIO_APRUEBA'] = respuesta[1]['F_USUARIO_APRUEBA'];

          print(MapCliente.toString());

//insertar datos del programador logueado.
          var insertCliente = await helper.InsertCliente(MapCliente);
          print("//$insertCliente//");

          Navigator.pop(context);
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Homeclient()));
        }

      }
    } catch (e) {
      print("error firabase auth");
      print(e.toString());
    }
  }


   signOut(){
  googleSignIn.signOut();
  }

  Future login() async {
    //agrgada al documento
    print(mail.text.toLowerCase().trim());
    print(contrasena.text);
        var cliente=http.Client();
    try {
      final response = await cliente
          .post(server+"/login.php",
              // "http://192.168.84.114/findprogrammerDB/login.php",
                //     "http://192.168.0.5/findprogrammerDB/login.php",
              body: {
                "mail": mail.text.toLowerCase().trim(),
                "password": contrasena.text,
              })
          .timeout(Duration(seconds: 7))
          .whenComplete(() {
            Navigator.pop(context);
            
            return null;

          })
          .catchError((eeee) {
            http.Client().close();
            print("ERROR CON EL LOGIN");
            print(eeee.toString());
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
                          Text("LOGIN",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20)),
                        ],
                      ),
                      content: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 7,
                          ),
                          Container(
                            width: 240,
                            child: Text(
                              "Algo salió mal, inténtalo mas tarde",
                              textAlign: TextAlign.justify,
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                        ],
                      ),
                      actions: <Widget>[
                        FlatButton(
                          child: Text("Aceptar",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 15)),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ));
          });
      if (response == null) {
        return null;
      }
      print(response.body);
      print("se accedio");
      var datauser;
      try {
    
        datauser = json.decode(response.body);
      } catch (e) {
        Navigator.pop(context);

        print("hubo un error con el servidor");
        print(e.toString());
        return null;
      }finally{
        cliente.close();
      }

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
          if (datauser[1]['F_ESTADO_REGISTRO'] == "0") {
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
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20)),
                        ],
                      ),
                      content: Text(
                          "Debes completar tu registro para usar FindProgrammer"),
                      actions: <Widget>[
                        FlatButton(
                          onPressed: () {
                            
                            Navigator.pop(context);
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) => RegisterUser(
                                        datauser[1]['ID_USUARIO'])));
                          },
                          child: Text("Aceptar",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 15)),
                        ),
                      ],
                    ));
            return null;
          }
          Map<String, dynamic> MapDesarrollador = Map();

          print(response.body);
          print("llegue aqui[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[{{");
          helper.DeleteDesarrollador();
          MapDesarrollador['ID_USUARIO'] = datauser[1]['ID_USUARIO'];
          MapDesarrollador['ID_DESARROLLADOR'] =
              datauser[1]['ID_DESARROLLADOR'];

          MapDesarrollador['GOOGLE_ID'] = datauser[1]['GOOGLE_ID'];
          MapDesarrollador['NOMBRE'] =utf8.decode(base64.decode(datauser[1]['NOMBRE'])) ;
          MapDesarrollador['APELLIDO_P'] =utf8.decode(base64.decode(datauser[1]['APELLIDO_P'])) ;
          MapDesarrollador['APELLIDO_M'] = utf8.decode(base64.decode(datauser[1]['APELLIDO_M']));
          MapDesarrollador['CORREO'] =utf8.decode(base64.decode(datauser[1]['CORREO'])) ;
          MapDesarrollador['FOTO'] = datauser[1]['FOTO'];
          MapDesarrollador['CALIFICACION'] = datauser[1]['CALIFICACION'];
          MapDesarrollador['F_ESTADO_REGISTRO'] =
              datauser[1]['F_ESTADO_REGISTRO'];
          MapDesarrollador['PASSWORD'] = datauser[1]['PASSWORD'];
          MapDesarrollador['TELEFONO'] =utf8.decode(base64.decode(datauser[1]['TELEFONO'])) ;
          MapDesarrollador['F_BAJA_USUARIO'] = datauser[1]['F_BAJA_USUARIO'];
          MapDesarrollador['F_ESTADO_LOGIN'] = datauser[1]['F_ESTADO_LOGIN'];
          MapDesarrollador['CURP'] = utf8.decode(base64.decode(datauser[1]['CURP']));
           print("llegue aqui[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[{{");
          MapDesarrollador['F_USUARIO_APRUEBA'] =
              datauser[1]['F_USUARIO_APRUEBA'];
          MapDesarrollador['F_D_WEB'] = datauser[1]['F_D_WEB'];
          MapDesarrollador['F_D_M_ANDROID'] = datauser[1]['F_D_M_ANDROID'];
          MapDesarrollador['F_D_M_IOS'] = datauser[1]['F_D_M_IOS'];
          MapDesarrollador['F_D_E_WINDOWS'] = datauser[1]['F_D_E_WINDOWS'];
          MapDesarrollador['F_D_E_MAC'] = datauser[1]['F_D_E_MAC'];
          MapDesarrollador['F_D_REDES'] = datauser[1]['F_D_REDES'];
          MapDesarrollador['PREPARACION'] = utf8.decode(base64.decode(datauser[1]['PREPARACION']));
          MapDesarrollador['PROYECTOS_TRABAJADOS'] =utf8.decode(base64.decode( datauser[1]['PROYECTOS_TRABAJADOS']))
             ;
          MapDesarrollador['F_SISTEMA_BLOQUEADO'] =datauser[1]['F_SISTEMA_BLOQUEADO'];
          print(MapDesarrollador.toString());

//insertar datos del programador logueado.
          var insertDesarrollador =
              await helper.InsertDesarrollador(MapDesarrollador);
          print("//$insertDesarrollador//");

          Navigator.pop(context);
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => HomeProgrammer()));
        } else if (datauser[0] == 2) {
          print("¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿");
          if (datauser[1]['F_ESTADO_REGISTRO'] == "0") {
            print("@@@@@@@@@@@@@@@@@@@@@@@");
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
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20)),
                        ],
                      ),
                      content: Text(
                          "Debes completar tu registro para usar FindProgrammer"),
                      actions: <Widget>[
                        FlatButton(
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) => RegisterUser(
                                        datauser[1]['ID_USUARIO'])));
                          },
                          child: Text("Aceptar",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 15)),
                        ),
                      ],
                    ));
            return null;
          }

          Map<String, dynamic> MapCliente = Map();

          print(response.body);
  MapCliente['ID_USUARIO'] = datauser[1]['ID_USUARIO'];
          MapCliente['NOMBRE'] = utf8.decode(base64.decode(datauser[1]['NOMBRE']));
          MapCliente['APELLIDO_P'] = utf8.decode(base64.decode(datauser[1]['APELLIDO_P']));
          MapCliente['APELLIDO_M'] = utf8.decode(base64.decode(datauser[1]['APELLIDO_M']));
          MapCliente['CORREO'] = utf8.decode(base64.decode(datauser[1]['CORREO']));
          MapCliente['FOTO'] = datauser[1]['FOTO'];
          MapCliente['CALIFICACION'] = datauser[1]['CALIFICACION'];
          MapCliente['F_ESTADO_REGISTRO'] = datauser[1]['F_ESTADO_REGISTRO'];
          MapCliente['PASSWORD'] = datauser[1]['PASSWORD'];
          MapCliente['TELEFONO'] = utf8.decode(base64.decode(datauser[1]['TELEFONO']));
          MapCliente['F_BAJA_USUARIO'] = datauser[1]['F_BAJA_USUARIO'];
          MapCliente['F_ESTADO_LOGIN'] = datauser[1]['F_ESTADO_LOGIN'];
          MapCliente['CURP'] = utf8.decode(base64.decode(datauser[1]['CURP']));
          MapCliente['F_USUARIO_APRUEBA'] = datauser[1]['F_USUARIO_APRUEBA'];

          print(MapCliente.toString());

//insertar datos del programador logueado.
          var insertCliente = await helper.InsertCliente(MapCliente);
          print("//$insertCliente//");

          Navigator.pop(context);
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Homeclient()));
        }
      }
    } catch (w) {
      print("Excepcion en funcion login");
      print(w.toString());
    }
  }
}
