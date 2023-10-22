import 'package:bloc_with_json/bloc/user_bloc.dart';
import 'package:bloc_with_json/bloc/user_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserList extends StatelessWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserStates>(builder: (context, state) {
      if (state is UserEmptyStates) {
        /// Если данные пустые или же не нажимали кнопку то показывает текст этот
        return const Center(
          child: Text('now data. Press button "Load"'),
        );
      }
      if (state is UserLoadingStates) {
        /// загрузка бро просто загрузка
        return const Center(
          child: CircularProgressIndicator(),
        );
      }

      if (state is UserLoadedStates) {
        /// если данные пришли и все ок то выводим эти данные. Через лист и
        return ListView.builder(
          itemCount: state.loadedUser.length,
          itemBuilder: (context, index) => Container(
            color: index % 2 == 0 ? Colors.white : Colors.blue[50],

            /// тут каждую четную мы подкрашиваем чтоб лучше смотрелось
            child: ListTile(
              leading: Text(
                'Id: ${state.loadedUser[index].id}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              title: Column(
                children: [
                  Text(
                    state.loadedUser[index].name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Email: ${state.loadedUser[index].email}",
                        style: const TextStyle(fontStyle: FontStyle.italic),
                      ),
                      Text(
                        'Phone: ${state.loadedUser[index].phone}',
                        style: const TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      }

      /// если ошибка то показываем этот текст
      if (state is UserErrorStates) {
        return const Center(
          child: Text('Error fetching Users'),
        );
      }

      return const SizedBox.shrink();
    });
  }
}
