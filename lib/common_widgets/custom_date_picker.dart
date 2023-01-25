import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app_elred/styles/fonts.dart';

class CustomDatePicker extends StatefulWidget {
  TextEditingController controller;

  String hintName;
  CustomDatePicker({
    Key? key,
    required this.controller,
    required this.hintName,
  }) : super(key: key);

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) => Container(
              height: 216,
              padding: const EdgeInsets.only(top: 6.0),
              // The Bottom margin is provided to align the popup above the system navigation bar.
              margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              // Provide a background color for the popup.
              color: CupertinoColors.systemBackground.resolveFrom(context),
              // Use a SafeArea widget to avoid system overlaps.
              child: SafeArea(
                top: false,
                child: child,
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 15),
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: TextField(
            onTap: () {
              _showDialog(CupertinoDatePicker(
                  initialDateTime: DateTime.now(),
                  maximumDate: DateTime(2100),
                  minimumDate: DateTime(1990),
                  mode: CupertinoDatePickerMode.date,
                  onDateTimeChanged: (DateTime date) {
                    widget.controller.text =
                        DateFormat('dd/MM/yyyy').format(date);
                  }));
            },
            style: AppFonts.smalltitle,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              focusColor: const Color(0xff888DAA),
              hintText: widget.hintName,
              hintStyle: AppFonts.addpageText,
              counterText: "",
            ),
            controller: widget.controller,
          ),
        ));
  }
}
