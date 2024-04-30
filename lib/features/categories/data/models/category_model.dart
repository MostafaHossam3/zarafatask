import 'package:ztask/features/categories/domain/entities/category_entity.dart';

class CategoryModel extends CategoryEntity {
  CategoryModel({
    required super.id,
    required super.merchantCount,
    required super.title,
    required super.iconPath,
    super.children = const [],
  });

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['id'],
      merchantCount: map['child_count'],
        iconPath: map['image'],
      title: map['name'],
      children: map['children'] == null ? [].cast<CategoryModel>() : List<CategoryModel>.from(map['children'].map((e) => CategoryModel.fromMap(e))),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'child_count': merchantCount,
      'image': iconPath,
      'name': title,
      'children': children?.map((e) => e.toString()),
    };
  }
}
