import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider_todo/providers/all_provider.dart';

class ToolBarWidgets extends ConsumerWidget {
  const ToolBarWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int onCompletedCount = ref
        .watch(todoListProvider)
        .where((element) => !element.complete)
        .length;

    final filter = ref.watch(todoListFilter);
    return Row(
      children: [
        Expanded(
            child: Text(onCompletedCount == 0
                ? 'Tüm görevler tamamlandı.'
                : "$onCompletedCount Görev var.")),
        Tooltip(
          message: 'Tüm Görevler.',
          child: TextButton(
              onPressed: () {
                ref.read(todoListFilter.notifier).state = TodoListFilter.all;
              },
              child: const Text("Tümü")),
        ),
        Tooltip(
          message: 'AktifGörevler.',
          child: TextButton(
              onPressed: () {
                ref.read(todoListFilter.notifier).state = TodoListFilter.active;
              },
              child: const Text("Tamamlanmış")),
        ),
        Tooltip(
          message: 'Tamamlanmış Görevler.',
          child: TextButton(
              onPressed: () {
                ref.read(todoListFilter.notifier).state =
                    TodoListFilter.completed;
              },
              child: const Text("Aktif")),
        ),
      ],
    );
  }
}
