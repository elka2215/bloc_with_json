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
        return Center(
          child: Text('now data. Press button "Load"'),
        );
      }
      if(state is UserLoadingStates){
        return Center(child: CircularProgressIndicator(),);
      }

      if(state is UserLoadedStates){
        return ListView.builder(
          itemCount: state.loadedUser.length,
          itemBuilder: (context, index) => Container(
            color: index %2 == 0 ? Colors.white : Colors.blue[50],
            child: ListTile(
              leading: Text(
                'Id: ${state.loadedUser[index].id}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              title: Column(
                children: [
                  Text(
                    '${state.loadedUser[index].name}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Email: ${state.loadedUser[index].email}",
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                      Text(
                        'Phone: ${state.loadedUser[index].phone}',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      }

      if(state is UserErrorStates){
        return Center(child: Text('Error fetching Users'),);
      }

      return SizedBox.shrink();
    });

  }
}
