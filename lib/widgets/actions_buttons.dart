import 'package:bloc_with_json/bloc/user_bloc.dart';
import 'package:bloc_with_json/bloc/user_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActionsButtons extends StatelessWidget {
  const ActionsButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserBloc userBloc = context.read<UserBloc>();

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextButton(
          onPressed: () {
            userBloc.add(UserLoadEvent());
          },
          child: const Text('load'),
          style: TextButton.styleFrom(
              primary: Colors.white, backgroundColor: Colors.green),
        ),
        const SizedBox(
          width: 12,
        ),
        TextButton(
          onPressed: () {
            userBloc.add(UserClearEvent());
          },
          child: const Text('clear'),
          style: TextButton.styleFrom(
              backgroundColor: Colors.red, primary: Colors.white),
        ),
      ],
    );
  }
}
