class CalmEnergy{
  final int total;

  CalmEnergy(this.total);

  CalmEnergy add(int amount){
    return CalmEnergy(total + amount);
  }
}