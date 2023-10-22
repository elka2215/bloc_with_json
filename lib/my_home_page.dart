import 'package:bloc_with_json/bloc/user_bloc.dart';
import 'package:bloc_with_json/user_repository.dart';
import 'package:bloc_with_json/widgets/actions_buttons.dart';
import 'package:bloc_with_json/widgets/user_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// тут у нас страница для показа как раз по 2 задаче
/// запрос и получаение данных
class MyHomePage extends StatelessWidget {
  final userRepository = UserRepository();

  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserBloc>(
      /// тут мы регистрируем блок сам
      create: (context) => UserBloc(userRepository),
      child: const Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ActionsButtons(),

            /// это две кнопки load clear
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: UserList(),

              /// внизу выведится список из апишки
            ),
          ],
        ),
      ),
    );
  }
}
