abstract class BaseStates {}

class BaseInitialState extends BaseStates {}

class BaseLoadingState extends BaseStates {}

class BaseSuccessState extends BaseStates {}

class BaseErrorState extends BaseStates {
  String errorMessage;
  bool isNetworkError;

  BaseErrorState(this.errorMessage, [this.isNetworkError = false]);
}
