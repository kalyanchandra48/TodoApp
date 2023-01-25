import 'package:flutter/material.dart';
import 'package:todo_app_elred/common_widgets/custom_date_picker.dart';
import 'package:todo_app_elred/common_widgets/textfield_widget.dart';
import 'package:todo_app_elred/models/todo_data.dart';
import 'package:todo_app_elred/pages/home/home_page_view_model/todo_view_model.dart';
import 'package:todo_app_elred/styles/colors.dart';
import 'package:todo_app_elred/styles/fonts.dart';
import 'package:uuid/uuid.dart';

class AddNewTodoPage extends StatefulWidget {
  const AddNewTodoPage({
    Key? key,
  }) : super(key: key);

  @override
  State<AddNewTodoPage> createState() => _AddNewTodoPageState();
}

class _AddNewTodoPageState extends State<AddNewTodoPage> {
  TextEditingController todoname = TextEditingController();

  TextEditingController tododate = TextEditingController();

  TextEditingController tododescription = TextEditingController();

  String _selectedCategory = 'BUSINESS';

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'ADD',
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.addTaskColor,
          elevation: 0.0,
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 30,
                ),
              )),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 15),
              child: Icon(
                Icons.tune,
                color: Colors.white,
                size: 30,
              ),
            )
          ],
          title: Text(
            'Add new todo',
            style: AppFonts.appBarHeader,
          ),
          centerTitle: true,
        ),
        backgroundColor: AppColors.addTaskColor,
        resizeToAvoidBottomInset: false,
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Center(
                child: CircleAvatar(
                  radius: 25.5,
                  backgroundColor: Colors.grey,
                  child: CircleAvatar(
                    radius: 25,
                    backgroundColor: Color(0xff475395),
                    child: Icon(
                      Icons.task_alt_rounded,
                      color: Colors.white54,
                      size: 30,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              DropdownButton<String>(
                dropdownColor: Colors.blue,
                isExpanded: true,
                icon: const Icon(
                  Icons.arrow_drop_down,
                  size: 30,
                ),
                iconEnabledColor: Colors.white,
                iconDisabledColor: Colors.white,
                value: _selectedCategory,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedCategory = newValue!;
                  });
                },
                items: <String>['BUSINESS', 'PERSONAL']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: AppFonts.smalltitle,
                    ),
                  );
                }).toList(),
              ),
              CustomTextField(controller: todoname, hintName: 'Task name'),
              CustomTextField(
                  controller: tododescription, hintName: 'Description'),
              CustomDatePicker(controller: tododate, hintName: 'Date'),
              GestureDetector(
                onTap: () {
                  var uid = const Uuid();

                  String createdTime = DateTime.now().toString();
                  TodoViewModel.saveTodo(TodoData(
                    id: uid.v4(),
                    name: todoname.text,
                    category: _selectedCategory,
                    description: tododescription.text,
                    date: tododate.text,
                    createdAt: createdTime,
                    completed: false,
                  ));
                  TodoViewModel.of(context).setConfirmSave(true);
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 40),
                  height: 50,
                  width: MediaQuery.of(context).size.width / 2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: Colors.blue,
                  ),
                  child: Center(
                      child: Text(
                    'ADD YOUR TODO',
                    style: AppFonts.smalltitle,
                  )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
