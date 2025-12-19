import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stillspace/features/world/data/calm_energy_repository.dart';
import 'package:stillspace/features/world/presentation/controllers/world_controller.dart';
import 'package:stillspace/features/world/presentation/widgets/world_state.dart';

final calmEnergyRepositoryProvier =
  Provider((_) => CalmEnergyRepository());

final   worldControlProvider =  StateNotifierProvider<WorldController, WorldState>((ref) {
    return WorldController(ref.read(calmEnergyRepositoryProvier));
});