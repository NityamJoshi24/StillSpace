import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/calm_energy_repository.dart';
import '../../domain/entities/calm_energy.dart';
import '../widgets/world_state.dart';

class WorldController extends StateNotifier<WorldState> {
  final CalmEnergyRepository repository;

  WorldController(this.repository)
      : super(WorldState.initial()) {
    _load();
  }

  Future<void> _load() async {
    final energy = await repository.load();
    state = state.copyWith(energy: energy);
  }

  /// World only applies rewards — it does NOT calculate them
  Future<void> addEnergy(CalmEnergy reward) async {
    final updated = state.energy.add(reward.amount);

    state = state.copyWith(energy: updated);
    await repository.save(updated);
  }
}
