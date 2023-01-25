import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_elred/pages/home/home_page_components/home_page_components.dart';
import 'package:todo_app_elred/pages/home/home_page_components/success_savetodo_page.dart';
import 'package:todo_app_elred/pages/home/home_page_view_model/todo_view_model.dart';

class NewTodoPage extends StatelessWidget {
  const NewTodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => TodoViewModel(),
        builder: (context, child) => const NewTodoScreen());
  }
}

class NewTodoScreen extends StatelessWidget {
  const NewTodoScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: TodoViewModel.of(context).confirmSave,
      builder: (context, value, child) => AnimatedSwitcher(
        switchInCurve: Curves.easeIn,
        switchOutCurve: Curves.easeOut,
        duration: const Duration(seconds: 2),
        child: value == false
            ? const AddNewTodoPage()
            : const TodoSaveSuccessPage(),
      ),
    );
  }
}
