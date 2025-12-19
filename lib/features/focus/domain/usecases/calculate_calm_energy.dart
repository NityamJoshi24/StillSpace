import '../../../world/domain/entities/calm_energy.dart';

class CalculateCalmEnergy {
  const CalculateCalmEnergy();

  CalmEnergy call(Duration duration) {
    final minutes = duration.inMinutes;

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
