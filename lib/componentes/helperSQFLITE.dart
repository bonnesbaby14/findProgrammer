import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Helper {
  static final Helper _helper = Helper.internal();
  Helper.internal();
  static Database _database;

  factory Helper() => _helper;

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await initDB();
    return _database;
  }

  initDB() async {
    String databasepath = await getDatabasesPath();
    String path = join(databasepath, 'findProgrammerSQLite.db');
    var base = await openDatabase(path, version: 1, onCreate: _OnCreate);
    return base;
  }

  void _OnCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE DESARROLLADOR(ID_USUARIO integer,ID_DESARROLLADOR integer, GOOGLE_ID text, NOMBRE text, APELLIDO_P text,APELLIDO_M text,CORREO text,FOTO text,CALIFICACION real,F_ESTADO_REGISTRO integer,PASSWORD text,TELEFONO text,F_BAJA_USUARIO integer,F_ESTADO_LOGIN integer,CURP text,F_USUARIO_APRUEBA integer,F_D_WEB integer,F_D_M_ANDROID integer,F_D_M_IOS integer,F_D_E_WINDOWS integer,F_D_E_MAC integer,F_D_REDES integer,PROYECTOS_TRABAJADOS text,PREPARACION text,F_SISTEMA_BLOQUEADO integer);");
    await db.execute(
        "CREATE TABLE CLIENTE(ID_USUARIO integer, GOOGLE_ID text, NOMBRE text, APELLIDO_P text,APELLIDO_M text,CORREO text,FOTO text,CALIFICACION real,F_ESTADO_REGISTRO integer,PASSWORD text,TELEFONO text,F_BAJA_USUARIO integer,F_ESTADO_LOGIN integer,CURP text,F_USUARIO_APRUEBA integer);");
    await db.execute(
        "CREATE TABLE PROYECTO_INFO(ID_PROYECTO_INFO integer,TITULO text,DESCRIPCION text,FECHA_DE_PUBLICACION text,PRESUPUESTO text,F_TIPO_DE_PROYECTO integer,F_TERMINADO integer,F_VISIBILIDAD integer,F_EN_DESARROLLO integer,F_ABANDONO_C integer,F_ABANDONO_D integer,OBSERVACIONESABANDONO text,INTERVALO_DE_AVANCES integer,F_S_ENTREGABLES integer,FK_CLIENTE integer,codigo text);");
    await db.execute(
        "CREATE TABLE PROYECTO_PANEL(ID_PROYECTO_PANEL integer,FECHA_DE_INICIO text,NEXT_ADVANCE text,F_REQ_F integer,F_A_CORRECION_REQ_D integer,F_A_CORRECION_REQ_C integer,F_S_CORRECCION_REQ integer,OBSERVACIONES text,OBSERVACIONESA text,F_AVANCE_D integer,F_AVANCE_A integer,F_AVANCE_R integer,F_TERMINADO_D integer,F_TERMINADO_C integer,FK_DESARROLLADOR integer,FK_PROYECTO integer);");
    await db.execute(
        "CREATE TABLE PROYECTO1(ID_PROYECTO integer , TITULO text, DESCRIPCION text, FECHA_DE_PUBLICACION text , PRESUPUESTO text, F_TIPO_DE_PROYECTO integer, F_TERMINADO integer, F_VISIBILIDAD integer, F_EN_DESARROLLO integer, F_ABANDONO_C integer, F_ABANDONO_D integer, OBSERVACIONESABANDONO text, INTERVALO_DE_AVANCES integer, F_S_ENTREGABLES integer, FK_CLIENTE integer, codigo text, ID_PROYECTO_PANEL integer, FECHA_DE_INICIO text, NEXT_ADVANCE text, F_REQ_F integer, F_A_CORRECION_REQ_D integer, F_A_CORRECION_REQ_C integer, F_S_CORRECCION_REQ integer, OBSERVACIONES text, OBSERVACIONESA text , F_AVANCE_D integer, F_AVANCE_A integer, F_AVANCE_R integer, F_TERMINADO_D integer, F_TERMINADO_C integer, FK_DESARROLLADOR integer, FK_PROYECTO integer);");
    await db.execute(
        "CREATE TABLE PROYECTO2(ID_REQ_F integer , REQUERIMIENTO text, FECHA text, F_REQ_CUMPLIDO integer, FK_PROYECTO integer );");
    await db.execute(
        "CREATE TABLE PROYECTO4(ID_AVANCES integer , TIEMPO_TRABAJO integer, FECHA_ENTREGA text, DESCRIPCION text, PORCENTAJE text, OBSERVACIONES text, No_CAMBIOS integer, CAMBIOS text, ENLACES text, F_ACEPTADO integer, FK_PROYECTO integer );");
    await db.execute(
        "CREATE TABLE PROYECTO5(ID_USUARIO integer, nombre text, apellido_p text, apellido_m text);");
    await db.execute(
        "CREATE TABLE PROYECTO6(ID_VISITA integer , FECHA text, FK_PROYECTO integer, FK_DESAROLLADOR integer);");
    await db.execute(
        "CREATE TABLE COMMENTS(ID_COMENTARIO integer, FK_DESTINATARIO integer, FK_AUTOR integer, COMENTARIO text , nombre text, apellido_P text, apellido_M text);");
  }
  Future<int> InsertComentarios(Map<String, dynamic> map) async {
    Database DB = await database;
    var result = await DB.insert("COMMENTS", map);
    return result;
  }
  Future<int> InsertDesarrollador(Map<String, dynamic> map) async {
    Database DB = await database;
    var result = await DB.insert("DESARROLLADOR", map);
    return result;
  }

  Future<int> InsertCliente(Map<String, dynamic> map) async {
    Database DB = await database;
    var result = await DB.insert("CLIENTE", map);
    return result;
  }

  Future<int> InsertProyectoInfo(Map<String, dynamic> map) async {
    Database DB = await database;
    var result = await DB.insert("PROYECTO_INFO", map);
    return result;
  }

  Future<int> InsertProyectoPanel(Map<String, dynamic> map) async {
    Database DB = await database;
    var result = await DB.insert("PROYECTO_PANEL", map);
    return result;
  }

  Future<int> InsertProyecto1(Map<String, dynamic> map) async {
    Database DB = await database;
    var result = await DB.insert("PROYECTO1", map);
    return result;
  }

  Future<int> InsertProyecto2(Map<String, dynamic> map) async {
    Database DB = await database;
    var result = await DB.insert("PROYECTO2", map);
    return result;
  }

  Future<int> InsertProyecto4(Map<String, dynamic> map) async {
    Database DB = await database;
    var result = await DB.insert("PROYECTO4", map);
    return result;
  }

  Future<int> InsertProyecto5(Map<String, dynamic> map) async {
    Database DB = await database;
    var result = await DB.insert("PROYECTO5", map);
    return result;
  }

  Future<int> InsertProyecto6(Map<String, dynamic> map) async {
    Database DB = await database;
    var result = await DB.insert("PROYECTO6", map);
    return result;
  }

// Future <int> BDUpdate(List<int> id,Map<String, dynamic> map)async{
//  Database DB=await database;
//    var result= await DB.update("Tareas", map,where: "_id=?",whereArgs: id);
//     return result;
// }
  Future<int> DeleteProyecto1() async {
    Database DB = await database;
    var result = await DB.delete("PROYECTO1");
    return result;
  }
   Future<int> DeleteComents() async {
    Database DB = await database;
    var result = await DB.delete("COMMENTS");
    return result;
  }

  Future<int> DeleteProyecto2() async {
    Database DB = await database;
    var result = await DB.delete("PROYECTO2");
    return result;
  }

  Future<int> DeleteProyecto4() async {
    Database DB = await database;
    var result = await DB.delete("PROYECTO4");
    return result;
  }

  Future<int> DeleteProyecto5() async {
    Database DB = await database;
    var result = await DB.delete("PROYECTO5");
    return result;
  }

  Future<int> DeleteProyecto6() async {
    Database DB = await database;
    var result = await DB.delete("PROYECTO6");
    return result;
  }

  Future<int> DeleteDesarrollador() async {
    Database DB = await database;
    var result = await DB.delete("DESARROLLADOR");
    return result;
  }

  Future<int> DeleteCliente() async {
    Database DB = await database;
    var result = await DB.delete("CLIENTE");
    return result;
  }

  Future<int> DeleteProyectoInfo() async {
    Database DB = await database;
    var result = await DB.delete("PROYECTO_INFO");
    return result;
  }

  Future<List<Map<String, dynamic>>> SelectDesarrollador() async {
    Database DB = await database;
    var result = await DB.query('DESARROLLADOR');
    return result;
  }
    Future<List<Map<String, dynamic>>> SelectComments() async {
    Database DB = await database;
    var result = await DB.query('COMMENTS');
    return result;
  }

  Future<List<Map<String, dynamic>>> SelectProjectInfo() async {
    Database DB = await database;
    var result = await DB.query('PROYECTO_INFO');
    return result;
  }

  Future<List<Map<String, dynamic>>> SelectProjectInfoFinish() async {
    Database DB = await database;
    var result = await DB
        .query('PROYECTO_INFO', where: "F_TERMINADO=?", whereArgs: ["1"]);
    return result;
  }

  Future<List<Map<String, dynamic>>> SelectProjectInfoDevelop() async {
    Database DB = await database;
    var result = await DB
        .query('PROYECTO_INFO', where: "F_EN_DESARROLLO=?", whereArgs: ["1"]);
    return result;
  }

  Future<List<Map<String, dynamic>>> SelectCliente() async {
    Database DB = await database;
    var result = await DB.query('CLIENTE');
    return result;
  }

  Future<List<Map<String, dynamic>>> SelectProyecto1() async {
    Database DB = await database;
    var result = await DB.query('PROYECTO1');
    return result;
  }

  Future<List<Map<String, dynamic>>> SelectProyecto2() async {
    Database DB = await database;
    var result = await DB.query('PROYECTO2');
    return result;
  }

  Future<List<Map<String, dynamic>>> SelectProyecto4() async {
    Database DB = await database;
    var result = await DB.query('PROYECTO4');
    return result;
  }

  Future<List<Map<String, dynamic>>> SelectProyecto5() async {
    Database DB = await database;
    var result = await DB.query('PROYECTO5');
    return result;
  }

  Future<List<Map<String, dynamic>>> SelectProyecto6() async {
    Database DB = await database;
    var result = await DB.query('PROYECTO6');
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
