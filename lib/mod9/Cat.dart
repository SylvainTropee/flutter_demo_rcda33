class Cat {

  String? id;
  String? urlImage;
  double? width;
  double? height;

  Cat(this.id, this.urlImage, this.width, this.height);

  Cat.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    urlImage = json['url'];
    width = json['width'];
    height = json['height'];
  }

  // Cat.fromJson(Map<String, dynamic> json)
  //     : this(json['id'], json['url'], json['width'], json['height']);

}
