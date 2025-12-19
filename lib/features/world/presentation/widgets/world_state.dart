import '../../domain/entities/calm_energy.dart';

class WorldState {
  final CalmEnergy energy;

  const WorldState(this.energy);

  factory WorldState.initial() {
    return const WorldState(CalmEnergy(0));
  }

  WorldState copyWith({
    CalmEnergy? energy,
  }) {
    return WorldState(
      energy ?? this.energy,
    );
  }
}
