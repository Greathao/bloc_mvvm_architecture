
import 'package:bloc_mvvm_architecture/module/home/model/product_model.dart';

class ProductRepository {
  Future<List<Product>> fetchProducts({ int page = 1}) async {
    await Future.delayed(Duration(milliseconds: 800));
    return List.generate(10, (i) => Product(
        id: 'p${page}_$i',
        title: '商品 ${page}_$i',
        imageUrl:'https://picsum.photos/seed/p${page}_$i/200/200',
    ));
  }
}