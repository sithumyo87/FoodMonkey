class Product{
  int count =1;
  String id,name,image;

  Product({required this.id,required this.name,required this.image});

  factory Product.from(dynamic data){
    return Product(
      id:data['id'],
      name:data['name'],
      image:data['image'],
    );
  }
}