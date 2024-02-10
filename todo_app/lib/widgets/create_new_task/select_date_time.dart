import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/providers/date_provider.dart';
import 'package:todo_app/providers/time_provider.dart';
import 'package:todo_app/utils/helpers.dart';
import 'package:todo_app/widgets/create_new_task/common_text_field.dart';
import 'package:intl/intl.dart';

class SelectDateTime extends ConsumerWidget {
  const SelectDateTime({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final date = ref.watch(dateProvider);
    final time = ref.watch(timeProvider);

    return Row(
      children: [
        Expanded(
          child: CommonTextField(
            readOnly: true,
            title: 'Date',
            hintText: DateFormat.yMMMd().format(date),
            prefixIcon: IconButton(
              onPressed: () => _selectDate(context, ref),
              icon: const Icon(Icons.calendar_today),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: CommonTextField(
            readOnly: true,
            title: 'Time',
            hintText: Helpers.timeToString(time),
            prefixIcon: IconButton(
              onPressed: () => _selectTime(context, ref),
              icon: const Icon(Icons.access_alarm),
            ),
          ),
        ),
      ],
    );
  }
}

void _selectTime(BuildContext context, WidgetRef ref) async {
  final initalTime = ref.read(timeProvider);
  TimeOfDay? pickedTime = await showTimePicker(
    context: context,
    initialTime: initalTime,
  );

  if (pickedTime != null) {
    ref.read(timeProvider.notifier).state = pickedTime;
  }
}

void _selectDate(BuildContext context, WidgetRef ref) async {
  final initialDate = ref.read(dateProvider);
  DateTime? pickedDate = await showDatePicker(
    context: context,
    initialDate: initialDate,
    firstDate: DateTime(2023),
    lastDate: DateTime(2100),
  );
  if (pickedDate != null) {
    ref.read(dateProvider.notifier).state = pickedDate;
  }
}
