
import 'package:flutter_bloc/flutter_bloc.dart';

/// 一个符合 mvvm 输入/输出模型的抽象 ViewModel 类
 abstract class ViewModel<EVENT, STATE> extends Bloc<EVENT, STATE> {
   ViewModel(super.initialState){
     onEventBinding();
   }
   /// 子类必须在这里绑定事件
   void onEventBinding() {
     // TODO: implement onEventBinding
   }

   /// 可选生命周期回调，
   void init() {}
 }
