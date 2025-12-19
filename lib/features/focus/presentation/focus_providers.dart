import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stillspace/features/focus/domain/usecases/complete_focus.dart';
import 'package:stillspace/features/focus/domain/usecases/calculate_calm_energy.dart';
import 'package:stillspace/features/focus/presentation/controller/focus_controller.dart';
import 'package:stillspace/features/focus/presentation/focus_state_model.dart';
import 'package:stillspace/features/world/presentation/widgets/world_provider.dart';

final focusControlProvider = StateNotifierProvider<FocusController, FocusStateModel>((ref) {
  return FocusController(
    completeFocus: CompleteFocus(),
    calculateCalmEnergy: const CalculateCalmEnergy(),
    worldController: ref.read(worldControlProvider.notifier),
  );
});