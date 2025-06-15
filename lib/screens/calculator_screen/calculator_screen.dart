import 'package:ReciTracker/l10n/app_localizations.dart';
import 'package:ReciTracker/model/delivery_entry.dart';
import 'package:ReciTracker/model/recycled_material.dart';
import 'package:ReciTracker/screens/calculator_screen/components/metric_panel.dart';
import 'package:ReciTracker/screens/calculator_screen/components/recycling_form.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CalculatorScreen extends StatefulWidget {
  final VoidCallback? onGoToTracking;

  const CalculatorScreen({super.key, this.onGoToTracking});
  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  double co2 = 0;
  double trees = 0;
  double energy = 0;
  double water = 0;
  double recycled = 0;

  void _onFormSubmit(Map<String, double> values) {
    final materials = values.entries
        .map((e) => RecycledMaterial(name: e.key, kgAmount: e.value))
        .toList();

    final results = calculateRecyclingBenefits(materials);
    setState(() {
      co2 = results.co2;
      trees = results.trees;
      energy = results.energy;
      water = results.water;
      recycled = results.totalRecycled;
    });
  }

  Future<void> addDelivery(DeliveryEntry entry) async {
    final box = Hive.box<DeliveryEntry>('deliveries');
    await box.add(entry);
    if (widget.onGoToTracking != null) {
      widget.onGoToTracking!();
    }
  }


  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(localization.appTitle)),
      body: Column(
        children: [
          MetricPanel(
            co2: co2,
            trees: trees,
            energy: energy,
            water: water,
            recycled: recycled,
            onMetricTap: (metric) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(localization.moreInfoAbout(metric))),
              );
            },
          ),
          // El formulario ahora es el único scrolleable y ocupa el espacio restante
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 16),
              child: RecyclingForm(
                onSubmit: _onFormSubmit,
                onAddDelivery: (values) async {
                  if(values.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Row(
                          children: [
                            const Icon(Icons.info_outline, color: Colors.white), // Ícono informativo
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                localization.emptyFormError,
                                style: const TextStyle(fontSize: 16, color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                        backgroundColor: Theme.of(context).colorScheme.primary, // O cualquier otro color de tu theme
                        duration: const Duration(seconds: 1),
                        elevation: 6,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        behavior: SnackBarBehavior.floating, // flotante, no cubre el BottomBar
                        margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                      ),
                    );
                    return;
                  } else {
                    final newEntry = DeliveryEntry(
                      date: DateTime.now(),
                      materials: values, // Usa keys estándar, localiza solo al mostrar
                    );
                    await addDelivery(newEntry);
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}