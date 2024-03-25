import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:todoapp/providers/providers.dart';
import 'package:todoapp/utils/utils.dart';
import 'package:todoapp/widgets/widgets.dart';

class SelectCategory extends ConsumerWidget {
  const SelectCategory({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCategory = ref.watch(categoryProvider);
    final categories = TaskCategory.values.toList();
    return SizedBox(
      height: 60,
      child: Row(children: [
        Text(
          'Category',
          style: context.textTheme.titleMedium,
        ),
        const Gap(10),
        Expanded(
          child: ListView.separated(
            physics: const AlwaysScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (ctx, index) {
              final category = categories[index];

              return InkWell(
                borderRadius: BorderRadius.circular(25),
                onTap: () {
                  ref.read(categoryProvider.notifier).state = category;
                },
                child: CircleContainer(
                  color: category.color.withOpacity(0.2),
                  child: Icon(
                    category.icon,
                    color: category == selectedCategory
                        ? context.colorScheme.primary
                        : category.color,
                  ),
                ),
              );
            },
            separatorBuilder: (ctx, index) => const Gap(8),
            itemCount: categories.length,
          ),
        ),
      ]),
    );
  }
}
