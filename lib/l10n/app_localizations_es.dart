// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'EcoTrack';

  @override
  String get calculatorTitle => 'Calculadora de Reciclaje';

  @override
  String get trackingTitle => 'Seguimiento de Entregas';

  @override
  String get enterRecycledMaterials => 'Ingresa tus materiales reciclados';

  @override
  String get calculateBenefits => 'Calcular Beneficios';

  @override
  String get invalid => 'Inválido';

  @override
  String get kg => 'Kg';

  @override
  String get materialPaper => 'Papel';

  @override
  String get materialCardboard => 'Cartón';

  @override
  String get materialPlastic => 'Plástico';

  @override
  String get materialGlass => 'Vidrio';

  @override
  String get materialAluminum => 'Aluminio';

  @override
  String get materialCopper => 'Cobre';

  @override
  String get materialOil => 'Aceite';

  @override
  String get materialScrap => 'Chatarra';

  @override
  String get co2Saved => 'CO₂ evitado';

  @override
  String get treesSaved => 'Árboles';

  @override
  String get energySaved => 'Energía';

  @override
  String get waterSaved => 'Agua';

  @override
  String get recycled => 'Reciclado';

  @override
  String get metricUnitKg => 'kg';

  @override
  String get metricUnitKwh => 'kWh';

  @override
  String get metricUnitL => 'L';

  @override
  String moreInfoAbout(Object metric) {
    return '¡Más info sobre $metric!';
  }

  @override
  String get simulateUpdate => 'Simular actualización';

  @override
  String get formRequired => 'Obligatorio';

  @override
  String get formOnlyPositive => 'Solo se permiten números positivos';

  @override
  String get formEnterNumber => 'Ingrese un número';

  @override
  String get welcomeMessage => '¡Bienvenido a tu app de reciclaje!';

  @override
  String get calculatorDescription => 'Calcula el beneficio ecológico de tus materiales reciclados.';

  @override
  String get trackingDescription => 'Visualiza el historial de tus entregas y el impacto general.';

  @override
  String get noData => 'Sin datos disponibles';

  @override
  String get totalRecycled => 'Total reciclado';

  @override
  String co2Equivalence(Object km) {
    return 'Esto equivale a evitar que un auto recorra $km km.';
  }

  @override
  String get addDelivery => 'Añadir entrega';

  @override
  String get clearForm => 'Limpiar campos';

  @override
  String get emptyFormError => '¡Digita tu reciclaje!';
}
