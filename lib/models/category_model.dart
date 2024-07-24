class CategoryModel{
  final int id;
  final String name;
  final String image;
  CategoryModel({required this.id, required this.name, required this.image});
}

final List<CategoryModel> categories = [
  CategoryModel(id: 9, name: "General Knowledge", image: 'assets/image/school.png'),
  CategoryModel(id: 18, name: "Science: Computers", image: 'assets/image/data-science.png'),
  CategoryModel(id: 30, name: "Science: Gadgets",image: 'assets/image/gadgets.png'),
];