import 'package:bloc_mvvm_architecture/core/state/base_state.dart';
import 'package:flutter_floor_layout/core/floor_base_model.dart';

abstract class ProductEvent {}
// 初始化、刷新
class LoadInitialProducts extends ProductEvent {}
// 加载更多
class LoadMoreProducts extends ProductEvent {}