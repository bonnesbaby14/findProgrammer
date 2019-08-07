class Desarrollador {
  int ID;

  String NOMBRE,
      APELLIDO_P,
      APELLIDO_M,
      CORREO,
      FOTO,
      PASSWORD,
      TELEFONO,
      CURP,
      PROYECTOS_TRABAJADOS,
      PREPARACION;

  double CALIFICACION;

  bool F_ESTADO_REGISTRO,
      F_BAJA_USUARIO,
      F_ESTADO_LOGIN,
      F_USUARIO_APRUEBA,
      F_D_WEB,
      F_D_M_ANDROID,
      F_D_M_IOS,
      F_D_E_WINDOWS,
      F_D_REDES,
      F_D_E_MAC,
      F_SISTEMA_BLOQUEADO;

  Desarrollador(
      {this.ID,
      this.NOMBRE,
      this.APELLIDO_P,
      this.APELLIDO_M,
      this.CORREO,
      this.FOTO,
      this.PASSWORD,
      this.TELEFONO,
      this.CURP,
      this.PROYECTOS_TRABAJADOS,
      this.PREPARACION,
      this.CALIFICACION,
      this.F_ESTADO_REGISTRO,
      this.F_BAJA_USUARIO,
      this.F_ESTADO_LOGIN,
      this.F_USUARIO_APRUEBA,
      this.F_D_WEB,
      this.F_D_M_ANDROID,
      this.F_D_M_IOS,
      this.F_D_E_WINDOWS,
      this.F_D_REDES,
      this.F_D_E_MAC,
      this.F_SISTEMA_BLOQUEADO});
}
