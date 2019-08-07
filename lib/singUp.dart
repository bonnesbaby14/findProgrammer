import 'package:flutter/material.dart';
import 'main.dart';


class SingUp extends StatefulWidget {
  @override
  _SingUp createState() => new _SingUp();
}

class _SingUp extends State<SingUp> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.white,
        body: 
        new Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: Colors.deepPurpleAccent,
        image: DecorationImage(
          colorFilter: new ColorFilter.mode(
              Colors.black.withOpacity(0.3), BlendMode.dstATop
              ),
          image: AssetImage('assets/images/mountains.jpg'
          ),
          fit: BoxFit.cover,
        ),
      ),
        child:  ListView(
          padding: EdgeInsets.fromLTRB(22.0, 0, 22.0, 0),
        children: <Widget>[

SizedBox(height: kToolbarHeight,),
Padding(padding: const EdgeInsets.all(8.0),child: Text("Registrar Usuario",style: TextStyle(fontSize: 42.0,color: Colors.white),)
),
Padding(
  padding: EdgeInsets.fromLTRB(8.0, 1, 8.0,0),
     child:  Container(
          width: 35.0,
          height: 1.5,
          color: Colors.white,

      ),
),
  SizedBox(
    height: 70.0,
  ),   
       Theme(
         data: ThemeData(
            hintColor: white,
           primaryColor: white,
           primaryColorDark: white

         ),
  child:  TextFormField(
          style: new TextStyle(color: Colors.white,),
          decoration: InputDecoration(

            labelText: "Correo", fillColor: Colors.white,

          ),
        cursorColor: Colors.white,
        
        ),
       ),
        
        SizedBox(height: 30.0,
        ),
         Theme(
         data: ThemeData(
            hintColor: white,
           primaryColor: white,
           primaryColorDark: white

         ),
  child: TextFormField(
          style: new TextStyle(color: Colors.white,),
            obscureText: true,
            decoration: InputDecoration(
                labelText: "Contraseña",
                suffixIcon: IconButton(
                  onPressed: (){},
                  icon: Icon(Icons.remove_red_eye,color: Colors.grey,),
                )

            ),
        ),
       ), SizedBox(height: 30.0,
        ),
        Theme(
         data: ThemeData(
            hintColor: white,
           primaryColor: white,
           primaryColorDark: white

         ),
  child: TextFormField(
          style: new TextStyle(color: Colors.white,),
            obscureText: true,
            decoration: InputDecoration(
                labelText: "Repite la Contraseña",
                suffixIcon: IconButton(
                  onPressed: (){},
                  icon: Icon(Icons.remove_red_eye,color: Colors.grey,),
                )

            ),
        ),
       ),

        SizedBox(height: 55.0,),
  Align(
child: SizedBox(height: 50.0, width: 270.0,
child: OutlineButton(
borderSide: BorderSide(color: Colors.white),
  onPressed: (){},
  color: Colors.white,
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
  child: Text("Registrar Usuario",style: TextStyle(color:Colors.white ),),
),
),

  ),


        //fin de el listview 
        ],

      ),
        )
        
        
       
        
        );
  }
}
