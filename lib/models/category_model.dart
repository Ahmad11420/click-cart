
class CategoryModel {
  String? id;
  String? image;
  String? productName;

  CategoryModel({
    this.id,
    this.image,
    this.productName,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': image,
      'productName': productName,
    };
  }

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      image: json['image'],
      productName: json['productName'],
    );
  }
}
 