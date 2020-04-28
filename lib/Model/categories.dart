class Category {
  final String name;
  final String image;

  Category(this.name, this.image);
}

List<Category> categories = categoriesData
    .map((item) => Category(item['name'], item['image']))
    .toList();

var categoriesData = [
  {"name": "Lavar as mãos", 'image': "assets/images/wash-hands.png"},
  {"name": "Escovar os dentes", 'image': "assets/images/brush-teeth.png"},
];
