
import 'package:bloc_with_json/bloc/user_bloc.dart';
import 'package:bloc_with_json/user_repository.dart';
import 'package:bloc_with_json/widgets/actions_buttons.dart';
import 'package:bloc_with_json/widgets/user_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatelessWidget {
  final userRepository = UserRepository();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserBloc>(
      create: (context) => UserBloc(userRepository),
      child: Scaffold(
        appBar: AppBar(
          title: Text('BLoC with flutter_bloc'),
          centerTitle: true,
        ),
        body:Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ActionsButtons(),
            SizedBox(height: 15,),
            Expanded(child: UserList(),),
          ],
        ),
      ),
    );
  }
}