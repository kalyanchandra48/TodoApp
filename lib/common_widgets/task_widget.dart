


import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app_elred/models/todo_data.dart';
import 'package:todo_app_elred/pages/home/home_page_components/edit_todo_page.dart';
import 'package:todo_app_elred/pages/home/home_page_view_model/todo_view_model.dart';
import 'package:todo_app_elred/styles/colors.dart';
import 'package:todo_app_elred/styles/fonts.dart';

class TaskWidget extends StatelessWidget {
  int index;
  AsyncSnapshot<List<TodoData>> snapshot;
  TaskWidget({
    Key? key,
    required this.index,
    required this.snapshot,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Slidable(
        startActionPane: ActionPane(motion: const DrawerMotion(), children: [
          SlidableAction(
            flex: 1,
            onPressed: (context) {
              TodoData completed = TodoData(
                  id: snapshot.data![index].id,
                  name: snapshot.data![index].name,
                  description: snapshot.data![index].description,
                  category: snapshot.data![index].category,
                  date: snapshot.data![index].date,
                  createdAt: snapshot.data![index].createdAt,
                  completed: true);
              TodoViewModel.updateTodo(completed);
            },
            backgroundColor: AppColors.screenColor,
            icon: Icons.task_alt_rounded,
            label: 'Completed',
          ),
        ]),
        endActionPane: ActionPane(
          motion: const DrawerMotion(),
          children: [
            SlidableAction(
              // An action can be bigger than the others.
              flex: 1,
              onPressed: (context) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            EditTodoPage(todoData: snapshot.data![index])));
              },

              backgroundColor: AppColors.screenColor,

              icon: Icons.edit,
              label: 'Edit',
            ),
            SlidableAction(
              flex: 1,
              onPressed: (context) {
                TodoViewModel.deleteTodo(snapshot.data![index]);
              },
              backgroundColor: AppColors.screenColor,
              icon: Icons.delete,
              label: 'Delete',
            ),
          ],
        ),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 27,
                    backgroundColor: Colors.grey.shade300,
                    child: CircleAvatar(
                      radius: 26,
                      backgroundColor: Colors.white,
                      child: snapshot.data?[index].category == 'BUSINESS'
                          ? const Icon(
                              Icons.business_center_outlined,
                              size: 25,
                            )
                          : const Icon(
                              Icons.person,
                              size: 25,
                            ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(snapshot.data?[index].name ?? '',
                                style: AppFonts.titleText),
                          ],
                        ),
                        Text(
                          snapshot.data?[index].description ?? '',
                          style: AppFonts.desText,
                        )
                      ],
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                      height: 40,
                      width: 40,
                      child: Text(
                          snapshot.data?[index].date.substring(0, 5) ?? '')),
                ],
              ),
              Divider(
                thickness: 1.2,
                color: Colors.grey.shade300,
              ),
            ],
          ),
        ),
      ),
    );
  }
}