import '../../domain/entities/calm_energy.dart';

class WorldState {
  final CalmEnergy calmEnergy;

  const WorldState({required this.calmEnergy});

  factory WorldState.initial() {
    return const WorldState(
      calmEnergy: CalmEnergy(0),
    );
  }

  WorldState copyWith({
    CalmEnergy? calmEnergy,
  }) {
    return WorldState(
      calmEnergy: calmEnergy ?? this.calmEnergy,
    );
  }
}
