import 'package:bloc_with_json/bloc/user_event.dart';
import 'package:bloc_with_json/bloc/user_states.dart';
import 'package:bloc_with_json/model/user_model.dart';
import 'package:bloc_with_json/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent, UserStates> {
  final UserRepository userRepository;

  UserBloc(this.userRepository) : super(UserEmptyStates()) {
    on<UserLoadEvent>((event, emit) async {
      emit(UserLoadingStates());

      /// сначала эмитим загрузку
      try {
        /// потом оптравлем запрос
        final List<User> _loadedUserList = await userRepository.getAllUsers();
        emit(UserLoadedStates(loadedUser: _loadedUserList));

        /// после эмитим и отправляем наш ответ от сервера в модельку
      } catch (_) {
        emit(UserErrorStates());
      }
    });

    on<UserClearEvent>((event, emit) async {
      /// это жай если ошибка какая то
      emit(UserErrorStates());
    });
  }
}
