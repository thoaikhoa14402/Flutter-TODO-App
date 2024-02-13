import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/providers/category_provider.dart';
import 'package:todo_app/utils/extensions.dart';
import 'package:todo_app/utils/task_categories.dart';

class SelectCategory extends ConsumerWidget {
  const SelectCategory({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCategory = ref.watch(categoryProvider);
    final categories = TaskCategories.values.toList();
    return SizedBox(
      height: 60,
      child: Row(
        children: [
          Text(
            'Category',
            style: context.textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(width: 8),
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                return InkWell(
                  onTap: () {
                    ref.read(categoryProvider.notifier).state = category;
                  },
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    padding: const EdgeInsets.all(9.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: category == selectedCategory
                          ? Colors.black
                          : category.color.withOpacity(0.3),
                      border: Border.all(
                        width: 2,
                        color: category == selectedCategory
                            ? Colors.black
                            : category.color,
                      ),
                    ),
                    child: Center(
                      child: Icon(
                        category.icon,
                        color: category == selectedCategory
                            ? Colors.red
                            : category.color,
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
