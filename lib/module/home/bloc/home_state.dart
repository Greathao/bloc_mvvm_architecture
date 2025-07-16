
import 'package:bloc_mvvm_architecture/module/home/model/product_model.dart';

abstract class ProductState {}
// 初始化
class ProductInitial extends ProductState {}
// 加载中
class ProductLoading extends ProductState {}
// 加载完成
class ProductLoaded extends ProductState {
  final List<Product> products;
  final bool hasMore;
  ProductLoaded({required this.products, required this.hasMore});
}
// 加载失败
class ProductError extends ProductState {
  final String message;
  ProductError(this.message);
}
