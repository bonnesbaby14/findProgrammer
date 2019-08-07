import 'package:flutter/material.dart';
import 'main.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

bool value = false;
bool hiden1 = false;
bool hiden2 = false;
int _groupvalue = 0;

class RegisterUser extends StatefulWidget {
  @override
  _RegisterUser createState() => new _RegisterUser();
}

class _RegisterUser extends State<RegisterUser> {
  File img;
  TextEditingController nombre = TextEditingController(),
      curp = TextEditingController(),
      correo = TextEditingController(),
      contrasena1 = TextEditingController(),
      contrasena2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.white,
        body: new Container(
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
                    "Completa la información",
                    style: TextStyle(fontSize: 38.0, color: Colors.white),
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
                height: 70.0,
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
                                  Text("Agregar Imagen",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 20)),
                                ],
                              ),
                              content: Text("Selecciona Camara o Galeria"),
                              actions: <Widget>[
                                FlatButton(
                                  onPressed: () async {
                                    img = null;
                                    img = await ImagePicker.pickImage(
                                        source: ImageSource.camera);
                                    Navigator.of(context).pop();
                                    setState(() {});
                                  },
                                  child: Text("Camara",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 15)),
                                ),
                                FlatButton(
                                  onPressed: () async {
                                    img = null;
                                    img = await ImagePicker.pickImage(
                                        source: ImageSource.gallery);
                                    Navigator.of(context).pop();
                                    setState(() {});
                                  },
                                  child: Text("Galeria",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 15)),
                                ),
                              ],
                            ));
                  },
                  child: Container(
                    margin: EdgeInsets.all(15.0),
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.white)),
                    child: Column(
                      children: img == null
                          ? <Widget>[
                              Icon(
                                Icons.camera_front,
                                size: 120.0,
                                color: Colors.white,
                              ),
                              Text(
                                "Subir Fotografia",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20.0),
                              ),
                            ]
                          : <Widget>[Image.file(img)],
                    ),
                  )),
              Theme(
                data: ThemeData(
                    unselectedWidgetColor: Colors.white,
                    hintColor: white,
                    primaryColor: white,
                    primaryColorDark: white),
                child: TextFormField(
                  controller: nombre,
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
                      labelText: "Nombre",
                      fillColor: Colors.white,
                      labelStyle: TextStyle(
                        color: Colors.white,
                      )),
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
                  controller: curp,
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
                    labelText: "CURP",
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
                  controller: correo,
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
                  controller: contrasena1,
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
                height: 30.0,
              ),

              Theme(
                data: ThemeData(
                    hintColor: white,
                    primaryColor: white,
                    primaryColorDark: white),
                child: TextFormField(
                  controller: contrasena2,
                  style: new TextStyle(
                    color: Colors.white,
                  ),
                  obscureText: hiden2 ? true : false,
                  decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      labelText: "Repetir Contraseña",
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            hiden2 = !hiden2;
                          });
                        },
                        icon: hiden2
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
                height: 30.0,
              ),

              Theme(
                  data: ThemeData(
                      hintColor: white,
                      primaryColor: white,
                      primaryColorDark: white),
                  child: Column(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Tipo de Cliente",
                          textAlign: TextAlign.left,
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        ),
                      ),
                      SizedBox(
                        height: 7.0,
                      ),
                      ButtonBar(
                        children: <Widget>[
                          Text(
                            "Persona",
                            textAlign: TextAlign.left,
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                          Theme(
                            data: ThemeData(
                                unselectedWidgetColor: Colors.white,
                                hintColor: white,
                                primaryColor: white,
                                primaryColorDark: white),
                            child: Radio(
                              onChanged: (int e) {
                                setState(() {
                                  _groupvalue = e;
                                });
                              },
                              activeColor: Colors.white,
                              value: 0,
                              groupValue: _groupvalue,
                            ),
                          ),
                          Text(
                            "Empresa",
                            textAlign: TextAlign.left,
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                          Theme(
                            data: ThemeData(
                                unselectedWidgetColor: Colors.white,
                                hintColor: white,
                                primaryColor: white,
                                primaryColorDark: white),
                            child: Radio(
                              onChanged: (int e) {
                                setState(() {
                                  _groupvalue = e;
                                });
                              },
                              activeColor: Colors.white,
                              value: 1,
                              groupValue: _groupvalue,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),

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
                      print(nombre.text +
                          " - " +
                          curp.text +
                          " - " +
                          correo.text +
                          " - " +
                          contrasena1.text +
                          " - " +
                          contrasena2.text);

                      if (nombre.text == "" ||
                          curp.text == "" ||
                          correo.text == "" ||
                          contrasena1.text == "" ||
                          contrasena2.text == "") {
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
                                      Text("Registrar Usuario",
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

                      if (img == null) {
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
                                      Text("Registrar Usuario",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20)),
                                    ],
                                  ),
                                  content: Text(
                                      "Debes subir una fotografia para poder continuar"),
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
                                    Text("Politicas de uso",
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 20)),
                                  ],
                                ),
                                content: Text(
                                    "Al dar click en Aceptar el usuario esta de acuerdo que todos los proyectos registrados asi como sus derechos de autor pasan a hacer de la comunidad por lo mismo cualquier persona sera capaz de copiar y repoducir este proyecto sin problema alguno"),
                                actions: <Widget>[
                                  FlatButton(
                                    child: Text("Aceptar",
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 15)),
                                    onPressed: () {},
                                  ),
                                  FlatButton(
                                    child: Text("Cancelar",
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 15)),
                                    onPressed: () {
                                      Navigator.pop(context);
                                      return;
                                    },
                                  ),
                                ],
                              ));
                    },
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    child: Text(
                      "Finalizar",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),

              //fin de el listview
            ],
          ),
        ));
  }
}
