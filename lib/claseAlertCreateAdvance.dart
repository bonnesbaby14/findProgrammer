import 'package:findprogrammer/componentes/reqRadio.dart';
import 'package:findprogrammer/viewProjectProgrammerPanel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'homeClient.dart';

TextEditingController tdcTimepo = TextEditingController();
TextEditingController tdcNumeroCambio = TextEditingController();
TextEditingController tdcCambios = TextEditingController();
TextEditingController tdcRequerimientos = TextEditingController();
TextEditingController tdcObservaciones = TextEditingController();
TextEditingController tdcDescripcion = TextEditingController();
TextEditingController tdcEnlaces = TextEditingController();

int intReq = 0;
double intPorcentaje = 0;

var boleanos = new List<bool>();
String sReq = "";
bool flat = false;
var listRadios = new List<Widget>();
var req = new List<ReqRadio>();

//clase para la alerta con estado
class AlertCreateAdvance extends StatefulWidget {
  @override
  _AlertCreateAdvance createState() => new _AlertCreateAdvance();
}

class _AlertCreateAdvance extends State<AlertCreateAdvance> {
  @override
  void initState() {
    req = new List<ReqRadio>();
    // TODO: implement initState
    for (int x = 0; x < reqFuncionales.length; x++) {
      req.add(ReqRadio(reqFuncionales[x]["ID_REQ_F"].toString(),
          reqFuncionales[x]["REQUERIMIENTO"].toString(), false));
    }
  }

  @override
  Widget build(BuildContext context) {
    listRadios = new List<Widget>();
    boleanos = new List<bool>();

    var s = reqFuncionales;

    if (req != null) {
      for (int x = 0; x < req.length; x++) {
        listRadios.add(Padding(
          padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 130,
                child: Text(
                  req[x].req,
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.black45),
                ),
              ),
              Material(
                  color: Colors.transparent,
                  child: Checkbox(
                    activeColor: Colors.deepPurpleAccent,
                    onChanged: (e) {
                      print("clicl");
                      setState(() {
                        print(req[x].valor);
                        req[x].valor = e;
                        print("clicl");
                        print(req[x].valor);
                      });
                    },
                    value: req[x].valor,
                  ))
            ],
          ),
        ));
      }
    }

    var d = boleanos;
    return SingleChildScrollView(
        child: CupertinoAlertDialog(
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
          Text("Entregar Avance",
              style: TextStyle(color: Colors.black, fontSize: 20)),
        ],
      ),
      content: Column(
        children: <Widget>[
          SizedBox(
            height: 15,
          ),
          CupertinoTextField(
            controller: tdcTimepo,
            placeholder: "Tiempo de trabajo...",
            placeholderStyle: TextStyle(color: Colors.black38),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 0.5, color: Colors.deepPurpleAccent)),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: CupertinoTextField(
              controller: tdcDescripcion,
              placeholder: "Descripción",
              placeholderStyle: TextStyle(color: Colors.black38),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border:
                      Border.all(width: 0.5, color: Colors.deepPurpleAccent)),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: CupertinoTextField(
              controller: tdcNumeroCambio,
              placeholder: "Número de cambios",
              placeholderStyle: TextStyle(color: Colors.black38),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border:
                      Border.all(width: 0.5, color: Colors.deepPurpleAccent)),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: CupertinoTextField(
              controller: tdcCambios,
              placeholder: "Cambio No.1...",
              placeholderStyle: TextStyle(color: Colors.black38),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border:
                      Border.all(width: 0.5, color: Colors.deepPurpleAccent)),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          CupertinoTextField(
            controller: tdcObservaciones,
            placeholder: "Observaciones...",
            placeholderStyle: TextStyle(color: Colors.black38),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 0.5, color: Colors.deepPurpleAccent)),
          ),
          SizedBox(
            height: 10,
          ),
          Text("Porcentaje de proyecto"),
          CupertinoSlider(
            onChanged: (e) {
              setState(() {
                intPorcentaje = e;
              });
            },
            max: 10,
            min: 0,
            activeColor: Colors.deepPurpleAccent,
            value: intPorcentaje,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Requerimientos completados",
            style: TextStyle(color: Colors.black45),
          ),
          Column(
            children: listRadios,
          ),
          SizedBox(
            height: 10,
          ),
          CupertinoTextField(
            maxLines: null,
            keyboardType: TextInputType.multiline,
            controller: tdcEnlaces,
            placeholder: "Enlaces...",
            placeholderStyle: TextStyle(color: Colors.black38),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 0.5, color: Colors.deepPurpleAccent)),
          ),
        ],
      ),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text("Cancelar",
              style: TextStyle(color: Colors.black, fontSize: 15)),
        ),
        FlatButton(
          onPressed: () async {
            sReq = "";
            for (int x = 0; x < req.length; x++) {
              sReq +=
                  req[x].id.toString() + "-" + req[x].valor.toString() + "/";
            }
            createAdvance();

            await //createAdvance();
                Navigator.pop(context);
          },
          child: Text("Enviar Avance",
              style: TextStyle(color: Colors.black, fontSize: 15)),
        ),
      ],
    ));
  }
}
