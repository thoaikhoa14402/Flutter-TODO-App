import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/data/models/task.dart';
import 'package:todo_app/providers/task/task_provider.dart';
import 'package:todo_app/utils/extensions.dart';
import 'package:todo_app/widgets/task_details/task_details.dart';
import 'package:todo_app/widgets/task_item.dart';

class MyCustomSearch extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final allTasks =
        ProviderScope.containerOf(context).read(taskProvider).tasks;
    final foundTask = allTasks.firstWhereOrNull((task) => task.title == query);
    return foundTask != null
        ? Padding(
            padding: const EdgeInsets.only(top: 12),
            child: InkWell(
                onTap: () async {
                  // Show task details
                  await showModalBottomSheet(
                    context: context,
                    builder: (ctx) {
                      return TaskDetails(task: foundTask);
                    },
                  );
                },
                child: TaskItem(task: foundTask)),
          )
        : const Center(
            child: Text('No results found.'),
          );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final allTasks =
        ProviderScope.containerOf(context).read(taskProvider).tasks;

    List<Task> matchQuery = [];
    for (var item in allTasks) {
      if (item.title.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }

    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(top: 12),
        child: Column(children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            width: double.infinity,
            child: Text('Suggested search',
                style: context.textTheme.titleLarge!.copyWith(
                  fontSize: 18,
                  color: Color.fromARGB(255, 114, 111, 111),
                )),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: matchQuery.length,
            itemBuilder: (context, index) {
              final task = matchQuery[index];
              return InkWell(
                onTap: () async {
                  // Show task details
                  await showModalBottomSheet(
                    context: context,
                    builder: (ctx) {
                      return TaskDetails(task: task);
                    },
                  );
                },
                child: TaskItem(
                  task: task,
                  isSearchView: true,
                ),
              );
            },
          ),
        ]),
      ),
    );
  }
}
