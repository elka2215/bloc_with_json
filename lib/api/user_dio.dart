import 'package:bloc_with_json/model/user_model.dart';
import 'package:dio/dio.dart';

class UserDio{
final Dio _dio = Dio(BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com'));

Future<List<User>> getUserApi() async {
try{
final response = await _dio.get('/users');
print('Status code: ${response.statusCode}');
print('data: ${response.data}');
final users = response.data as List;
if(users.isNotEmpty){
  return users.map((e) => User.fromJson(e)).toList();
}
return[];

}catch(error){
  rethrow;
}
}
}