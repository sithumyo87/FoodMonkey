class Category{
  String name,image;
  Category({required this.name,required this.image});

  factory Category.from(dynamic data){
    return Category(
      name:data['name'],
      image:data['image'],
    );
  }
}