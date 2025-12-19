import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/focus_session.dart';
import '../../domain/entities/focus_state.dart';
import '../../domain/usecases/complete_focus.dart';
import '../../domain/usecases/calculate_calm_energy.dart';
import '../../../world/presentation/controllers/world_controller.dart';
import '../focus_state_model.dart';

class FocusController extends StateNotifier<FocusStateModel> {
  final CompleteFocus _completeFocus;
  final CalculateCalmEnergy _calculateCalmEnergy;
  final WorldController _worldController;

  Timer? _timer;

  FocusController({
    required CompleteFocus completeFocus,
    required CalculateCalmEnergy calculateCalmEnergy,
    required WorldController worldController,
  })  : _completeFocus = completeFocus,
        _calculateCalmEnergy = calculateCalmEnergy,
        _worldController = worldController,
        super(FocusStateModel.idle());

  /// PUBLIC API — unchanged
  void startFocus() {
    final session = FocusSession(
      startTime: DateTime.now(),
      duration: Duration.zero,
      isCompleted: false,
    );

    state = state.copyWith(
      session: session,
      state: FocusState.focusing,
    );

    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      final current = state.session;
      if (current == null) return;

      state = state.copyWith(
        session: FocusSession(
          startTime: current.startTime,
          duration: DateTime.now().difference(current.startTime),
          isCompleted: false,
        ),
      );
    });
  }

  /// PUBLIC API — unchanged
  void endFocus() {
    _timer?.cancel();
    _timer = null;

    final session = state.session;
    if (session == null) return;

    final completed = _completeFocus(session);
    final reward = _calculateCalmEnergy(completed.duration);

    _worldController.addEnergy(reward);

    state = state.copyWith(
      session: completed,
      state: FocusState.completed,
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
