import 'package:dbms_project/database_helpers/budget_helper.dart';
import 'package:dbms_project/models/budget_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:date_time_picker/date_time_picker.dart';

class AddBudgetItemForm extends StatefulWidget {
  @override
  _AddBudgetItemFormState createState() => _AddBudgetItemFormState();
}

class _AddBudgetItemFormState extends State<AddBudgetItemForm> {
  DateTime _chosenDateTime;
  TextEditingController _eventNameController,
      _descController,
      _amountController;
  @override
  void initState() {
    super.initState();
    _eventNameController = TextEditingController();
    _descController = TextEditingController();
    _amountController = TextEditingController();
  }

  @override
  void dispose() {
    _eventNameController.dispose();
    _descController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          'Add Budget Item',
          style: TextStyle(fontSize: 25.0),
        ),
        TextField(
          textAlign: TextAlign.center,
          keyboardType: TextInputType.name,
          textCapitalization: TextCapitalization.words,
          controller: _eventNameController,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            hintStyle: TextStyle(color: Colors.grey),
            hintText: 'Enter Event\'s Name',
          ),
        ),
        TextField(
          textAlign: TextAlign.center,
          controller: _descController,
          keyboardType: TextInputType.text,
          textCapitalization: TextCapitalization.sentences,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            hintStyle: TextStyle(color: Colors.grey),
            hintText: 'Enter Description',
          ),
        ),
        TextField(
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          controller: _amountController,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            hintStyle: TextStyle(color: Colors.grey),
            hintText: 'Enter Amount',
          ),
        ),
        DateTimePicker(
          type: DateTimePickerType.dateTimeSeparate,
          firstDate: DateTime.now(),
          lastDate: DateTime(DateTime.now().year + 2),
          dateHintText: 'Tentative Event Date',
          timeHintText: 'Time',
          onChanged: (value) {
            _chosenDateTime = DateTime.parse(value);
          },
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.grey,
          ),
          onPressed: () async {
            try {
              var newBudgetItem = BudgetItem(
                eventName: _eventNameController.text.length == 0
                    ? 'Unnamed Event'
                    : _eventNameController.text,
                description: _descController.text.length != 0
                    ? _descController.text
                    : 'Unspecified',
                amount: double.parse(_amountController.text),
                dateTime: _chosenDateTime ?? DateTime.now(),
              );
              Provider.of<BudgetHelper>(
                context,
                listen: false,
              ).insertTransaction(newBudgetItem);
              _clearFields();
              Navigator.pop(context);
            } catch (e) {
              print(e);
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Fill in all the fields!'),
                ),
              );
            }
          },
          child: Text('Submit'),
        ),
      ],
    );
  }

  _clearFields() {
    _amountController.clear();
    _chosenDateTime = null;
    _descController.clear();
    _eventNameController.clear();
  }
}
