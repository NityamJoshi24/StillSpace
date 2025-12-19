import 'package:hive/hive.dart';

import '../domain/entities/calm_energy.dart';
class CalmEnergyRepository{
  static const _boxName = 'calm_energy';

  Future<CalmEnergy> load() async{
    final box = await Hive.openBox<int>(_boxName);
    final value = box.get('total', defaultValue: 0)!;
    return CalmEnergy(value);
  }

  Future<void> save(CalmEnergy energy) async {
    final box = await Hive.openBox<int>(_boxName);
    await box.put('total' , energy.total);
  }
}