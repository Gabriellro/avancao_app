import 'package:flutter/material.dart';

class DropdownMenuExample extends StatefulWidget {
  final String label;

  final String hint;
  final List<String> items;

  const DropdownMenuExample({
    Key? key,
    required this.label,
    required this.hint,
    required this.items,
  }) : super(key: key);

  @override
  State<DropdownMenuExample> createState() => _DropdownMenuExampleState();
}

class _DropdownMenuExampleState extends State<DropdownMenuExample> {
  Map<String, Object> formData = <String, Object>{};
  // ignore: prefer_final_fields, unused_field
  String? _selectedVal = '';
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        labelText: widget.label,
        hintText: widget.hint,
        hintStyle: Theme.of(context)
            .textTheme
            .bodyMedium
            ?.copyWith(color: Theme.of(context).colorScheme.outline),
      ),
      icon: const Icon(Icons.arrow_drop_down_rounded),
      items: widget.items
          .map(
            (e) => DropdownMenuItem(value: e, child: Text(e)),
          )
          .toList(),
      onChanged: (val) => setState(() => _selectedVal = val as String?),
    );
  }
}
