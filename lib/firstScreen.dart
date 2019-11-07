import 'package:findprogrammer/login.dart';
import 'package:findprogrammer/registerUser.dart';
import 'package:findprogrammer/singUp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreen createState() => new _FirstScreen();
}

class _FirstScreen extends State<FirstScreen> {
  final notification =FlutterLocalNotificationsPlugin();
  @override
  void initState() {
    // TODO: implement initState
final settingAndroid =AndroidInitializationSettings('ic_launcher_background');
final settingIos=IOSInitializationSettings(onDidReceiveLocalNotification: (id,title,body,payload)=>onSelectNotification(payload));
notification.initialize(InitializationSettings(settingAndroid, settingIos),onSelectNotification: onSelectNotification);
    super.initState();
  }
  Future showOngoingNotification(
  FlutterLocalNotificationsPlugin notifications, {
  @required String title,
  @required String body,
  int id = 0,
}) =>
    _showNotification(notifications,
        title: title, body: body, id: id, type: _ongoing);
        Future _showNotification(
  FlutterLocalNotificationsPlugin notifications, {
  @required String title,
  @required String body,
  @required NotificationDetails type,
  int id = 0,
}) =>
    notifications.show(id, title, body, type);
  Future onSelectNotification(payload)async =>await Navigator.pop(context);
  NotificationDetails get _ongoing {
  final androidChannelSpecifics = AndroidNotificationDetails(
    '1',
    'your channel name',
    'your channel description',
    importance: Importance.Max,
    priority: Priority.High,
    ongoing: true,
    autoCancel: false,
  );
  
  final iOSChannelSpecifics = IOSNotificationDetails();
  return NotificationDetails(androidChannelSpecifics, iOSChannelSpecifics);
}

  @override
  Widget build(BuildContext context) {
  double mediaw=MediaQuery.of(context).size.width;
  double mediah=MediaQuery.of(context).size.height;
    return Scaffold(
        body: WillPopScope(
          onWillPop: (){
          return;
          },
      child: Container(
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
        child: new ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top:(mediah)*.15),
              child: Center(
                child: Icon(
                  Icons.devices_other,
                  color: Colors.white,
                  size: (mediah)*.17,
                ),
              ),
            ),
            Container( 
              padding: EdgeInsets.only(top: 5.0),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Find",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                  Text(
                    "Programmer",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: mediah *.1 ,
            ),
            new Container(
              width: mediaw,
              margin:
                  const EdgeInsets.only(left: 30.0, right: 30.0, top: 0),
              alignment: Alignment.center,
              child: new Row(
                children: <Widget>[
                  new Expanded(
                    child: new OutlineButton(
                      borderSide: BorderSide(color: Colors.white),
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0),
                      ),
                      onPressed: () {
                        Navigator.push(context, CupertinoPageRoute(builder: (context)=>SingUp()));
                      },
                      child: new Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 20.0,
                          horizontal: 20.0,
                        ),
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new Expanded(
                              child: Text(
                                "REGISTRATE",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            new Container(
              width: mediaw,
              margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0),
              alignment: Alignment.center,
              child: new Row(
                children: <Widget>[
                  new Expanded(
                    child: new FlatButton(
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0)),
                      color: Colors.white,
                      onPressed: () {
showOngoingNotification(notification,
                  title: 'OtherTitle', body: 'OtherBody', id: 20);
                      //   Navigator.push(context,
                      //       MaterialPageRoute(builder: (context) => Login()));
                       },
                      child: new Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 20.0,
                          horizontal: 20.0,
                        ),
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new Expanded(
                              child: Text(
                                "INICIA SESION",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.deepPurple,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
