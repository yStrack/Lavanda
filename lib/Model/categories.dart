class Procedure {
  final String image;
  final String title;
  final String description;

  Procedure(this.image, this.title, this.description);
}

class Category {
  final String name;
  final String image;
  // final List<Procedure> procedures;

  Category(this.name, this.image /*, this.procedures*/);
}

List<Category> categories = categoriesData
    .map((item) => Category(item['name'], item['image']))
    .toList();

var categoriesData = [
  {"name": "Lavar as mãos", 'image': "assets/images/maos-01.png"},
  {"name": "Escovar os dentes", 'image': "assets/images/aglomeracao.png"},
];

var proceduresData = [];
