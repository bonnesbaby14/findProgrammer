import 'package:flutter/material.dart';
import 'main.dart';
import 'package:flutter/cupertino.dart';

bool value = false;

class RegisterProgrammer extends StatefulWidget {
  @override
  _RegisterProgrammer createState() => new _RegisterProgrammer();
}

class _RegisterProgrammer extends State<RegisterProgrammer> {
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
                  height: 3.5,
                  color: Colors.white,
                ),
              ),
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
                          style: TextStyle(color: Colors.white, fontSize: 17),
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
                                  Text("Desarrollo web      ",
                                      style: TextStyle(
                                        color: Colors.white,
                                      )),
                                  Theme(
                                      data: Theme.of(context).copyWith(
                                          unselectedWidgetColor: Colors.white),
                                      child: Checkbox(
                                        checkColor: Colors.white,
                                        activeColor: Colors.deepPurpleAccent,
                                        value: false,
                                        onChanged: (bool _value) {},
                                      )),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Text("Desarrollo \n móvil (Android)",
                                      style: TextStyle(
                                        color: Colors.white,
                                      )),
                                  Theme(
                                      data: Theme.of(context).copyWith(
                                          unselectedWidgetColor: Colors.white),
                                      child: Checkbox(
                                        checkColor: Colors.white,
                                        activeColor: Colors.deepPurpleAccent,
                                        value: false,
                                        onChanged: (bool _value) {},
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
                                      data: Theme.of(context).copyWith(
                                          unselectedWidgetColor: Colors.white),
                                      child: Checkbox(
                                        checkColor: Colors.white,
                                        activeColor: Colors.deepPurpleAccent,
                                        value: false,
                                        onChanged: (bool _value) {},
                                      )),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Text("Desarrollador \n de RED               ",
                                      style: TextStyle(
                                        color: Colors.white,
                                      )),
                                  Theme(
                                      data: Theme.of(context).copyWith(
                                          unselectedWidgetColor: Colors.white),
                                      child: Checkbox(
                                        checkColor: Colors.white,
                                        activeColor: Colors.deepPurpleAccent,
                                        value: false,
                                        onChanged: (bool _value) {},
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
                                      data: Theme.of(context).copyWith(
                                          unselectedWidgetColor: Colors.white),
                                      child: Checkbox(
                                        checkColor: Colors.white,
                                        activeColor: Colors.deepPurpleAccent,
                                        value: false,
                                        onChanged: (bool _value) {},
                                      )),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Text("Desarrollo \n MAC OS             ",
                                      style: TextStyle(
                                        color: Colors.white,
                                      )),
                                  Theme(
                                      data: Theme.of(context).copyWith(
                                          unselectedWidgetColor: Colors.white),
                                      child: Checkbox(
                                        checkColor: Colors.white,
                                        activeColor: Colors.deepPurpleAccent,
                                        value: false,
                                        onChanged: (bool _value) {},
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
                  style: new TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    labelText: "Preparación Académica (Mención)",
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
                  style: new TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    labelText: "Proyectos Realizados (Mención)",
                    fillColor: Colors.white,
                  ),
                  cursorColor: Colors.white,
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
                                            color: Colors.black, fontSize: 20)),
                                  ],
                                ),
                                content: Text(
                                    "Al dar clic en Aceptar el usuario está de acuerdo que todos los proyectos registrados así como sus derechos de autor pasan a hacer de la comunidad por lo mismo cualquier persona será capaz de copiar y reproducir este proyecto sin problema alguno"),
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
                                    onPressed: () {},
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
