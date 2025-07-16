import 'package:bloc_mvvm_architecture/module/home/bloc/home_bloc.dart';
import 'package:bloc_mvvm_architecture/module/home/bloc/home_event.dart';
import 'package:bloc_mvvm_architecture/module/home/bloc/home_state.dart';
import 'package:bloc_mvvm_architecture/module/home/product_repository/home_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProductBloc(ProductRepository())..add(LoadInitialProducts()),
      child: Scaffold(
        appBar: AppBar(title: Text('BLoC 示例')),
        body: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if (state is ProductLoading || state is ProductInitial) {
              return Center(child: CircularProgressIndicator());
            } else if (state is ProductError) {
              return Center(child: Text('出错了: ${state.message}'));
            } else if (state is ProductLoaded) {
              return NotificationListener<ScrollNotification>(
                onNotification: (scroll) {
                  final max = scroll.metrics.maxScrollExtent;
                  final current = scroll.metrics.pixels;
                  if (current > max - 100 && state.hasMore) {
                    context.read<ProductBloc>().add(LoadMoreProducts());
                  }
                  return false;
                },
                child: ListView.builder(
                  itemCount: state.products.length + 1,
                  itemBuilder: (context, index) {
                    if (index == state.products.length) {
                      return state.hasMore ? Padding(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: Center(child: CircularProgressIndicator()),
                      ) : SizedBox();
                    }
                    final item = state.products[index];
                    return ListTile(
                      leading: Image.network(item.imageUrl, width: 60, height: 60, fit: BoxFit.cover),
                      title: Text(item.title),
                    );
                  },
                ),
              );
            }
            return SizedBox();
          },
        ),
      ),
    );
  }
}
