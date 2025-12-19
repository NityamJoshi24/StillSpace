class CalmEnergy {
  final int amount;

  const CalmEnergy(this.amount);

  CalmEnergy add(int value) {
    return CalmEnergy(amount + value);
  }
}
