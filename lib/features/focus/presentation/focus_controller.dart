import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stillspace/features/focus/domain/entities/focus_state.dart';
import 'package:stillspace/features/focus/domain/usecases/complete_focus.dart';
import 'package:stillspace/features/focus/domain/usecases/start_focus.dart';
import 'package:stillspace/features/focus/presentation/focus_state_model.dart';

import '../../world/presentation/widgets/world_provider.dart';

class FocusController extends StateNotifier<FocusStateModel> {
  final StartFocus startFocus;
  final CompleteFocus completeFocus;

  FocusController({
    required this.completeFocus,
    required this.startFocus
}) : super(FocusStateModel.idle());

  void start(Duration duration) {
    final session = startFocus(duration);
    state = FocusStateModel(state: FocusState.focusing, session: session);
  }

  void end(WidgetRef ref) {
    if(state.session == null) return;

    final completed = completeFocus(state.session!);
    state = FocusStateModel(
        state: FocusState.completed,
        session: completed,
    );

    ref.read(worldControlProvider.notifier).onFocusCompleted(completed);
  }


  void reset() {
    state = FocusStateModel.idle();
  }
}
