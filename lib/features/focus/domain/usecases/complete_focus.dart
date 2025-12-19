import 'package:stillspace/features/focus/domain/entities/focus_session.dart';

class CompleteFocus {
  FocusSession call(FocusSession session) {
    return FocusSession(isCompleted: true, duration: session.duration, startTime: session.startTime);
  }
}