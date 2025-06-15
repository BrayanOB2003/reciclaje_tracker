import 'package:ReciTracker/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class RecyclingForm extends StatefulWidget {
  final void Function(Map<String, double> quantities) onSubmit;
  final void Function(Map<String, double> quantities) onAddDelivery;

  const RecyclingForm({
    super.key,
    required this.onSubmit,
    required this.onAddDelivery,
  });

  @override
  State<RecyclingForm> createState() => _RecyclingFormState();
}

class _RecyclingFormState extends State<RecyclingForm> {
  final _formKey = GlobalKey<FormState>();

  final List<String> _materials = [
    'paper',
    'cardboard',
    'plastic',
    'glass',
    'aluminum',
    'copper',
    'oil',
    'scrap',
  ];

  final Map<String, TextEditingController> _controllers = {
    'paper': TextEditingController(),
    'cardboard': TextEditingController(),
    'plastic': TextEditingController(),
    'glass': TextEditingController(),
    'aluminum': TextEditingController(),
    'copper': TextEditingController(),
    'oil': TextEditingController(),
    'scrap': TextEditingController(),
  };

  final Map<String, FocusNode> _focusNodes = {
    'paper': FocusNode(),
    'cardboard': FocusNode(),
    'plastic': FocusNode(),
    'glass': FocusNode(),
    'aluminum': FocusNode(),
    'copper': FocusNode(),
    'oil': FocusNode(),
    'scrap': FocusNode(),
  };

  final Map<String, IconData> _materialIcons = const {
    'paper': Icons.description_outlined,
    'cardboard': Icons.archive_outlined,
    'plastic': Icons.local_drink_outlined,
    'glass': Icons.wine_bar_outlined,
    'aluminum': Icons.kitchen_outlined,
    'copper': Icons.cable_outlined,
    'oil': Icons.oil_barrel_outlined,
    'scrap': Icons.settings_outlined,
  };

  @override
  void dispose() {
    for (var controller in _controllers.values) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes.values) {
      focusNode.dispose();
    }
    super.dispose();
  }

  void _handleSubmit() {
    if (_formKey.currentState!.validate()) {
      final Map<String, double> data = {};
      _controllers.forEach((material, controller) {
        final value = double.tryParse(controller.text.replaceAll(',', '.')) ?? 0.0;
        if (value > 0) {
          data[material] = value;
        }
      });
      widget.onSubmit(data);
    }
  }

  void _handleClear() {
    for (final controller in _controllers.values) {
      controller.clear();
    }
    setState(() {});
  }

void addDelivery(){
  final Map<String, double> data = {};
  _controllers.forEach((material, controller) {
    final value = double.tryParse(controller.text.replaceAll(',', '.')) ?? 0.0;
    if (value > 0) {
      data[material] = value;
    }
  });
  widget.onAddDelivery(data);
}

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final materialNames = {
      'paper': loc.materialPaper,
      'cardboard': loc.materialCardboard,
      'plastic': loc.materialPlastic,
      'glass': loc.materialGlass,
      'aluminum': loc.materialAluminum,
      'copper': loc.materialCopper,
      'oil': loc.materialOil,
      'scrap': loc.materialScrap,
    };

    // Agrupa de a dos materiales por fila
    List<Widget> rows = [];
    for (var i = 0; i < _materials.length; i += 2) {
      final left = _materials[i];
      final right = i + 1 < _materials.length ? _materials[i + 1] : null;
      rows.add(
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Row(
            children: [
              Expanded(
                child: _MaterialField(
                  icon: _materialIcons[left]!,
                  name: materialNames[left]!,
                  controller: _controllers[left]!,
                  kgLabel: loc.kg,
                  validator: (value) {
                    if (value == null || value.isEmpty) return null;
                    final v = double.tryParse(value.replaceAll(',', '.'));
                    if (v == null || v < 0) return loc.invalid;
                    return null;
                  },
                  focusNode: _focusNodes[left]!,
                  isActive: _focusNodes[left]!.hasFocus,
                  onClear: () {
                    _controllers[left]!.clear();
                    setState(() {});
                  },
                  onFocusChange: (active) => setState(() {}),
                ),
              ),
              const SizedBox(width: 12),
              if (right != null)
                Expanded(
                  child: _MaterialField(
                    icon: _materialIcons[right]!,
                    name: materialNames[right]!,
                    controller: _controllers[right]!,
                    kgLabel: loc.kg,
                    validator: (value) {
                      if (value == null || value.isEmpty) return null;
                      final v = double.tryParse(value.replaceAll(',', '.'));
                      if (v == null || v < 0) return loc.invalid;
                      return null;
                    },
                    focusNode: _focusNodes[right]!,
                    isActive: _focusNodes[right]!.hasFocus,
                    onClear: () {
                      _controllers[right]!.clear();
                      setState(() {});
                    },
                    onFocusChange: (active) => setState(() {}),
                  ),
                )
              else
                const Expanded(child: SizedBox()),
            ],
          ),
        ),
      );
    }

    return Form(
      key: _formKey,
      child: Card(
        margin: const EdgeInsets.all(12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  loc.enterRecycledMaterials,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
              ...rows,
              const SizedBox(height: 18),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: _handleClear,
                      icon: const Icon(Icons.delete_outline),
                      label: Text(loc.clearForm),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[200],
                        foregroundColor: Colors.black87,
                        minimumSize: const Size(0, 44),
                        textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: addDelivery,
                      icon: const Icon(Icons.add_box_outlined),
                      label: Text(loc.addDelivery),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightGreen[600],
                        foregroundColor: Colors.white,
                        minimumSize: const Size(0, 44),
                        textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: _handleSubmit,
                  icon: const Icon(Icons.check_circle_outline),
                  label: Text(loc.calculateBenefits),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(0, 44),
                    textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MaterialField extends StatefulWidget {
  final IconData icon;
  final String name;
  final TextEditingController controller;
  final String kgLabel;
  final String? Function(String?) validator;
  final FocusNode focusNode;
  final bool isActive;
  final VoidCallback onClear;
  final void Function(bool) onFocusChange;

  const _MaterialField({
    required this.icon,
    required this.name,
    required this.controller,
    required this.kgLabel,
    required this.validator,
    required this.focusNode,
    required this.isActive,
    required this.onClear,
    required this.onFocusChange,
  });

  @override
  State<_MaterialField> createState() => _MaterialFieldState();
}

class _MaterialFieldState extends State<_MaterialField> {
  @override
  void initState() {
    super.initState();
    widget.focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    widget.focusNode.removeListener(_onFocusChange);
    super.dispose();
  }

  void _onFocusChange() {
    widget.onFocusChange(widget.focusNode.hasFocus);
  }

  @override
  Widget build(BuildContext context) {
    final borderColor = widget.isActive
        ? Theme.of(context).colorScheme.primary
        : Colors.grey[400];

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: borderColor!,
          width: widget.isActive ? 2.2 : 1.2,
        ),
        color: widget.isActive ? Theme.of(context).colorScheme.primary.withOpacity(0.06) : null,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      margin: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Icon(widget.icon, size: 20, color: borderColor),
          const SizedBox(width: 7),
          // Nombre siempre muestra mínimo 5 letras (minWidth ~60-70)
          ConstrainedBox(
            constraints: const BoxConstraints(minWidth: 60, maxWidth: 120),
            child: Text(
              widget.name,
              style: TextStyle(
                fontSize: 14,
                color: Colors.black87,
                fontWeight: widget.isActive ? FontWeight.bold : FontWeight.normal,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              softWrap: false,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Stack(
              alignment: Alignment.centerRight,
              children: [
                TextFormField(
                  controller: widget.controller,
                  focusNode: widget.focusNode,
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(
                    labelText: widget.kgLabel,
                    border: const OutlineInputBorder(),
                    isDense: true,
                    contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                  ),
                  validator: widget.validator,
                ),
                if (widget.controller.text.isNotEmpty)
                  IconButton(
                    icon: const Icon(Icons.close, size: 18),
                    tooltip: MaterialLocalizations.of(context).deleteButtonTooltip,
                    onPressed: widget.onClear,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}