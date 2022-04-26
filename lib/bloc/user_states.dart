import '../model/user_model.dart';

abstract class UserStates {}

class UserEmptyStates extends UserStates {}

class UserLoadingStates extends UserStates {}

class UserLoadedStates extends UserStates {
  List<User> loadedUser;

  UserLoadedStates({required this.loadedUser}) : assert(loadedUser != null);
}

class UserErrorStates extends UserStates {}
