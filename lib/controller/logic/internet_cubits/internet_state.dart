import '../../../model/user_model.dart';

// bloc cubits performs when events are occured
abstract class InternetState {}

class InternetLoadingState extends InternetState {}

class InternetGainedState extends InternetState {
  final List<UserModel> users;
  InternetGainedState(this.users);
}

class InternetLostState extends InternetState {
  final String error;

  InternetLostState(
    this.error,
  );
}
