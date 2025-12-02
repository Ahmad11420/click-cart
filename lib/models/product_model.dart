class ProductModel {
  String? id;
  String? image;
  String? productName;
  String? categoryName;
  String? price;
  String? description;
  String? rating;
  String? stock;
  String? trans_image;

  ProductModel({
    this.id,
    this.image,
    this.productName,
    this.categoryName,
    this.price,
    this.description,
    this.rating,
    this.stock,
    this.trans_image,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'image': image,
      'productName': productName,
      'categoryName': categoryName,
      'price': price,
      'stock': stock,
      'rating': rating,
      'description': description,
      'trans_image': trans_image,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'],
      image: map['image'],
      productName: map['productName'],
      categoryName: map['categoryName'],
      price: map['price'],
      description: map['description'],
      rating: map['rating'],
      stock: map['stock'],
      trans_image: map['trans_image'],
    );
  }
}
