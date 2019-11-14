import 'package:findprogrammer/login.dart';
import 'package:flutter/material.dart';
import 'componentes/variables.dart';
import 'main.dart';
import 'package:async/async.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

bool value = false;
bool hiden1 = false;
bool hiden2 = false;
int _groupvalue = 0;
int _groupvalue2 = 0;
bool mac = false,
    windows = false,
    android = false,
    ios = false,
    redes = false,
    web = false;

class RegisterUser extends StatefulWidget {
  var ID;
  RegisterUser(this.ID);
  @override
  _RegisterUser createState() => new _RegisterUser(this.ID);
}

class _RegisterUser extends State<RegisterUser> {
  var ID;
  _RegisterUser(this.ID);
  File img;
  TextEditingController nombre = TextEditingController(),
      apellidoP = TextEditingController(),
      apellidoM = TextEditingController(),
      curp = TextEditingController(),
      telefono = TextEditingController(),
      proyectos = TextEditingController(),
      preparacion = TextEditingController();

  @override
  Widget build(BuildContext context) {
 
    print("el id obtenido es: " + ID);
    double mediaw = MediaQuery.of(context).size.width;
    double mediah = MediaQuery.of(context).size.height;
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.white,
        body: new Container(
          height: mediah,
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
            padding: EdgeInsets.fromLTRB(15.0, 0, 15.0, 0),
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
                              content: Text("Selecciona Cámara o Galería"),
                              actions: <Widget>[
                                FlatButton(
                                  onPressed: () async {
                                    try {
                                      img = null;
                                      img = await ImagePicker.pickImage(
                                          source: ImageSource.camera,imageQuality: 20);
                                    } catch (e) {}

                                    Navigator.of(context).pop();
                                    setState(() {});
                                  },
                                  child: Text("Cámara",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 15)),
                                ),
                                FlatButton(
                                  onPressed: () async {
                                    try {
                                      img = null;
                                      img = await ImagePicker.pickImage(
                                          source: ImageSource.gallery,imageQuality: 20);
                                    } catch (e) {}

                                    Navigator.of(context).pop();
                                    setState(() {});
                                  },
                                  child: Text("Galería",
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
                                "Subir Fotografía",
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
                  maxLength: 40,
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
                    unselectedWidgetColor: Colors.white,
                    hintColor: white,
                    primaryColor: white,
                    primaryColorDark: white),
                child: TextFormField(
                  controller: apellidoP,
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
                      labelText: "Apellido Paterno",
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
                    unselectedWidgetColor: Colors.white,
                    hintColor: white,
                    primaryColor: white,
                    primaryColorDark: white),
                child: TextFormField(
                  controller: apellidoM,
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
                      labelText: "Apellido Materno",
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
                  maxLength:18,
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
                  controller: telefono,
                  maxLength: 20,
                  keyboardType: TextInputType.phone,
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
                    labelText: "Teléfono",
                    fillColor: Colors.white,
                  ),
                  cursorColor: Colors.white,
                ),
              ),
              SizedBox(
                height: 30.0,
              ),

              Container(
                width: mediaw - 10,
                child: Theme(
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
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                            Theme(
                              data: ThemeData(
                                  unselectedWidgetColor: Colors.white,
                                  hintColor: white,
                                  primaryColor: white,
                                  primaryColorDark: white),
                              child: Radio(
                                activeColor: Colors.white,
                                value: 0,
                                groupValue: _groupvalue,
                                onChanged: (int e) {
                                  setState(() {
                                    _groupvalue = e;
                                  });
                                },
                              ),
                            ),
                            Text(
                              "Empresa",
                              textAlign: TextAlign.left,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                            Theme(
                              data: ThemeData(
                                  unselectedWidgetColor: Colors.white,
                                  hintColor: white,
                                  primaryColor: white,
                                  primaryColorDark: white),
                              child: Radio(
                                activeColor: Colors.white,
                                value: 1,
                                groupValue: _groupvalue,
                                onChanged: (int e) {
                                  setState(() {
                                    _groupvalue = e;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 7.0,
                        ),
                        ButtonBar(
                          children: <Widget>[
                            Text(
                              "Cliente",
                              textAlign: TextAlign.left,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                            Theme(
                              data: ThemeData(
                                  unselectedWidgetColor: Colors.white,
                                  hintColor: white,
                                  primaryColor: white,
                                  primaryColorDark: white),
                              child: Radio(
                                activeColor: Colors.white,
                                value: 0,
                                groupValue: _groupvalue2,
                                onChanged: (int e) {
                                  setState(() {
                                    _groupvalue2 = e;
                                  });
                                },
                              ),
                            ),
                            Text(
                              "Desarrollador",
                              textAlign: TextAlign.left,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                            Theme(
                              data: ThemeData(
                                  unselectedWidgetColor: Colors.white,
                                  hintColor: white,
                                  primaryColor: white,
                                  primaryColorDark: white),
                              child: Radio(
                                activeColor: Colors.white,
                                value: 1,
                                groupValue: _groupvalue2,
                                onChanged: (int e) {
                                  setState(() {
                                    _groupvalue2 = e;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        _groupvalue2 == 1
                            ? Column(
                                children: <Widget>[
                                  SizedBox(
                                    height: 20,
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
                                              "Especialidad",
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 17),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 7.0,
                                          ),
                                          Column(
                                            children: <Widget>[
                                              Row(
                                                children: <Widget>[
                                                  Row(
                                                    children: <Widget>[
                                                      Text(
                                                          "Desarrollo web      ",
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                          )),
                                                      Theme(
                                                          data: Theme.of(
                                                                  context)
                                                              .copyWith(
                                                                  unselectedWidgetColor:
                                                                      Colors
                                                                          .white),
                                                          child: Checkbox(
                                                            checkColor:
                                                                Colors.white,
                                                            activeColor: Colors
                                                                .deepPurpleAccent,
                                                            value: web,
                                                            onChanged:
                                                                (bool _value) {
                                                              setState(() {
                                                                web = _value;
                                                              });
                                                            },
                                                          )),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: <Widget>[
                                                      Text(
                                                          "Desarrollo \n móvil (Android)",
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                          )),
                                                      Theme(
                                                          data: Theme.of(
                                                                  context)
                                                              .copyWith(
                                                                  unselectedWidgetColor:
                                                                      Colors
                                                                          .white),
                                                          child: Checkbox(
                                                            checkColor:
                                                                Colors.white,
                                                            activeColor: Colors
                                                                .deepPurpleAccent,
                                                            value: android,
                                                            onChanged:
                                                                (bool _value) {
                                                              setState(() {
                                                                android =
                                                                    _value;
                                                              });
                                                            },
                                                          )),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: <Widget>[
                                                  Row(
                                                    children: <Widget>[
                                                      Text(
                                                          "Desarrollador \n móvil (IOS)            ",
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                          )),
                                                      Theme(
                                                          data: Theme.of(
                                                                  context)
                                                              .copyWith(
                                                                  unselectedWidgetColor:
                                                                      Colors
                                                                          .white),
                                                          child: Checkbox(
                                                            checkColor:
                                                                Colors.white,
                                                            activeColor: Colors
                                                                .deepPurpleAccent,
                                                            value: ios,
                                                            onChanged:
                                                                (bool _value) {
                                                              setState(() {
                                                                ios = _value;
                                                              });
                                                            },
                                                          )),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: <Widget>[
                                                      Text(
                                                          "Desarrollador \n de RED               ",
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                          )),
                                                      Theme(
                                                          data: Theme.of(
                                                                  context)
                                                              .copyWith(
                                                                  unselectedWidgetColor:
                                                                      Colors
                                                                          .white),
                                                          child: Checkbox(
                                                            checkColor:
                                                                Colors.white,
                                                            activeColor: Colors
                                                                .deepPurpleAccent,
                                                            value: redes,
                                                            onChanged:
                                                                (bool _value) {
                                                              setState(() {
                                                                redes = _value;
                                                              });
                                                            },
                                                          )),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: <Widget>[
                                                  Row(
                                                    children: <Widget>[
                                                      Text(
                                                          "Desarrollador \n Windows               ",
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                          )),
                                                      Theme(
                                                          data: Theme.of(
                                                                  context)
                                                              .copyWith(
                                                                  unselectedWidgetColor:
                                                                      Colors
                                                                          .white),
                                                          child: Checkbox(
                                                            checkColor:
                                                                Colors.white,
                                                            activeColor: Colors
                                                                .deepPurpleAccent,
                                                            value: windows,
                                                            onChanged:
                                                                (bool _value) {
                                                              setState(() {
                                                                windows =
                                                                    _value;
                                                              });
                                                            },
                                                          )),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: <Widget>[
                                                      Text(
                                                          "Desarrollo \n MAC OS             ",
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                          )),
                                                      Theme(
                                                          data: Theme.of(
                                                                  context)
                                                              .copyWith(
                                                                  unselectedWidgetColor:
                                                                      Colors
                                                                          .white),
                                                          child: Checkbox(
                                                            checkColor:
                                                                Colors.white,
                                                            activeColor: Colors
                                                                .deepPurpleAccent,
                                                            value: mac,
                                                            onChanged:
                                                                (bool _value) {
                                                              setState(() {
                                                                mac = _value;
                                                              });
                                                            },
                                                          )),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      )),
                                  Theme(
                                    data: ThemeData(
                                        hintColor: white,
                                        primaryColor: white,
                                        primaryColorDark: white),
                                    child: TextFormField(
                                      maxLength: 40,
                                      controller: preparacion,
                                      style: new TextStyle(
                                        color: Colors.white,
                                      ),
                                      decoration: InputDecoration(
                                        labelText:
                                            "Preparación Academica (Mención)",
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
                                      maxLength: 80,
                                      controller: proyectos,
                                      style: new TextStyle(
                                        color: Colors.white,
                                      ),
                                      decoration: InputDecoration(
                                        labelText:
                                            "Proyectos Realizados (Mención)",
                                        fillColor: Colors.white,
                                      ),
                                      cursorColor: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 55.0,
                                  ),
                                ],
                              )
                            : Container(),
                      ],
                    )),
              ),

              SizedBox(height: mediah * .03),
              Align(
                child: SizedBox(
                  height: 50.0,
                  width: 270.0,
                  child: OutlineButton(
                    borderSide: BorderSide(color: Colors.white),
                    onPressed: () {
                      if (_groupvalue2 == 1) {
                        if (nombre.text == "" ||
                            curp.text == "" ||
                            apellidoM.text == "" ||
                            apellidoP.text == "" ||
                            telefono.text == "" ||
                            proyectos.text == "" ||
                            preparacion.text == "" ||
                            (!mac &&
                                !ios &&
                                !windows &&
                                !web &&
                                !android &&
                                !redes)) {
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
                                        "Alguno de los campos esta vacío, llénalos para poder continuar"),
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
                                        "Debes subir una fotografía para poder continuar"),
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
                                      Text("Políticas de uso",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20)),
                                    ],
                                  ),
                                  content: Text(
                                      "Al dar clic en Aceptar el usuario está de acuerdo que todos los proyectos registrados así como sus derechos de autor pasan a hacer de la comunidad por lo mismo cualquier persona será capaz de copiar y reproducir este proyecto sin problema alguno"),
                                  actions: <Widget>[
                                    FlatButton(
                                      child: Text("Aceptar",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15)),
                                      onPressed: () {
                                        Navigator.pop(context);
                                        print("clic");
                                        ReRegisterUserDeveloper();
                                      },
                                    ),
                                    FlatButton(
                                      child: Text("Cancelar",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15)),
                                      onPressed: () {
                                        Navigator.pop(context);
                                        return;
                                      },
                                    ),
                                  ],
                                ));
                      } else {
                        if (nombre.text == "" ||
                            curp.text == "" ||
                            apellidoM.text == "" ||
                            apellidoP.text == "" ||
                            telefono.text == "") {
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
                                        "Alguno de los campos esta vacío, llénalos para poder continuar"),
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
                                        "Debes subir una fotografía para poder continuar"),
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
                                      Text("Políticas de uso",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20)),
                                    ],
                                  ),
                                  content: Text(
                                      "Al dar clic en Aceptar el usuario está de acuerdo que todos los proyectos registrados así como sus derechos de autor pasan a hacer de la comunidad por lo mismo cualquier persona será capaz de copiar y reproducir este proyecto sin problema alguno"),
                                  actions: <Widget>[
                                    FlatButton(
                                      child: Text("Aceptar",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15)),
                                      onPressed: ()async {
                                        Navigator.pop(context);
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

                                        await ReRegisterUser();
                                        Navigator.pop(context);
                                      },
                                    ),
                                    FlatButton(
                                      child: Text("Cancelar",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15)),
                                      onPressed: () {
                                        Navigator.pop(context);
                                        return;
                                      },
                                    ),
                                  ],
                                ));
                      }
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

  Future ReRegisterUser() async {
    try {
      print("ññññññññññññññññññññññññññññ");

      print("ññññññññññññññññññññññññññññ");

      final response = await http.post(
          server+"/registerUser2.php",
          body: {
            "ID": ID.toString(),
            "NOMBRE": nombre.text,
            "CURP": curp.text,
            "APELLIDOP": apellidoP.text,
            "APELLIDOM": apellidoM.text,
            "TELEFONO": telefono.text,
            "TIPO": _groupvalue == 1 ? "1" : "0",
          }).timeout(Duration(seconds: 7));
      print(response.body);
      print("66666666666666666666666666");

      var strem = http.ByteStream(DelegatingStream.typed(img.openRead()));
      var length = await img.length();
      var uri =
          Uri.parse(server+"/image.php");
      var request = http.MultipartRequest("POST", uri);
      var multipartFile = http.MultipartFile("image", strem, length,
          filename: "image_" + ID.toString() + ".jpg");
      request.files.add(multipartFile);
      var response2 = await request.send();
      if (response2.statusCode == 200) {
        print("si se pudo");
      } else {
        print("no se puedo");
        print(response2.statusCode);
      }

      Navigator.pop(context);

      switch (response.body) {
        case "1":
          //registro completo
          if (_groupvalue2 == 0) {
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
                          "Usuario creado con éxito, Bienvenido a FindProgrammer, inicia sesión para comenzar"),
                      actions: <Widget>[
                        FlatButton(
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) => Login()));
                          },
                          child: Text("Aceptar",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 15)),
                        ),
                      ],
                    ));
          }
          break;
        case "5":
          //correo
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
                        "El CURP ya fue registrado, intenta iniciar sesión"),
                    actions: <Widget>[
                      FlatButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Aceptar",
                            style:
                                TextStyle(color: Colors.black, fontSize: 15)),
                      ),
                    ],
                  ));

          break;
        case "":
//error del server
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
                        "Ocurrió un problema en el servidor o en la red, inténtalo más tarde"),
                    actions: <Widget>[
                      FlatButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Aceptar",
                            style:
                                TextStyle(color: Colors.black, fontSize: 15)),
                      ),
                    ],
                  ));

          break;
      }
    } catch (d) {
      print("error registrando el usuario ");
      print(d.toString());
      Navigator.pop(context);
    }
  }

  Future ReRegisterUserDeveloper() async {
    try {
      print("ññññññññññññññññññññññññññññ");

      print("ññññññññññññññññññññññññññññ");

      final response = await http.post(
          server+"/registerUser2D.php",
          body: {
            "ID": ID.toString(),
            "NOMBRE": nombre.text,
            "CURP": curp.text,
            "APELLIDOP": apellidoP.text,
            "APELLIDOM": apellidoM.text,
            "TELEFONO": telefono.text,
            "TIPO": _groupvalue == 1 ? "1" : "0",
            "PROYECTOS": proyectos.text,
            "PREPARACION": preparacion.text,
            "WEB": web ? "1" : "0",
            "IOS": ios ? "1" : "0",
            "ANDROID": android ? "1" : "0",
            "REDES": redes ? "1" : "0",
            "WINDOWS": windows ? "1" : "0",
            "MAC": mac ? "1" : "0",
          }).timeout(Duration(seconds: 7));
      print(response.body);
      print("66666666666666666666666666");

      var strem = http.ByteStream(DelegatingStream.typed(img.openRead()));
      var length = await img.length();
      var uri =
          Uri.parse(server+"/image.php");
      var request = http.MultipartRequest("POST", uri);
      var multipartFile = http.MultipartFile("image", strem, length,
          filename: "image_" + ID.toString() + ".jpg");
      request.files.add(multipartFile);
      var response2 = await request.send();
      if (response2.statusCode == 200) {
        print("si se pudo");
      } else {
        print("no se puedo");
        print(response2.statusCode);
      }

      switch (response.body) {
        case "1":
          //registro completo
          if (_groupvalue2 == 1) {
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
                          "Usuario creado con exito, Bienvenido a FindProgrammer, incia sesión para comenzar"),
                      actions: <Widget>[
                        FlatButton(
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) => Login()));
                          },
                          child: Text("Aceptar",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 15)),
                        ),
                      ],
                    ));
          }
          break;
        case "5":
          //correo
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
                        "La CURP ya fue registrada, intenta iniciar sesión"),
                    actions: <Widget>[
                      FlatButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Aceptar",
                            style:
                                TextStyle(color: Colors.black, fontSize: 15)),
                      ),
                    ],
                  ));

          break;
        case "":
//error del server
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
                        "Ocurrió un problema en el servidor o en la red, inténtalo mas tarde"),
                    actions: <Widget>[
                      FlatButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Aceptar",
                            style:
                                TextStyle(color: Colors.black, fontSize: 15)),
                      ),
                    ],
                  ));

          break;
      }
    } catch (d) {
      print("error registrando el usuario ");
      print(d.toString());
      Navigator.pop(context);
    }
  }
}
