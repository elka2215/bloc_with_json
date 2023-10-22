import 'package:bloc_with_json/api/user_dio.dart';
import 'package:bloc_with_json/model/user_model.dart';

class UserRepository {
  /// тут репозиторий для абстарции, чтобы реализации не было видно
  final UserDio _usersProvider = UserDio();
  Future<List<User>> getAllUsers() => _usersProvider.getUserApi();
}
