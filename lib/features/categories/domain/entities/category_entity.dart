class CategoryEntity {
  int id;
  int merchantCount;
  String title;
  String iconPath;
  List<CategoryEntity> children;

  // Constructor
  CategoryEntity({
    required this.id,
    required this.merchantCount,
    required this.title,
    required this.iconPath,
    this.children = const [],
  });

  @override
  String toString() {
    return 'CategoryEntity{id: $id, childCount: $merchantCount, name: $title, image: $iconPath, children: $children}';
  }
}
