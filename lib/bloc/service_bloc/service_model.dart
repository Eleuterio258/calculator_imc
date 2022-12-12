class ServiceModel {
  int? id;
  String? createOn;
  String? updateOn;
  String? description;
  String? visivel;
  double? price;
  String? name;
  bool? pago;
  String? owner;
  int? nrview;
  String? pdfPortifolio;
  Rates? rates;
  List<ImageUrl>? imageUrl;

  ServiceModel(
      {this.id,
      this.createOn,
      this.updateOn,
      this.description,
      this.visivel,
      this.price,
      this.name,
      this.pago,
      this.owner,
      this.nrview,
      this.pdfPortifolio,
      this.rates,
      this.imageUrl});

  ServiceModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createOn = json['createOn'];
    updateOn = json['updateOn'];
    description = json['description'];
    visivel = json['visivel'];
    price = json['price'];
    name = json['name'];
    pago = json['pago'];
    owner = json['owner'];
    nrview = json['nrview'];
    pdfPortifolio = json['pdfPortifolio'];
    rates = json['rates'] != null ? Rates.fromJson(json['rates']) : null;
    if (json['imageUrl'] != null) {
      imageUrl = <ImageUrl>[];
      json['imageUrl'].forEach((v) {
        imageUrl!.add(ImageUrl.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['createOn'] = createOn;
    data['updateOn'] = updateOn;
    data['description'] = description;
    data['visivel'] = visivel;
    data['price'] = price;
    data['name'] = name;
    data['pago'] = pago;
    data['owner'] = owner;
    data['nrview'] = nrview;
    data['pdfPortifolio'] = pdfPortifolio;
    if (rates != null) {
      data['rates'] = rates!.toJson();
    }
    if (imageUrl != null) {
      data['imageUrl'] = imageUrl!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Rates {
  int? id;
  String? createOn;
  String? updateOn;
  int? priraEstrela;
  int? segEstrela;
  int? terEstrela;
  int? quartaEstrela;
  int? quintaEstrela;
  int? total;

  Rates(
      {this.id,
      this.createOn,
      this.updateOn,
      this.priraEstrela,
      this.segEstrela,
      this.terEstrela,
      this.quartaEstrela,
      this.quintaEstrela,
      this.total});

  Rates.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createOn = json['createOn'];
    updateOn = json['updateOn'];
    priraEstrela = json['priraEstrela'];
    segEstrela = json['segEstrela'];
    terEstrela = json['terEstrela'];
    quartaEstrela = json['quartaEstrela'];
    quintaEstrela = json['quintaEstrela'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['createOn'] = createOn;
    data['updateOn'] = updateOn;
    data['priraEstrela'] = priraEstrela;
    data['segEstrela'] = segEstrela;
    data['terEstrela'] = terEstrela;
    data['quartaEstrela'] = quartaEstrela;
    data['quintaEstrela'] = quintaEstrela;
    data['total'] = total;
    return data;
  }
}

class ImageUrl {
  int? id;
  String? createOn;
  String? updateOn;
  String? path;

  ImageUrl({this.id, this.createOn, this.updateOn, this.path});

  ImageUrl.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createOn = json['createOn'];
    updateOn = json['updateOn'];
    path = json['path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['createOn'] = createOn;
    data['updateOn'] = updateOn;
    data['path'] = path;
    return data;
  }
}
