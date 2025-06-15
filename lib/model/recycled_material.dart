class RecycledMaterial {
  final String name;
  final double kgAmount;

  RecycledMaterial({required this.name, required this.kgAmount});
}

class RecyclingFactors {
  final double co2PerKg;
  final double treesPerKg;
  final double energyPerKg;
  final double waterPerKg;

  const RecyclingFactors({
    required this.co2PerKg,
    required this.treesPerKg,
    required this.energyPerKg,
    required this.waterPerKg,
  });
}

// Predefined factors per material
const Map<String, RecyclingFactors> recyclingFactorsByMaterial = {
  'paper': RecyclingFactors(
    co2PerKg: 1.7, treesPerKg: 0.017, energyPerKg: 4.1, waterPerKg: 26500,
  ),
  'cardboard': RecyclingFactors(
    co2PerKg: 1.0, treesPerKg: 0.013, energyPerKg: 2.6, waterPerKg: 21000,
  ),
  'plastic': RecyclingFactors(
    co2PerKg: 1.5, treesPerKg: 0.0, energyPerKg: 1.4, waterPerKg: 2000,
  ),
  'glass': RecyclingFactors(
    co2PerKg: 0.3, treesPerKg: 0.0, energyPerKg: 0.7, waterPerKg: 500,
  ),
  'aluminum': RecyclingFactors(
    co2PerKg: 9.0, treesPerKg: 0.0, energyPerKg: 14.0, waterPerKg: 100,
  ),
  'copper': RecyclingFactors(
    co2PerKg: 5.0, treesPerKg: 0.0, energyPerKg: 6.0, waterPerKg: 200,
  ),
  'oil': RecyclingFactors(
    co2PerKg: 3.0, treesPerKg: 0.0, energyPerKg: 0.0, waterPerKg: 8000,
  ),
  'scrap': RecyclingFactors(
    co2PerKg: 2.5, treesPerKg: 0.0, energyPerKg: 3.0, waterPerKg: 500,
  ),
};

class RecyclingResults {
  final double co2;
  final double trees;
  final double energy;
  final double water;
  final double totalRecycled;

  RecyclingResults({
    required this.co2,
    required this.trees,
    required this.energy,
    required this.water,
    required this.totalRecycled,
  });
}

RecyclingResults calculateRecyclingBenefits(List<RecycledMaterial> materials) {
  double co2 = 0;
  double trees = 0;
  double energy = 0;
  double water = 0;
  double totalRecycled = 0;

  for (final material in materials) {
    final factor = recyclingFactorsByMaterial[material.name.toLowerCase()];
    if (factor != null) {
      co2 += material.kgAmount * factor.co2PerKg;
      trees += material.kgAmount * factor.treesPerKg;
      energy += material.kgAmount * factor.energyPerKg;
      water += material.kgAmount * factor.waterPerKg;
      totalRecycled += material.kgAmount;
    }
  }

  return RecyclingResults(
    co2: co2,
    trees: trees,
    energy: energy,
    water: water,
    totalRecycled: totalRecycled,
  );
}