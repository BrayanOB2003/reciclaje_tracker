import 'package:ReciTracker/l10n/app_localizations.dart';
import 'package:ReciTracker/model/delivery_entry.dart';
import 'package:ReciTracker/model/recycled_material.dart';
import 'package:ReciTracker/screens/calculator_screen/components/metric_panel.dart';
import 'package:flutter/material.dart';

class TrackingScreen extends StatelessWidget {
  final List<DeliveryEntry> deliveries;

  const TrackingScreen({super.key, required this.deliveries});

  RecyclingResults getAccumulatedResults(List<DeliveryEntry> deliveries) {
    final Map<String, double> accumulated = {};
    for (final entry in deliveries) {
      entry.materials.forEach((material, qty) {
        accumulated[material] = (accumulated[material] ?? 0) + qty;
      });
    }
    final materials = accumulated.entries
        .map((e) => RecycledMaterial(name: e.key, kgAmount: e.value))
        .toList();
    return calculateRecyclingBenefits(materials);
  }

  // Map de íconos para materiales (puedes usar el mismo que tu formulario)
  static const materialIcons = {
    'paper': Icons.description_outlined,
    'cardboard': Icons.archive_outlined,
    'plastic': Icons.local_drink_outlined,
    'glass': Icons.wine_bar_outlined,
    'aluminum': Icons.kitchen_outlined,
    'copper': Icons.cable_outlined,
    'oil': Icons.oil_barrel_outlined,
    'scrap': Icons.settings_outlined,
  };

  // Colores base para materiales
  static const materialColors = {
    'paper': Colors.brown,
    'cardboard': Colors.orange,
    'plastic': Colors.lightBlue,
    'glass': Colors.green,
    'aluminum': Colors.grey,
    'copper': Colors.deepOrange,
    'oil': Colors.amber,
    'scrap': Colors.blueGrey,
  };

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final results = getAccumulatedResults(deliveries);

    return Scaffold(
      appBar: AppBar(title: Text(loc.trackingTitle)),
      body: Column(
        children: [
          MetricPanel(
            co2: results.co2,
            trees: results.trees,
            energy: results.energy,
            water: results.water,
            recycled: results.totalRecycled,
            onMetricTap: (metric) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(loc.moreInfoAbout(metric))),
              );
            },
          ),
          Expanded(
            child: Container(
              color: Theme.of(context).colorScheme.surface.withOpacity(0.01),
              child: deliveries.isEmpty
                  ? Center(
                      child: Text(
                        loc.noData,
                        style: const TextStyle(fontSize: 16, color: Colors.black54),
                      ),
                    )
                  : ListView.separated(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
                      itemCount: deliveries.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 14),
                      itemBuilder: (context, index) {
                        final entry = deliveries[deliveries.length - 1 - index]; // más reciente arriba
                        final date = entry.date;
                        final dateStr = MaterialLocalizations.of(context).formatShortDate(date);
                        final timeStr = MaterialLocalizations.of(context).formatTimeOfDay(
                          TimeOfDay.fromDateTime(date),
                          alwaysUse24HourFormat: false,
                        );
                        final totalKg = entry.materials.values.fold<double>(0, (a, b) => a + b);

                        return Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Cabecera: ícono, fecha, total
                                Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Colors.green[100],
                                      foregroundColor: Colors.green[900],
                                      child: const Icon(Icons.delivery_dining),
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "$dateStr • $timeStr",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                              color: Colors.grey[900],
                                            ),
                                          ),
                                          const SizedBox(height: 2),
                                          Text(
                                            "${loc.totalRecycled}: ${totalKg.toStringAsFixed(2)} kg",
                                            style: TextStyle(
                                              color: Colors.grey[700],
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    // Puedes agregar aquí un botón de más detalles si lo deseas
                                    // IconButton(icon: Icon(Icons.chevron_right), onPressed: () {})
                                  ],
                                ),
                                const SizedBox(height: 10),
                                // Lista de materiales reciclados en la entrega
                                Wrap(
                                  spacing: 8,
                                  runSpacing: 6,
                                  children: entry.materials.entries
                                      .where((e) => e.value > 0)
                                      .map((e) {
                                    final matKey = e.key;
                                    final matName = e.key;
                                    final color = materialColors[matKey] ?? Colors.blueGrey;
                                    final icon = materialIcons[matKey] ?? Icons.recycling_outlined;
                                    return Chip(
                                      label: Text(
                                        "$matName: ${e.value.toStringAsFixed(2)} kg",
                                        style: const TextStyle(color: Colors.white),
                                      ),
                                      avatar: Icon(icon, color: Colors.white, size: 19),
                                      backgroundColor: color.withOpacity(0.85),
                                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                    );
                                  }).toList(),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ),
        ],
      ),
    );
  }
}