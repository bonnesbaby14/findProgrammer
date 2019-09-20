import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

int _groupValue2=0;
int _groupValue=0;
bool flat=false;
void alertEmptyField(context) {
  showDialog(
      context: context,
      builder: (context)=> CupertinoAlertDialog(
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
            Text("Error", style: TextStyle(color: Colors.black, fontSize: 20)),
          ],
        ),
        content: Text("Hay algún campo vacio"),
        actions: <Widget>[
          FlatButton(
            onPressed: () {},
            child: Text("Aceptar",
                style: TextStyle(color: Colors.black, fontSize: 15)),
          ),
        ],
      ));
}

void alertFinishProjectFinal(context) {
  showDialog(
      context: context,
    builder: (context)=>  CupertinoAlertDialog(
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
            Text("Terminar Proyecto",
                style: TextStyle(color: Colors.black, fontSize: 20)),
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
                "Felicidades por finalizar tu proyecto, para terminar el proyecto oficialmente necesitamos que el programador marque el proyecto finalizado tambien. Mientras lo hace califica y agrega un comentario a este programador!!!",
                textAlign: TextAlign.justify,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            FlutterRatingBar(
              initialRating: 3,
              fillColor: Colors.deepPurpleAccent,
              borderColor: Colors.black38,
              allowHalfRating: true,
              onRatingUpdate: (rating) {},
            ),
            Text("Calificacion rango: 0-10",
                style: TextStyle(color: Colors.black, fontSize: 10)),
            SizedBox(
              height: 8,
            ),
            CupertinoTextField(
              placeholder: "Comenta algo...",
              placeholderStyle: TextStyle(color: Colors.black38),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border:
                      Border.all(width: 0.5, color: Colors.deepPurpleAccent)),
            ),
          ],
        ),
        actions: <Widget>[
          FlatButton(
            onPressed: () {},
            child: Text("Aceptar",
                style: TextStyle(color: Colors.black, fontSize: 15)),
          ),
        ],
      )
      );
}

void alertFinishProjectSure(context) {
  showDialog(
      context: context,
      builder: (context)=>  CupertinoAlertDialog(
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
            Text("Terminar Proyecto ",
                style: TextStyle(color: Colors.black, fontSize: 20)),
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
                "¿Seguro que quieres dar por terminado el proyecto?",
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
            onPressed: () {
              alertFinishProjectFinal(context);
            },
            child: Text("Aceptar",
                style: TextStyle(color: Colors.black, fontSize: 15)),
          ),
          FlatButton(
            child: Text("Cancel",
                style: TextStyle(color: Colors.black, fontSize: 15)),
            onPressed: () {},
          ),
        ],
      ));
}

void alertAcceptReqClient(context) {
  showDialog(
      context: context,
      builder: (context)=>  CupertinoAlertDialog(
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
            Text("Aceptar Requerimientos",
                style: TextStyle(color: Colors.black, fontSize: 20)),
          ],
        ),
        content: Text(
            "¿Seguro que quieres aceptar los requermientos? El proramador se apegará a ellos para desarrollar el proyecto, por lo cual solo estará obligado a cumplir lo acordado en estos mismos."),
        actions: <Widget>[
          FlatButton(
            onPressed: () {},
            child: Text("Aceptar",
                style: TextStyle(color: Colors.black, fontSize: 15)),
          ),
          FlatButton(
            onPressed: () {},
            child: Text("Cancelar",
                style: TextStyle(color: Colors.black, fontSize: 15)),
          ),
        ],
      ));
}

void alertAddReqClient(context) {
  showDialog(
      context: context,
    builder: (context)=>  ListView(children: <Widget>[
        CupertinoAlertDialog(
            actions: <Widget>[
              FlatButton(
                onPressed: (){},
                child: Text("Añadir",
                    style: TextStyle(color: Colors.black, fontSize: 15)),
              ),
              FlatButton(
                onPressed: (){},
                child: Text("Cancelar",
                    style: TextStyle(color: Colors.black, fontSize: 15)),
              ),
            ],
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
                Text("Añadir Requerimiento",
                    style: TextStyle(color: Colors.black, fontSize: 20)),
              ],
            ),
            content: Column(children: <Widget>[
              SizedBox(
                height: 15,
              ),
              Container(
                height: 60,
                child: CupertinoTextField(
                  placeholder: "La aplicación se conecta a facebook",
                  placeholderStyle: TextStyle(color: Colors.black38),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          width: 0.5, color: Colors.deepPurpleAccent)),
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ]))
      ]));
}

void alertEditReqClient(context) {
  showDialog(
      context: context,
      builder: (context)=>  ListView(children: <Widget>[
        CupertinoAlertDialog(
            actions: <Widget>[
              FlatButton(
                onPressed: (){},
                child: Text("Editar",
                    style: TextStyle(color: Colors.black, fontSize: 15)),
              ),
              FlatButton(
                onPressed: (){},
                child: Text("Cancelar",
                    style: TextStyle(color: Colors.black, fontSize: 15)),
              ),
            ],
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
                Text("Editar Requerimiento",
                    style: TextStyle(color: Colors.black, fontSize: 20)),
              ],
            ),
            content: Column(children: <Widget>[
              SizedBox(
                height: 15,
              ),
              Container(
                height: 60,
                child: CupertinoTextField(
                  placeholder: "La aplicación se conecta a facebook",
                  placeholderStyle: TextStyle(color: Colors.black38),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          width: 0.5, color: Colors.deepPurpleAccent)),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 60,
                child: CupertinoTextField(
                  placeholder: "Observaciones",
                  placeholderStyle: TextStyle(color: Colors.black38),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          width: 0.5, color: Colors.deepPurpleAccent)),
                ),
              ),
            ]))
      ]));
}

void alertAddReqFormal(context) {
  showDialog(
      context: context,
    builder: (context)=>  CupertinoAlertDialog(
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
            Text("Agergar Requerimiento Formal",
                style: TextStyle(color: Colors.black, fontSize: 20)),
          ],
        ),
        content: CupertinoTextField(
          placeholder: "Requerimiento...",
          placeholderStyle: TextStyle(color: Colors.black38),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 0.5, color: Colors.deepPurpleAccent)),
        ),
        actions: <Widget>[
          FlatButton(
            onPressed: (){},
            child: Text("Agregar",
                style: TextStyle(color: Colors.black, fontSize: 15)),
          ),
          FlatButton(
            onPressed: (){},
            child: Text("Cancelar",
                style: TextStyle(color: Colors.black, fontSize: 15)),
          ),
        ],
      ));
}

void alertAdvanceAccepted(context) {
  showDialog(
      context: context,
      builder: (context)=>  CupertinoAlertDialog(
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
                style: TextStyle(color: Colors.black, fontSize: 20)),
          ],
        ),
        content: Text("Felicidades!!!\nEl avance fue aceptado por el cliente."),
        actions: <Widget>[
          FlatButton(
            onPressed: (){},
            child: Text("Aceptar",
                style: TextStyle(color: Colors.black, fontSize: 15)),
          ),
        ],
      ));
}

//no se si ponerlo o no, agregralo si een el futuro se necesita
// void alertAddReqFormal(context){
//   showDialog(
//                 context: context,
//                 child:CupertinoAlertDialog(
//                       actions: <Widget>[
//                         FlatButton(
//                           child: Text("Agregar",
//                               style:
//                                   TextStyle(color: Colors.black, fontSize: 15)),
//                         ),
//                         FlatButton(
//                           child: Text("Cancelar",
//                               style:
//                                   TextStyle(color: Colors.black, fontSize: 15)),
//                         ),
//                       ],
//                       title: Column(
//                         children: <Widget>[
//                           Icon(
//                             Icons.devices_other,
//                             size: 80,
//                             color: Colors.deepPurpleAccent,
//                           ),
//                           SizedBox(
//                             height: 20,
//                           ),
//                           Text("Agregar Requerimiento",
//                               style:
//                                   TextStyle(color: Colors.black, fontSize: 20)),
//                         ],
//                       ),
//                       content: Column(children: <Widget>[
//                         SizedBox(
//                           height: 15,
//                         ),
//                         Container(
//                           height: 60,
//                           child: CupertinoTextField(
//                             placeholder: "Requerimiento Faltante...",
//                             placeholderStyle: TextStyle(color: Colors.black38),
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(10),
//                                 border: Border.all(
//                                     width: 0.5,
//                                     color: Colors.deepPurpleAccent)),
//                           ),
//                         ),
//                         SizedBox(
//                           height: 10,
//                         ),

//                       ]
//                       )
//                       )
//                 );
// }

void alertSendReqFormal(context){
   showDialog(
                                  context: context,
                                  builder: (context)=>  CupertinoAlertDialog(
                                    actions: <Widget>[
                                      FlatButton(
                            onPressed: (){},
                                        child: Text("Enviar",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15)),
                                      ),
                                      FlatButton(
                                        
                                        onPressed: (){},
                                        child: Text("Cancelar",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15)),
                                      ),
                                    ],
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
                                        Text("Enviar Requerimientos",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20)),
                                      ],
                                    ),
                                    content: Text(
                                        "¿Seguro que quieres enviar la propuesta al cliente?"),
                                  ));
}


void alertReqFormalCreated(context){
  showDialog(
        context: context,
        builder: (context)=>  new CupertinoAlertDialog(
          title: Column(
            children: <Widget>[
                Icon(Icons.devices_other,size: 80,color: Colors.deepPurpleAccent,),
                SizedBox(height: 20,),
                Text("Requerimientos Formales",style: TextStyle(color: Colors.black,fontSize: 20 )),

            ],
          ),
          content: Text("Los requermientos formales ya fueron creados!!!"),
          
          actions: <Widget>[
            FlatButton(
              onPressed: (){},
              child: Text("Aceptar",style: TextStyle(color: Colors.black,fontSize: 15 )),
            ),
             
            
          ],
        )
      );
}



void alertHireProgrammerSure(context){
showDialog(
                            context: context,
                            builder: (context)=>  new CupertinoAlertDialog(
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
                                          color: Colors.black, fontSize: 20)),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                              content: Text(
                                  "¿Quieres contratar a este programador?"),
                              actions: <Widget>[
                                FlatButton(
                              
                              onPressed: (){},
                                  child: Text("Contratar",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 15)),
                                ),
                                FlatButton(
                              
                              onPressed: (){},
                                  child: Text("Cancelar",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 15)),
                                ),
                              ],
                            ));

}

void alertPolicies(context){
showDialog(
        context: context,
        builder: (context)=>  new CupertinoAlertDialog(
          title: Column(
            children: <Widget>[
                Icon(Icons.devices_other,size: 80,color: Colors.deepPurpleAccent,),
                SizedBox(height: 20,),
                Text("Politicas de uso",style: TextStyle(color: Colors.black,fontSize: 20 )),

            ],
          ),
          content: Text("Al dar click en Aceptar el usuario esta de acuerdo que todos los proyectos registrados asi como sus derechos de autor pasan a hacer de la comunidad por lo mismo cualquier persona sera capaz de copiar y repoducir este proyecto sin problema alguno"),
          actions: <Widget>[
            FlatButton(
              onPressed: (){},
              child: Text("Aceptar",style: TextStyle(color: Colors.black,fontSize: 15 )),
            ),
            FlatButton(
              onPressed: (){},
              child: Text("Cancelar",style: TextStyle(color: Colors.black,fontSize: 15 )),
            ),
          ],
        )
      );
}


void alertCreateAdvance(context ){
              showDialog(
              context: context,
              builder: (context)=>  ListView(
                children: <Widget>[
                  CupertinoAlertDialog(
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
                            style:
                                TextStyle(color: Colors.black, fontSize: 20)),
                      ],
                    ),
                    content: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 15,
                        ),
                        CupertinoTextField(
                          placeholder: "Tiempo de trabajo...",
                          placeholderStyle: TextStyle(color: Colors.black38),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  width: 0.5, color: Colors.deepPurpleAccent)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                       
                          child: CupertinoTextField(
                            placeholder: "Número de cambios",
                            placeholderStyle: TextStyle(color: Colors.black38),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    width: 0.5,
                                    color: Colors.deepPurpleAccent)),
                          ),
                        ),
                           SizedBox(
                          height: 10,
                        ),
                        Container(
                         
                          child: CupertinoTextField(
                            placeholder: "Cambio No.1",
                            placeholderStyle: TextStyle(color: Colors.black38),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    width: 0.5,
                                    color: Colors.deepPurpleAccent)),
                          ),
                        ),
                           SizedBox(
                          height: 10,
                        ),
                        Container(
                          
                          child: CupertinoTextField(
                            placeholder: "Cambio No.2",
                            placeholderStyle: TextStyle(color: Colors.black38),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    width: 0.5,
                                    color: Colors.deepPurpleAccent)),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CupertinoTextField(
                          placeholder: "Observaciones...",
                          placeholderStyle: TextStyle(color: Colors.black38),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  width: 0.5, color: Colors.deepPurpleAccent)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Porcentaje de proyecto"),
                        CupertinoSlider(
                          onChanged: (e){},
                          
                          max: 10,
                          min: 0,
                          activeColor: Colors.deepPurpleAccent,
                          value: 5,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Requerimientos completados",
                          style: TextStyle(color: Colors.black45),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: 180,
                              child: Text(
                                "Requerimiento 1 ",
                                textAlign: TextAlign.left,
                                style: TextStyle(color: Colors.black45),
                              ),
                            ),
                            Material(
                              color: Colors.transparent,
                              child: Radio(
                                groupValue: 1,
                                value: false,
                                onChanged: (e) {
                                  
                                },
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: 180,
                              child: Text(
                                "Requerimiento 2 ",
                                textAlign: TextAlign.left,
                                style: TextStyle(color: Colors.black45),
                              ),
                            ),
                            Material(
                              color: Colors.transparent,
                              child: Radio(
                                groupValue: 1,
                                value: false,
                                onChanged: (e) {
                               
                                },
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: 180,
                              child: Text(
                                "Requerimiento 3",
                                textAlign: TextAlign.left,
                                style: TextStyle(color: Colors.black45),
                              ),
                            ),
                            Material(
                              color: Colors.transparent,
                              child: Radio(
                                groupValue: 1,
                                value: false,
                                onChanged: (e) {
                                  
                                },
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: 180,
                              child: Text(
                                "Requerimiento 4",
                                textAlign: TextAlign.left,
                                style: TextStyle(color: Colors.black45),
                              ),
                            ),
                            Material(
                              color: Colors.transparent,
                              child: Radio(
                                groupValue: 1,
                                value: true,
                                onChanged: (e) {
                                  
                                },
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: 180,
                              child: Text(
                                "Requerimiento 5",
                                textAlign: TextAlign.left,
                                style: TextStyle(color: Colors.black45),
                              ),
                            ),
                            Material(
                              color: Colors.transparent,
                              child: Radio(
                                groupValue: 1,
                                value: true,
                                onChanged: (e) {
                                  
                                },
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: 180,
                              child: Text(
                                "Requerimiento 6 ",
                                textAlign: TextAlign.left,
                                style: TextStyle(color: Colors.black45),
                              ),
                            ),
                            Material(
                              color: Colors.transparent,
                              child: Radio(
                                groupValue: 1,
                                activeColor: Colors.deepPurpleAccent,
                                value: true,
                                onChanged: (e) {
                                  
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,),
                        
                        Container(
                          height: 120,
                          child: CupertinoTextField(
                            placeholder: "Enlaces...",
                            placeholderStyle: TextStyle(color: Colors.black38),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    width: 0.5,
                                    color: Colors.deepPurpleAccent)),
                          ),
                        ),
                      ],
                    ),
                    actions: <Widget>[
                      FlatButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text("Cancelar",
                            style:
                                TextStyle(color: Colors.black, fontSize: 15)),
                      ),
                      FlatButton(
                        onPressed: (){},
                        child: Text("Enviar Avance",
                            style:
                                TextStyle(color: Colors.black, fontSize: 15)),
                      ),
                    ],
                  )
                ],
              ),
            );
}

void alertCameraGallery(context){

}

void alertTypeUser(context){
showDialog(
        context: context,
        builder: (context)=>  new CupertinoAlertDialog(
          title: Column(
            children: <Widget>[
                Icon(Icons.devices_other,size: 80,color: Colors.deepPurpleAccent,),
                SizedBox(height: 20,),
                Text("¿Que tipo de Usuario Eres?",style: TextStyle(color: Colors.black,fontSize: 20 )),

            ],
          ),
          
          actions: <Widget>[
            FlatButton(
              onPressed: (){},
              child: Text("Programador",style: TextStyle(color: Colors.black,fontSize: 15 )),
            ),
            FlatButton(onPressed: (){},
              child: Text("Cliente",style: TextStyle(color: Colors.black,fontSize: 15 )),
            ),
          ],
        )
      );

}

void alertLogOut(context){
  


}

void alertEditProjectSure(context){
  showDialog(
              context: context,
              builder: (context)=>   CupertinoAlertDialog(
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
                        Text("Editar Proyecto",
                            style:
                                TextStyle(color: Colors.black, fontSize: 20)),
                      ],
                    ),
                    content: Column(
                      children: <Widget>[
                        Text("¿Seguro que quieres editar este proyecto?"),
                      ],
                    ),
                    actions: <Widget>[
                      FlatButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text("Cancelar",
                            style:
                                TextStyle(color: Colors.black, fontSize: 15)),
                      ),
                      FlatButton(
                        onPressed: (){},
                        child: Text("Editar",
                            style:
                                TextStyle(color: Colors.black, fontSize: 15)),
                      ),
                    ],
                  )
            );
}


void alertEditProject(context){
  showDialog(
              context: context,
              builder: (context)=>  ListView(
                children: <Widget>[
                  CupertinoAlertDialog(
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
                        Text("Editar Proyecto",
                            style:
                                TextStyle(color: Colors.black, fontSize: 20)),
                      ],
                    ),
                    content: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 15,
                        ),
                        CupertinoTextField(
                          placeholder: "Titulo...",
                          placeholderStyle: TextStyle(color: Colors.black38),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  width: 0.5, color: Colors.deepPurpleAccent)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 60,
                          child: CupertinoTextField(
                            placeholder: "Descripcion...",
                            placeholderStyle: TextStyle(color: Colors.black38),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    width: 0.5,
                                    color: Colors.deepPurpleAccent)),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CupertinoTextField(
                          placeholder: "Presupuesto...",
                          placeholderStyle: TextStyle(color: Colors.black38),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  width: 0.5, color: Colors.deepPurpleAccent)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Tipo de Proyecto",
                          style: TextStyle(color: Colors.black45),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: 180,
                              child: Text(
                                "Aplicación Movil (Android)  ",
                                textAlign: TextAlign.left,
                                style: TextStyle(color: Colors.black45),
                              ),
                            ),
                            Material(
                              color: Colors.transparent,
                              child: Radio(
                                groupValue: 1,
                                value: true,
                                onChanged: (e) {
                                 
                                },
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: 180,
                              child: Text(
                                "Aplicación Movil (IOS)     ",
                                textAlign: TextAlign.left,
                                style: TextStyle(color: Colors.black45),
                              ),
                            ),
                            Material(
                              color: Colors.transparent,
                              child: Radio(
                                groupValue: 1,
                                value: true,
                                onChanged: (e) {
                                 
                                },
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: 180,
                              child: Text(
                                "Aplicación Windows",
                                textAlign: TextAlign.left,
                                style: TextStyle(color: Colors.black45),
                              ),
                            ),
                            Material(
                              color: Colors.transparent,
                              child: Radio(
                                groupValue: 1,
                                value: true,
                                onChanged: (e) {
                                 
                                },
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: 180,
                              child: Text(
                                "Aplicación Mac OS",
                                textAlign: TextAlign.left,
                                style: TextStyle(color: Colors.black45),
                              ),
                            ),
                            Material(
                              color: Colors.transparent,
                              child: Radio(
                                groupValue: 1,
                                value: true,
                                onChanged: (e) {
                                  
                                },
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: 180,
                              child: Text(
                                "Sistema Web             ",
                                textAlign: TextAlign.left,
                                style: TextStyle(color: Colors.black45),
                              ),
                            ),
                            Material(
                              color: Colors.transparent,
                              child: Radio(
                                groupValue: 1,
                                value: true,
                                onChanged: (e) {
                                 
                                },
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: 180,
                              child: Text(
                                "Proyecto Redes      ",
                                textAlign: TextAlign.left,
                                style: TextStyle(color: Colors.black45),
                              ),
                            ),
                            Material(
                              color: Colors.transparent,
                              child: Radio(
                                groupValue: 1,
                                activeColor: Colors.deepPurpleAccent,
                                value: true,
                                onChanged: (e) {
                                 
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Frecuencia de entrega de avance",
                          style: TextStyle(color: Colors.black45),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: 180,
                              child: Text(
                                "Cada 15 dias ",
                                textAlign: TextAlign.left,
                                style: TextStyle(color: Colors.black45),
                              ),
                            ),
                            Material(
                              color: Colors.transparent,
                              child: Radio(
                                groupValue: 1,
                                value: true,
                                onChanged: (e) {
                                 
                                },
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: 180,
                              child: Text(
                                "Cada mes   ",
                                textAlign: TextAlign.left,
                                style: TextStyle(color: Colors.black45),
                              ),
                            ),
                            Material(
                              color: Colors.transparent,
                              child: Radio(
                                groupValue: 1,
                                value: true,
                                onChanged: (e) {
                               
                                },
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: 180,
                              child: Text(
                                "Cada 2 meses",
                                textAlign: TextAlign.left,
                                style: TextStyle(color: Colors.black45),
                              ),
                            ),
                            Material(
                              color: Colors.transparent,
                              child: Radio(
                                groupValue: 1,
                                value: true,
                                onChanged: (e) {
                                  
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: 180,
                              child: Text(
                                "Solictar Entregables",
                                textAlign: TextAlign.left,
                                style: TextStyle(color: Colors.black45),
                              ),
                            ),
                            Material(
                                color: Colors.transparent,
                                child: Checkbox(
                                  onChanged:(e){
                                    
                                  },
                                  
                                  value: true,
                                )),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 100,
                          child: CupertinoTextField(
                            placeholder: "Requerimientos...",
                            placeholderStyle: TextStyle(color: Colors.black38),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    width: 0.5,
                                    color: Colors.deepPurpleAccent)),
                          ),
                        ),

                      ],
                    ),
                    actions: <Widget>[
                      FlatButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text("Cancelar",
                            style:
                                TextStyle(color: Colors.black, fontSize: 15)),
                      ),
                      FlatButton(
                        onPressed: (){},
                        child: Text("Editar",
                            style:
                                TextStyle(color: Colors.black, fontSize: 15)),
                      ),
                    ],
                  )
                ],
              ),
            );
}

void alertCancelProjectSure(context){
   showDialog(
        context: context,
        builder: (context)=>  new CupertinoAlertDialog(
          title: Column(
            children: <Widget>[
                Icon(Icons.devices_other,size: 80,color: Colors.deepPurpleAccent,),
                SizedBox(height: 20,),
                Text("Cancelar Proyecto",style: TextStyle(color: Colors.black,fontSize: 20 )),

            ],
          ),
          content: Text("¿Seguro que quieres cancelar este proyecto?"),
          actions: <Widget>[
            FlatButton(
              onPressed: (){},
              child: Text("Aceptar",style: TextStyle(color: Colors.black,fontSize: 15 )),
            ),
            FlatButton(
              onPressed: (){},
              child: Text("Cancelar",style: TextStyle(color: Colors.black,fontSize: 15 )),
            ),
          ],
        )
      );
}

void alertAcceptAdvanceSure(context){
  showDialog(
        context: context,
        builder: (context)=>  new CupertinoAlertDialog(
          title: Column(
            children: <Widget>[
                Icon(Icons.devices_other,size: 80,color: Colors.deepPurpleAccent,),
                SizedBox(height: 20,),
                Text("Aceptar Avance",style: TextStyle(color: Colors.black,fontSize: 20 )),

            ],
          ),
          content: Text("¿Seguro que quieres aceptar este avance?"),
          
          actions: <Widget>[
            FlatButton(
              onPressed: (){},
              child: Text("Aceptar",style: TextStyle(color: Colors.black,fontSize: 15 )),
            ),
              FlatButton(
                onPressed: (){},
              child: Text("Cancelar",style: TextStyle(color: Colors.black,fontSize: 15 )),
            ),
            
          ],
        )
      );



}

void alertReportProgrammerSure(context){
showDialog(
        context: context,
        builder: (context)=>  new CupertinoAlertDialog(
          title: Column(
            children: <Widget>[
                Icon(Icons.devices_other,size: 80,color: Colors.deepPurpleAccent,),
                SizedBox(height: 20,),
                Text("Reportar Usuario",style: TextStyle(color: Colors.black,fontSize: 20 )),

            ],
          ),
          content: Column(

            children: <Widget>[

              Text("¿Seguro que quieres reportar a este programador?"),
              SizedBox(height: 8,),
              CupertinoTextField(
                placeholder: "Cuéntanos que paso",
                placeholderStyle:TextStyle(color: Colors.black38),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                border:Border.all(
                  width: 0.5,
                  color: Colors.deepPurpleAccent
                )
                ),
              ),
            ],
          ),
          
          actions: <Widget>[
            FlatButton(
              onPressed: (){},
              child: Text("Reportar",style: TextStyle(color: Colors.black,fontSize: 15 )),
            ),
            
          ],
        )
      );

}


void alertOverdudeAdvance(context){
  showDialog(
        context: context,
        builder: (context)=>  new CupertinoAlertDialog(
          title: Column(
            children: <Widget>[
                Icon(Icons.devices_other,size: 80,color: Colors.deepPurpleAccent,),
                SizedBox(height: 20,),
                Text("FindProgrammer",style: TextStyle(color: Colors.black,fontSize: 20 )),

            ],
          ),
          content: Text("Tienes un avance atrasado, entregálo para poder usar el sistema."),
          
          actions: <Widget>[
            FlatButton(
              onPressed: (){},
              child: Text("Aceptar",style: TextStyle(color: Colors.black,fontSize: 15 )),
            ),
         
            
          ],
        )
      );

}

void alertRequestCorrection(context){

  showDialog(
        context: context,
        builder: (context)=>  new CupertinoAlertDialog(
          title: Column(
            children: <Widget>[
                Icon(Icons.devices_other,size: 80,color: Colors.deepPurpleAccent,),
                SizedBox(height: 20,),
                Text("Correcion Avance",style: TextStyle(color: Colors.black,fontSize: 20 )),

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
                                                "         ¿Que salio mal en este avance?",
                                                textAlign: TextAlign.justify,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 8,
                                            ),
                                          
                                          
                                            CupertinoTextField(
                                              placeholder: "Observaciones...",
                                              placeholderStyle: TextStyle(
                                                  color: Colors.black38),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border: Border.all(
                                                      width: 0.5,
                                                      color: Colors
                                                          .deepPurpleAccent)),
                                            ),
                                          ],
                                        ),
          
          actions: <Widget>[
            FlatButton(
              onPressed: (){},
              child: Text("Aceptar",style: TextStyle(color: Colors.black,fontSize: 15 )),
            ),
              FlatButton(
                onPressed: (){},
              child: Text("Cancelar",style: TextStyle(color: Colors.black,fontSize: 15 )),
            ),
            
          ],
        )
      );

}

void alertCantEditProject(context){
  showDialog(
        context: context,
        builder: (context)=>  new CupertinoAlertDialog(
          title: Column(
            children: <Widget>[
                Icon(Icons.devices_other,size: 80,color: Colors.deepPurpleAccent,),
                SizedBox(height: 20,),
                Text("FindProgrammer",style: TextStyle(color: Colors.black,fontSize: 20 )),

            ],
          ),
          content: Text("No se puede editar el proyecto mientras esta en desarrollo."),
          
          actions: <Widget>[
            FlatButton(
              onPressed: (){},
              child: Text("Aceptar",style: TextStyle(color: Colors.black,fontSize: 15 )),
            ),
 
            
          ],
        )
      );

}

void alertProjectCode(context){
   showDialog(
        context: context,
        builder: (context)=>  new CupertinoAlertDialog(
          title: Column(
            children: <Widget>[
                Icon(Icons.devices_other,size: 80,color: Colors.deepPurpleAccent,),
                SizedBox(height: 20,),
                Text("Codigo de Proyecto",style: TextStyle(color: Colors.black,fontSize: 20 )),

            ],
          ),
          content: Column(

            children: <Widget>[
SizedBox(height: 15,),
             Row(mainAxisAlignment: MainAxisAlignment.center,
               crossAxisAlignment:CrossAxisAlignment.center ,
               children: <Widget>[
                  Text("AEUIO1234"),
                Padding(
                  padding:EdgeInsets.all(10),
                  child:   Icon(Icons.content_copy,color: Colors.black),
                ),
                    
                  

               ],
             ),
              SizedBox(height: 8,),
              
            ],
          ),
          
          actions: <Widget>[
            FlatButton(
              onPressed: (){},
              child: Text("Aceptar",style: TextStyle(color: Colors.black,fontSize: 15 )),
            ),
            
          ],
        )
      );


}


void alertSendReqSure(context){
  showDialog(
                            context: context,
                            builder: (context)=>  CupertinoAlertDialog(
                                  actions: <Widget>[
                                    FlatButton(
                                      onPressed: (){},
                                      child: Text("Enviar",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15)),
                                    ),
                                    FlatButton(
                                      onPressed: (){},
                                      child: Text("Cancelar",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15)),
                                    ),
                                  ],
                                  title: Column(
            children: <Widget>[
                Icon(Icons.devices_other,size: 80,color: Colors.deepPurpleAccent,),
                SizedBox(height: 20,),
                Text("Enviar Requerimientos",style: TextStyle(color: Colors.black,fontSize: 20 )),

            ],
          ),
                                  content: Text("¿Seguro que quieres enviar la propuesta al cliente?"),
                                  )
                            );
}

void alertSendCorrectionSure(context){
showDialog(
                            context: context,
                            builder: (context)=>  CupertinoAlertDialog(
                                  actions: <Widget>[
                                    FlatButton(
                                      onPressed: (){},
                                      child: Text("Enviar",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15)),
                                    ),
                                    FlatButton(
                                      onPressed: (){},
                                      child: Text("Cancelar",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15)),
                                    ),
                                  ],
                                  title: Column(
            children: <Widget>[
                Icon(Icons.devices_other,size: 80,color: Colors.deepPurpleAccent,),
                SizedBox(height: 20,),
                Text("Enviar Requerimientos",style: TextStyle(color: Colors.black,fontSize: 20 )),

            ],
          ),
                                  content: Text("¿Seguro que quieres enviar la corrección al programador?"),
                                  )
                            );


}

void alertRequestProjectSure(context){
  showDialog(
        context: context,
        builder: (context)=>  new CupertinoAlertDialog(
          title: Column(
            children: <Widget>[
                Icon(Icons.devices_other,size: 80,color: Colors.deepPurpleAccent,),
                SizedBox(height: 20,),
                Text("Solicitar Proyecto",style: TextStyle(color: Colors.black,fontSize: 20 )),

            ],
          ),
          content: Text("¿Seguro que quieres solictar este proyecto?"),
          
          actions: <Widget>[
            FlatButton(
              onPressed: (){},
              child: Text("Solicitar Proyecto",style: TextStyle(color: Colors.black,fontSize: 12 )),
            ),
            FlatButton(
              onPressed: (){},
              child: Text("Cancelar",style: TextStyle(color: Colors.black,fontSize: 13 )),
            ),
          ],
        )
      );


}

void alertNewVersionReq(context){
                          showDialog(
        context: context,
        builder: (context)=>  new CupertinoAlertDialog(
          title: Column(
            children: <Widget>[
                Icon(Icons.devices_other,size: 80,color: Colors.deepPurpleAccent,),
                SizedBox(height: 20,),
                Text("FindProgrammer",style: TextStyle(color: Colors.black,fontSize: 20 )),

            ],
          ),
          content:  Text("El Programador tiene una nueva versión de los requerimientos formales."),
          
          actions: <Widget>[
            FlatButton(
              onPressed: (){},
              child: Text("Ver ahora",style: TextStyle(color: Colors.black,fontSize: 15 )),
            ),
            
          ],
        )
      );
}


void alertNewCorrectionReq(context){
  showDialog(
        context: context,
        builder: (context)=>  new CupertinoAlertDialog(
          title: Column(
            children: <Widget>[
                Icon(Icons.devices_other,size: 80,color: Colors.deepPurpleAccent,),
                SizedBox(height: 20,),
                Text("FindProgrammer",style: TextStyle(color: Colors.black,fontSize: 20 )),

            ],
          ),
          content:  Text("El Cliente tiene una corrección de los requerimientos formales."),
          
          actions: <Widget>[
            FlatButton(
              onPressed: (){},
              child: Text("Ver ahora",style: TextStyle(color: Colors.black,fontSize: 15 )),
            ),
            
          ],
        )
      );
}

void alertAdvanceRejected(context){

  
                                  showDialog(
        context: context,
        builder: (context)=>  new CupertinoAlertDialog(
          title: Column(
            children: <Widget>[
                Icon(Icons.devices_other,size: 80,color: Colors.deepPurpleAccent,),
                SizedBox(height: 20,),
                Text("FindProgrammer",style: TextStyle(color: Colors.black,fontSize: 20 )),

            ],
          ),
          content: Text("El avance entrgado fue rechazado por el cliente. Manda otro cuanto antes. \n Observaciones: 'No se han hecho cambios desde el ultimo avance, porfavor entregar algo nuevo. ' "),
          
          actions: <Widget>[
            FlatButton(
              onPressed: (){},
              child: Text("Crear nuevo avance",style: TextStyle(color: Colors.black,fontSize: 15 )),
            ),
             
            
          ],
        )
      );
}


