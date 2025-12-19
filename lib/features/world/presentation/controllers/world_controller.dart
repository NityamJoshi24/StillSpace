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
    state = state.copyWith(calmEnergy: energy);
  }

  Future<void> addEnergy(CalmEnergy energy) async {
    final updated = state.calmEnergy.add(energy.value);

    state = state.copyWith(calmEnergy: updated);
    await repository.save(updated);
  }
}
