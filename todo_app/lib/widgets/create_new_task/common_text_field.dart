import 'package:flutter/material.dart';
import 'package:todo_app/utils/extensions.dart';

class CommonTextField extends StatelessWidget {
  const CommonTextField({
    super.key,
    required this.title,
    required this.hintText,
    this.prefixIcon,
    this.maxLines,
    this.readOnly = false,
    this.controller,
  });

  final String title;
  final String hintText;
  final Widget? prefixIcon;
  final int? maxLines;
  final bool readOnly;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: context.textTheme.titleLarge!.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          readOnly: readOnly,
          controller: controller,
          onTapOutside: (event) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          textAlignVertical: TextAlignVertical.top,
          decoration: InputDecoration(
            prefixIcon: prefixIcon,
            hintText: hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          maxLines: maxLines,
          onChanged: (value) {},
        )
      ],
    );
  }
}
