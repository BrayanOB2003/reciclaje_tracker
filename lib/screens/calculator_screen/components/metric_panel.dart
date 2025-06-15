import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MetricPanel extends StatelessWidget {
  final double co2;
  final double trees;
  final double energy;
  final double water;
  final double recycled;
  final void Function(String metric)? onMetricTap;

  const MetricPanel({
    super.key,
    required this.co2,
    required this.trees,
    required this.energy,
    required this.water,
    required this.recycled,
    this.onMetricTap,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 700),
        child: Card(
          elevation: 3,
          margin: const EdgeInsets.all(16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: LayoutBuilder(
              builder: (context, constraints) {
                // 2 filas en pantalla pequeña, 1 fila en ancha
                bool isWide = constraints.maxWidth > 500;
                return isWide
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: _buildMetrics(context),
                      )
                    : Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: _buildMetrics(context).sublist(0, 3),
                          ),
                          const SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: _buildMetrics(context).sublist(3, 5),
                          ),
                        ],
                      );
              },
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildMetrics(BuildContext context) {
    return [
      _AnimatedMetric(
        icon: Icons.cloud_outlined,
        label: 'CO₂ evitado',
        value: co2,
        unit: 'kg',
        color: Colors.teal,
        onTap: () => onMetricTap?.call('co2'),
      ),
      _AnimatedMetric(
        icon: Icons.park_outlined,
        label: 'Árboles',
        value: trees,
        unit: '',
        color: Colors.green,
        onTap: () => onMetricTap?.call('trees'),
      ),
      _AnimatedMetric(
        icon: Icons.bolt_outlined,
        label: 'Energía',
        value: energy,
        unit: 'kWh',
        color: Colors.orange,
        onTap: () => onMetricTap?.call('energy'),
      ),
      _AnimatedMetric(
        icon: Icons.water_drop_outlined,
        label: 'Agua',
        value: water,
        unit: 'L',
        color: Colors.blueAccent,
        onTap: () => onMetricTap?.call('water'),
      ),
      _AnimatedMetric(
        icon: Icons.recycling_outlined,
        label: 'Reciclado',
        value: recycled,
        unit: 'kg',
        color: Colors.grey[800]!,
        onTap: () => onMetricTap?.call('recycled'),
      ),
    ];
  }
}

class _AnimatedMetric extends StatefulWidget {
  final IconData icon;
  final String label;
  final double value;
  final String unit;
  final Color color;
  final VoidCallback? onTap;

  const _AnimatedMetric({
    required this.icon,
    required this.label,
    required this.value,
    required this.unit,
    required this.color,
    this.onTap,
  });

  @override
  State<_AnimatedMetric> createState() => _AnimatedMetricState();
}

class _AnimatedMetricState extends State<_AnimatedMetric> {
  double oldValue = 0.0;

  @override
  void didUpdateWidget(covariant _AnimatedMetric oldWidget) {
    if (oldWidget.value != widget.value) {
      oldValue = oldWidget.value;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    final NumberFormat formatter = NumberFormat.compact(locale: 'es');

    return Flexible(
      fit: FlexFit.tight,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
          decoration: BoxDecoration(
            color: widget.color.withOpacity(0.09),
            borderRadius: BorderRadius.circular(18),
          ),
          constraints: const BoxConstraints(
            minWidth: 70,
            maxWidth: 140,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(widget.icon, color: widget.color, size: 30),
              const SizedBox(height: 6),
              TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: oldValue, end: widget.value),
                duration: const Duration(milliseconds: 900),
                curve: Curves.easeOutCubic,
                builder: (context, value, child) {
                  return FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      '${formatter.format(value)}${widget.unit.isNotEmpty ? ' ${widget.unit}' : ''}',
                      style: TextStyle(
                        color: widget.color,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                    ),
                  );
                },
              ),
              const SizedBox(height: 4),
              Text(
                widget.label,
                style: const TextStyle(fontSize: 13, color: Colors.black87),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
