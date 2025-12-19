import '../domain/entities/focus_session.dart';
import '../domain/entities/focus_state.dart';

class FocusStateModel{
  final FocusState state;
  final FocusSession? session;

  FocusStateModel({
    required this.state,
    required this.session,
});

  factory FocusStateModel.idle() {
    return FocusStateModel(state: FocusState.idle, session: null);    ///***********
  }
}