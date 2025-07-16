
import 'package:bloc_mvvm_architecture/module/home/bloc/home_event.dart';
import 'package:bloc_mvvm_architecture/module/home/bloc/home_state.dart';
import 'package:bloc_mvvm_architecture/module/home/product_repository/home_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState>{

  final ProductRepository repository;
  int _page = 1;
  bool _isLoadingMore = false;

  ProductBloc(this.repository) : super(ProductInitial()){
    on<LoadInitialProducts>(_onLoadInitial);
    on<LoadMoreProducts>(_onLoadMore);
  }

  Future<void> _onLoadInitial(LoadInitialProducts event, Emitter<ProductState> emit) async {
    emit(ProductLoading());
    try {
      _page = 1;
      final products = await repository.fetchProducts(page: _page);
      emit(ProductLoaded(products: products,  hasMore: products.length == 10));
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }

  Future<void> _onLoadMore(LoadMoreProducts event, Emitter<ProductState> emit) async {
    if (_isLoadingMore || state is! ProductLoaded) return;
    _isLoadingMore = true;
    final currentState = state as ProductLoaded;
    try {
      _page++;
      final newProducts = await repository.fetchProducts(page: _page);
      final all = [...currentState.products, ...newProducts];
      emit(ProductLoaded(products: all, hasMore: newProducts.length == 10));
    } catch(e) {
      emit(ProductError(e.toString()));
    }
    _isLoadingMore = false;
  }

}