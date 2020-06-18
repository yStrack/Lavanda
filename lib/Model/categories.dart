class Procedure {
  final String image;
  final String title;
  final String description;

  Procedure(this.image, this.title, this.description);
}

class Category {
  final String name;
  final String image;
  final String fileName;
  final int step;
  // final List<Procedure> procedures;

  Category(
      this.name, this.image, this.step, this.fileName /*, this.procedures*/);
}

List<Category> categories = categoriesData
    .map((item) =>
        Category(item['name'], item['image'], item['step'], item['fileName']))
    .toList();

var categoriesData = [
  {
    "name": "washHands",
    'image': "assets/images/maos-1.png",
    'step': 13,
    'fileName': "maos"
  },
  {
    "name": "brushTeeth",
    'image': "assets/images/dente.png",
    'step': 5,
    'fileName': "dente"
  },
];

var proceduresData = [];
