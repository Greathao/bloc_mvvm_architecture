
/// 通用状态管理基类，适用于 Bloc/MVVM 中的状态输出（Output）
/// 所有模块状态都可以继承这个类来统一状态模型
abstract class BaseState<T> {
  const BaseState();
}

/// 初始状态：通常用于界面刚启动，还未触发任何操作
class InitialState<T> extends BaseState<T> {
  const InitialState();
}

/// 加载中状态：表示正在加载数据或执行异步操作
class LoadingState<T> extends BaseState<T> {
  const LoadingState();
}

/// 成功状态：表示成功拿到数据，通常携带结果数据
class SuccessState<T> extends BaseState<T> {
  final T data;

  /// [data] 是成功加载的数据（泛型）
  const SuccessState(this.data);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is SuccessState<T> &&
              runtimeType == other.runtimeType &&
              data == other.data;

  @override
  int get hashCode => data.hashCode;
}

/// 错误状态：表示业务逻辑或网络请求出错
class ErrorState<T> extends BaseState<T> {
  final String message;

  /// [message] 是错误提示信息，建议给用户展示
  const ErrorState(this.message);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is ErrorState<T> &&
              runtimeType == other.runtimeType &&
              message == other.message;

  @override
  int get hashCode => message.hashCode;
}

/// 空状态：表示数据正常返回但为空，例如返回空数组
class EmptyState<T> extends BaseState<T> {
  const EmptyState();
}
