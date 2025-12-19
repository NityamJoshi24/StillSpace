import '../domain/entities/focus_session.dart';
import '../domain/entities/focus_state.dart';

class FocusStateModel {
  final FocusState state;
  final FocusSession? session;

  const FocusStateModel({
    required this.state,
    required this.session,
  });

  factory FocusStateModel.idle() {
    return const FocusStateModel(state: FocusState.idle, session: null);
  }

  FocusStateModel copyWith({
    FocusState? state,
    FocusSession? session,
  }) {
    return FocusStateModel(
      state: state ?? this.state,
      session: session ?? this.session,
    );
  }
}