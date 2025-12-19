class CalmEnergy {
  final int value;

  const CalmEnergy(this.value);

  CalmEnergy add(int amount) {
    return CalmEnergy(value + amount);
  }
}
