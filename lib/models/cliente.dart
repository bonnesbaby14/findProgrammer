class Cliente {
  int ID;

  String NOMBRE, APELLIDO_P, APELLIDO_M, CORREO, FOTO, PASSWORD, TELEFONO, CURP;

  double CALIFICACION;

  bool F_ESTADO_REGISTRO,
      F_BAJA_USUARIO,
      F_ESTADO_LOGIN,
      F_USUARIO_APRUEBA,
      F_SISTEMA_BLOQUEADO;

  Cliente(
      {this.ID,
      this.NOMBRE,
      this.APELLIDO_P,
      this.APELLIDO_M,
      this.CORREO,
      this.FOTO,
      this.PASSWORD,
      this.TELEFONO,
      this.CURP,
      this.CALIFICACION,
      this.F_ESTADO_REGISTRO,
      this.F_BAJA_USUARIO,
      this.F_ESTADO_LOGIN,
      this.F_USUARIO_APRUEBA,
      this.F_SISTEMA_BLOQUEADO}
      
      );


Map<String,dynamic> toMap(){
  var map=<String,dynamic>{
    'id':ID,
    'nombre':NOMBRE,
    'apellido_p':APELLIDO_P,
    'apellido_m':APELLIDO_M,
    'correo':CORREO,
    'foto':FOTO,
    'password':PASSWORD,
    'telefono':TELEFONO,
    'curp':CURP,
    'califiacion':CALIFICACION,
    'f_estado_registro':F_ESTADO_REGISTRO,
    'f_baja_usuario':F_BAJA_USUARIO,
    'f_estado_login':F_ESTADO_LOGIN,
    'f_usuario_apueba':F_USUARIO_APRUEBA,
    'f_sietma_bloqueado':F_SISTEMA_BLOQUEADO,
    
  };

return map;
}


Cliente.fromMap(Map<String,dynamic> map){

 
ID=map['id'];
NOMBRE=map['nombre'];
APELLIDO_P=map['apellido_p'];
APELLIDO_M=map['apellido_m'];
CORREO=map['correo'];
FOTO=map['foto'];
PASSWORD=map['password'];
TELEFONO=map['telefono'];
CURP=map['curp'];
CALIFICACION=map['califiacion'];
F_ESTADO_REGISTRO=map['f_estado_registro'];
F_BAJA_USUARIO=map['f_baja_usuario'];
F_ESTADO_LOGIN=map['f_estado_login'];
F_USUARIO_APRUEBA=map['f_usuario_apueba'];
F_SISTEMA_BLOQUEADO=map['f_sietma_bloqueado'];

}








}
