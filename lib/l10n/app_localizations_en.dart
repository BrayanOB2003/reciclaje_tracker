// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'EcoTrack';

  @override
  String get calculatorTitle => 'Recycling Calculator';

  @override
  String get trackingTitle => 'Deliveries Tracking';

  @override
  String get enterRecycledMaterials => 'Enter your recycled materials';

  @override
  String get calculateBenefits => 'Calculate Benefits';

  @override
  String get invalid => 'Invalid';

  @override
  String get kg => 'Kg';

  @override
  String get materialPaper => 'Paper';

  @override
  String get materialCardboard => 'Cardboard';

  @override
  String get materialPlastic => 'Plastic';

  @override
  String get materialGlass => 'Glass';

  @override
  String get materialAluminum => 'Aluminum';

  @override
  String get materialCopper => 'Copper';

  @override
  String get materialOil => 'Oil';

  @override
  String get materialScrap => 'Scrap';

  @override
  String get co2Saved => 'CO₂ saved';

  @override
  String get treesSaved => 'Trees';

  @override
  String get energySaved => 'Energy';

  @override
  String get waterSaved => 'Water';

  @override
  String get recycled => 'Recycled';

  @override
  String get metricUnitKg => 'kg';

  @override
  String get metricUnitKwh => 'kWh';

  @override
  String get metricUnitL => 'L';

  @override
  String moreInfoAbout(Object metric) {
    return 'More info about $metric!';
  }

  @override
  String get simulateUpdate => 'Simulate update';

  @override
  String get formRequired => 'Required';

  @override
  String get formOnlyPositive => 'Only positive numbers allowed';

  @override
  String get formEnterNumber => 'Enter a number';

  @override
  String get welcomeMessage => 'Welcome to your recycling app!';

  @override
  String get calculatorDescription => 'Calculate the ecological benefit of your recycled materials.';

  @override
  String get trackingDescription => 'View the history of your deliveries and overall impact.';

  @override
  String get noData => 'No data available';

  @override
  String get totalRecycled => 'Total recycled';

  @override
  String co2Equivalence(Object km) {
    return 'This is equivalent to avoiding a car driving $km km.';
  }

  @override
  String get addDelivery => 'Add delivery';

  @override
  String get clearForm => 'Clear fields';

  @override
  String get emptyFormError => 'Digitize your recycling!';
}
