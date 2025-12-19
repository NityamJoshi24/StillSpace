import 'package:stillspace/features/focus/domain/entities/focus_session.dart';

class StartFocus{
  FocusSession call(Duration duration) {
    return FocusSession(isCompleted: false, duration: duration, startTime: DateTime.now());
  }
}