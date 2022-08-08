import 'package:food_monkey/models/Product.dart';

class Global{
  
  static List<Product> cartsProduct = [];

  static addToCart(product){
    bool exist = false;
    if(cartsProduct.length > 0){
      cartsProduct.forEach((prod) {
        if(prod.id == product.id){
          prod.count++;
          exist = true;
        }
       });
    }
    if(!exist){
      cartsProduct.add(product);
    }
  }
}