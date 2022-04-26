import 'package:bloc_with_json/api/user_dio.dart';
import 'package:bloc_with_json/model/user_model.dart';

class UserRepository{
  UserDio _usersProvider = UserDio();
  Future<List<User>>getAllUsers() => _usersProvider.getUserApi();
}