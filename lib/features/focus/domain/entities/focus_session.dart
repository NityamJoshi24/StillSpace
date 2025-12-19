class FocusSession {
  final DateTime startTime;
  final Duration duration;
  final bool isCompleted;

  FocusSession({
   required this.isCompleted,
   required this.duration,
   required this.startTime
});
}