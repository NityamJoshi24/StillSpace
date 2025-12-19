import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stillspace/features/focus/domain/usecases/complete_focus.dart';
import 'package:stillspace/features/focus/domain/usecases/start_focus.dart';
import 'package:stillspace/features/focus/presentation/focus_controller.dart';
import 'package:stillspace/features/focus/presentation/focus_state_model.dart';

final focusControlProvider = StateNotifierProvider<FocusController, FocusStateModel>((ref) {
  return FocusController(completeFocus: CompleteFocus(), startFocus: StartFocus());
});