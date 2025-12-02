import 'dart:convert';

class BannerModel {
  final int? id;
  final String? photo;

  const BannerModel({this.id, this.photo});

  BannerModel copyWith({
    int? id,
    String? photo,
  }) {
    return BannerModel(
      id: id ?? this.id,
      photo: photo ?? this.photo,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'photo': photo,
    };
  }

  factory BannerModel.fromMap(Map<String, dynamic> map) {
    return BannerModel(
      id: map['id'] as int?,
      photo: map['photo'] as String?,
    );
  }

  String toJson() => json.encode(toMap());

  factory BannerModel.fromJson(String source) =>
      BannerModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'BannerModel(id: $id, photo: $photo)';

  @override
  bool operator ==(covariant BannerModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.photo == photo;
  }

  @override
  int get hashCode => id.hashCode ^ photo.hashCode;
}
