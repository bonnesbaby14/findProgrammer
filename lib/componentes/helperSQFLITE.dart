import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


class Helper{

static final Helper _helper=Helper.internal();
  Helper.internal();
  static Database _database;

  factory Helper()=> _helper;

  Future<Database> get database async{
    if(_database!=null){
      return _database;
    }
    _database=await initDB();
    return _database;
  }
initDB()async{
    String databasepath=await getDatabasesPath();
    String path=join(databasepath,'findProgrammerSQLite.db');
      var base= await openDatabase(path, version: 1, onCreate: _OnCreate);
      return base;
}

  
void _OnCreate(Database db, int version)async{
      await db.execute("CREATE TABLE DESARROLLADOR(ID_USUARIO integer,ID_DESARROLLADOR integer, GOOGLE_ID text, NOMBRE text, APELLIDO_P text,APELLIDO_M text,CORREO text,FOTO text,CALIFICACION real,F_ESTADO_REGISTRO integer,PASSWORD text,TELEFONO text,F_BAJA_USUARIO integer,F_ESTADO_LOGIN integer,CURP text,F_USUARIO_APRUEBA integer,F_D_WEB integer,F_D_M_ANDROID integer,F_D_M_IOS integer,F_D_E_WINDOWS integer,F_D_E_MAC integer,F_D_REDES integer,PROYECTOS_TRABAJADOS text,PREPARACION text,F_SISTEMA_BLOQUEADO integer);");
        await db.execute("CREATE TABLE CLIENTE(ID_USUARIO integer, NOMBRE text, APELLIDO_P text,APELLIDO_M text,CORREO text,FOTO text,CALIFICACION real,F_ESTADO_REGISTRO integer,PASSWORD text,TELEFONO text,F_BAJA_USUARIO integer,F_ESTADO_LOGIN integer,CURP text,F_USUARIO_APRUEBA integer);");
    
}

Future <int> InsertDesarrollador(Map <String,dynamic> map)async{
    Database DB=await database;
    var result= await DB.insert("DESARROLLADOR", map);
    return result;
}

Future <int> InsertCliente(Map <String,dynamic> map)async{
    Database DB=await database;
    var result= await DB.insert("CLIENTE", map);
    return result;
}

// Future <int> BDUpdate(List<int> id,Map<String, dynamic> map)async{
//  Database DB=await database;
//    var result= await DB.update("Tareas", map,where: "_id=?",whereArgs: id);
//     return result;
// }

 Future <int> DeleteDesarrollador() async{
  Database DB=await database;
    var result= await DB.delete("DESARROLLADOR");
     return result;
}
Future <int> DeleteCliente() async{
  Database DB=await database;
    var result= await DB.delete("CLIENTE");
     return result;
}

 Future<List<Map<String,dynamic>>> SelectDesarrollador() async{
     Database DB=await database;
     var result= await DB.query('DESARROLLADOR');
     return result;
 }
  Future<List<Map<String,dynamic>>> SelectCliente() async{
     Database DB=await database;
     var result= await DB.query('CLIENTE');
     return result;
 }

// Future<int> Count()async{
// Database DB=await database;
// List<Map<String,dynamic>> mapa=List<Map<String,dynamic>>();
// mapa=await DB.query("Tareas");
// int dato=mapa.length;
// return dato;
//   }







}






