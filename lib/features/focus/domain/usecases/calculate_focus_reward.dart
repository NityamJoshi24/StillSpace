import 'package:stillspace/features/focus/domain/entities/focus_session.dart';
import 'package:stillspace/features/world/domain/entities/calm_energy.dart';

class CalculateFocusReward{
  const CalculateFocusReward();

  CalmEnergy execute(FocusSession session) {
    final duration = session.duration;
    final minutes = duration.inMinutes;

    if(minutes >= 45) {
      return CalmEnergy(15);
    }
    if (minutes >= 25) {
      return CalmEnergy(10);
    }

    if (minutes >= 10) {
      return CalmEnergy(5);
    }

    // Even short sessions are respected
    return CalmEnergy(2);
  }
}