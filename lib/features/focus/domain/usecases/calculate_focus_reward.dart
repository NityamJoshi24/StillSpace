import 'package:stillspace/features/focus/domain/entities/focus_session.dart';
import 'package:stillspace/features/world/domain/entities/calm_energy.dart';

class CalculateFocusReward{
  const CalculateFocusReward();

  CalmEnergy execute(FocusSession session) {
    final duration = session.duration;
    final minutes = duration.inMinutes;

    if(minutes >= 45) {
      return const CalmEnergy(15);
    }
    if (minutes >= 25) {
      return const CalmEnergy(10);
    }

    if (minutes >= 10) {
      return const CalmEnergy(5);
    }

    // Even short sessions are respected
    return const CalmEnergy(2);
  }
}