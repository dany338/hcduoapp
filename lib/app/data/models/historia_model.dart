import 'package:hcduoapp/app/data/models/imagenes_model.dart';

class HistoriaModel {
  HistoriaModel({
    this.id,
    this.historiaId,
    this.nombres,
    this.primerNombre,
    this.segundoNombre,
    this.primerApellido,
    this.segundoApellido,
    this.documento,
    this.celular,
    this.fechaCreacion,
    this.codigo,
    this.estadoHistoria,
    this.direccion,
    this.imagenes,
  });

  String? id;
  String? historiaId;
  String? nombres;
  String? primerNombre;
  String? segundoNombre;
  String? primerApellido;
  String? segundoApellido;
  String? documento;
  String? celular;
  String? fechaCreacion;
  String? codigo;
  String? estadoHistoria;
  String? direccion;
  List<ImagenesModel>? imagenes;

  factory HistoriaModel.fromJson(Map<String, dynamic> json) => HistoriaModel(
        id: json["id"],
        historiaId: json["historia_id"],
        nombres: json["nombres"],
        primerNombre: json["primer_nombre"],
        segundoNombre: json["segundo_nombre"],
        primerApellido: json["primer_apellido"],
        segundoApellido: json["segundo_apellido"],
        documento: json["documento"],
        celular: json["celular"],
        fechaCreacion: json["fecha_creacion"],
        codigo: json["codigo"],
        estadoHistoria: json["estado_historia"],
        direccion: json["direccion"],
        imagenes: List<ImagenesModel>.from(
            json["imagenes"].map((x) => ImagenesModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "historia_id": historiaId,
        "nombres": nombres,
        "primer_nombre": primerNombre,
        "segundo_nombre": segundoNombre,
        "primer_apellido": primerApellido,
        "segundo_apellido": segundoApellido,
        "documento": documento,
        "celular": celular,
        "fecha_creacion": fechaCreacion,
        "codigo": codigo,
        "estado_historia": estadoHistoria,
        "direccion": direccion,
        "imagenes": imagenes,
      };
}
