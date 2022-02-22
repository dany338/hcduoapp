class ImagenesModel {
  ImagenesModel({
    this.id,
    this.name,
    this.url,
    this.fechaCreacion,
  });

  int? id;
  String? name;
  String? url;
  String? fechaCreacion;

  factory ImagenesModel.fromJson(Map<String, dynamic> json) => ImagenesModel(
        id: json["id"],
        name: json["name"],
        url: json["url"],
        fechaCreacion: json["fecha_creacion"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "url": url,
        "fecha_creacion": fechaCreacion,
      };
}
