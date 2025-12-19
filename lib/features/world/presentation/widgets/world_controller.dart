import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stillspace/features/focus/domain/entities/focus_session.dart';
import 'package:stillspace/features/world/data/calm_energy_repository.dart';
import 'package:stillspace/features/world/domain/entities/calm_energy.dart';
import 'package:stillspace/features/world/presentation/widgets/world_state.dart';

class WorldController extends StateNotifier<WorldState> {
  final CalmEnergyRepository repository;

  WorldController(this.repository) : super(WorldState(CalmEnergy(0))) {
    _load();
  }

  Future<void> _load() async {
    final energy = await repository.load();
    state = WorldState(energy);
  }

  Future<void> onFocusCompleted(FocusSession session) async {
    final minutes = session.duration.inMinutes;
    final updated = state.energy.add(minutes);

    state = WorldState(updated);
    await repository.save(updated);
  }
}