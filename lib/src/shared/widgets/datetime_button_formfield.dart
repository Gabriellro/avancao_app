import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimeFormFild extends StatefulWidget {
  final String label;

  const DateTimeFormFild({super.key, required this.label});

  @override
  State<DateTimeFormFild> createState() => _DateTimeFormFildState();
}

class _DateTimeFormFildState extends State<DateTimeFormFild> {
  String formattedDate = DateFormat("dd/MM/yyyy").format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    TextEditingController dateInputController = TextEditingController();

    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.today_rounded,
        ),
        labelText: widget.label,
      ),
      controller: dateInputController,
      readOnly: true,
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1950),
            lastDate: DateTime(2050));

        if (pickedDate != null) {
          dateInputController.text =
              DateFormat("dd/MM/yyyy").format(pickedDate);
        }
      },
    );
  }
}
