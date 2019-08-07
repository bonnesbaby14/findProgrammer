import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'customIcons.dart';

const IconData menu = IconData(0xe900, fontFamily: "CustomIcons");
var _scaffoldKey = new GlobalKey<ScaffoldState>();
var contextoS;

class ViewHireProgrammer extends StatefulWidget {
  @override
  _ViewHireProgrammer createState() => new _ViewHireProgrammer();
}

class _ViewHireProgrammer extends State<ViewHireProgrammer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        drawer: new Drawer(),
        appBar: null,
        resizeToAvoidBottomPadding: false,
        body: new Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: Colors.deepPurpleAccent,
            image: DecorationImage(
              colorFilter: new ColorFilter.mode(
                  Colors.black.withOpacity(0.4), BlendMode.dstATop),
              image: AssetImage('assets/images/mountains.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          padding: EdgeInsets.fromLTRB(2.0, 0, 2.0, 0),
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: (MediaQuery.of(context).size.height / 3),
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
                      child: Text("Programadores  \n               Interesados",
                          textAlign: TextAlign.justify,
                          style:
                              TextStyle(fontSize: 30.0, color: Colors.white)),
                    ),
                    Expanded(
                      child: ListView(
                        children: <Widget>[],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Expanded(
                child: ListView(
                  children: <Widget>[
                    InkWell(
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
                                      Text("FindProgrammer",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20)),
                                      SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  ),
                                  content: Text(
                                      "¿Quieres contratar a este programador?"),
                                  actions: <Widget>[
                                    FlatButton(
                                      onPressed: () {},
                                      child: Text("Contratar",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15)),
                                    ),
                                    FlatButton(
                                      onPressed: () {},
                                      child: Text("Cancelar",
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
                              child: Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage(
                                          'assets/images/mountains.jpeg'),
                                    )),
                              ),
                            ),
                            Column(
                              children: <Widget>[
                                SizedBox(
                                  height: 25,
                                ),
                                Container(
                                  width: 160,
                                  child: Text("Gabriel Rodriguez",
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        color: Colors.white,
                                      )),
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                              ],
                            ),
                            Container(
                              width: 2.0,
                              height: 80,
                              decoration: BoxDecoration(color: Colors.white),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(26, 10, 0, 5),
                              child: Icon(
                                Icons.business_center,
                                size: 40,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
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
                                      Text("FindProgrammer",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20)),
                                      SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  ),
                                  content: Text(
                                      "¿Quieres contratar a este programador?"),
                                  actions: <Widget>[
                                    FlatButton(
                                      onPressed: () {},
                                      child: Text("Contratar",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15)),
                                    ),
                                    FlatButton(
                                      onPressed: () {},
                                      child: Text("Cancelar",
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
                              child: Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage(
                                          'assets/images/mountains.jpeg'),
                                    )),
                              ),
                            ),
                            Column(
                              children: <Widget>[
                                SizedBox(
                                  height: 25,
                                ),
                                Container(
                                  width: 160,
                                  child: Text("Angie Luis Espinoza",
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        color: Colors.white,
                                      )),
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                              ],
                            ),
                            Container(
                              width: 2.0,
                              height: 80,
                              decoration: BoxDecoration(color: Colors.white),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(26, 10, 0, 5),
                              child: Icon(
                                Icons.business_center,
                                size: 40,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
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
                                      Text("FindProgrammer",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20)),
                                      SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  ),
                                  content: Text(
                                      "¿Quieres contratar a este programador?"),
                                  actions: <Widget>[
                                    FlatButton(
                                      onPressed: () {},
                                      child: Text("Contratar",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15)),
                                    ),
                                    FlatButton(
                                      onPressed: () {},
                                      child: Text("Cancelar",
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
                              child: Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage(
                                          'assets/images/mountains.jpeg'),
                                    )),
                              ),
                            ),
                            Column(
                              children: <Widget>[
                                SizedBox(
                                  height: 25,
                                ),
                                Container(
                                  width: 160,
                                  child: Text("Alvaro Pintor",
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        color: Colors.white,
                                      )),
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                              ],
                            ),
                            Container(
                              width: 2.0,
                              height: 80,
                              decoration: BoxDecoration(color: Colors.white),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(26, 10, 0, 5),
                              child: Icon(
                                Icons.business_center,
                                size: 40,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
