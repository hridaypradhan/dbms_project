import 'package:dbms_project/database_helpers/budget_helper.dart';
import 'package:dbms_project/database_helpers/collab_helper.dart';
import 'package:dbms_project/global/strings.dart';
import 'package:dbms_project/models/budget_item.dart';
import 'package:dbms_project/models/club_collab.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dbms_project/screens/main_screen/widgets/reusable_box.dart';
import 'package:date_time_picker/date_time_picker.dart';

class AddCollabForm extends StatefulWidget {
  @override
  _AddCollabFormState createState() => _AddCollabFormState();
}

class _AddCollabFormState extends State<AddCollabForm> {
  String _chosenClubOne, _chosenClubTwo;
  DateTime _chosenDateTime;
  TextEditingController _eventNameController,
      _pocOneController,
      _pocTwoController,
      _amountController;
  @override
  void initState() {
    super.initState();
    _eventNameController = TextEditingController();
    _pocOneController = TextEditingController();
    _pocTwoController = TextEditingController();
    _amountController = TextEditingController();
  }

  @override
  void dispose() {
    _eventNameController.dispose();
    _pocOneController.dispose();
    _pocTwoController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          'Add Collaboration',
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
          keyboardType: TextInputType.name,
          textCapitalization: TextCapitalization.words,
          controller: _pocOneController,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            hintStyle: TextStyle(color: Colors.grey),
            hintText: 'POC for the first club',
          ),
        ),
        TextField(
          textAlign: TextAlign.center,
          controller: _pocTwoController,
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
            hintText: 'POC for the second club',
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ReusableBox(
              child: DropdownButton(
                value: _chosenClubOne,
                items: <String>[
                  'TEDx',
                  'E-Cell',
                  'Inspiria',
                  'Aura',
                  'Feeding India SNU',
                ].map<DropdownMenuItem<String>>(
                  (String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                      ),
                    );
                  },
                ).toList(),
                onChanged: (value) {
                  setState(
                    () {
                      _chosenClubOne = value;
                    },
                  );
                },
                hint: Text(
                  'Your Club',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            ReusableBox(
              child: DropdownButton(
                value: _chosenClubTwo,
                items: <String>[
                  'TEDx',
                  'E-Cell',
                  'Inspiria',
                  'Aura',
                  'Feeding India SNU',
                ].map<DropdownMenuItem<String>>(
                  (String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                      ),
                    );
                  },
                ).toList(),
                onChanged: (value) {
                  setState(
                    () {
                      _chosenClubTwo = value;
                    },
                  );
                },
                hint: Text(
                  'Other Club',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
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
        ReusableBox(
          child: DateTimePicker(
            type: DateTimePickerType.date,
            textAlign: TextAlign.center,
            firstDate: DateTime.now(),
            lastDate: DateTime(DateTime.now().year + 1),
            dateHintText: 'Tentative Event Date',
            onChanged: (value) {
              _chosenDateTime = DateTime.parse(value);
            },
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.grey,
          ),
          onPressed: () async {
            try {
              var newCollab = ClubCollab(
                eventName: _eventNameController.text.length == 0
                    ? 'Unnamed'
                    : _eventNameController.text,
                pocOne: _pocOneController.text.length == 0
                    ? 'XYZ'
                    : _pocOneController.text,
                pocTwo: _pocTwoController.text.length != 0
                    ? _pocTwoController.text
                    : 'XYZ',
                resourcesAllocated: double.parse(_amountController.text),
                eventMonth: _getMonthName(_chosenDateTime),
                clubTwo: _chosenClubTwo ?? 'Club 2',
                clubOne: _chosenClubOne ?? 'Club 1',
                imageUrl: _getImageUrl(_chosenClubTwo),
                isExpanded: false,
              );
              Provider.of<CollabHelper>(
                context,
                listen: false,
              ).insertCollab(newCollab);
              var newBudgetItem = BudgetItem(
                eventName: _eventNameController.text.length == 0
                    ? 'Unnamed'
                    : _eventNameController.text,
                amount: double.parse(_amountController.text),
                dateTime: _chosenDateTime,
                description: 'Collaboration with $_chosenClubTwo',
              );
              Provider.of<BudgetHelper>(
                context,
                listen: false,
              ).insertBudgetItem(newBudgetItem);
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
    _chosenClubOne = null;
    _chosenDateTime = null;
    _chosenClubTwo = null;
    _pocTwoController.clear();
    _pocOneController.clear();
    _eventNameController.clear();
  }

  String _getImageUrl(String clubTwo) {
    switch (clubTwo) {
      case 'TEDx':
        return tedxImageUrl;
      case 'Aura':
        return auraImageUrl;
      case 'Inspiria':
        return inspiriaImageUrl;
      case 'E-Cell':
        return ecellImageUrl;
      case 'Feeding India SNU':
        return feedingIndiaSnuImageUrl;
      default:
        return unnamedClubImageUrl;
    }
  }

  String _getMonthName(DateTime dateTime) {
    switch (dateTime.month) {
      case 1:
        return 'January';
      case 2:
        return 'February';
      case 3:
        return 'March';
      case 4:
        return 'April';
      case 5:
        return 'May';
      case 6:
        return 'June';
      case 7:
        return 'July';
      case 8:
        return 'August';
      case 9:
        return 'September';
      case 10:
        return 'October';
      case 11:
        return 'November';
      case 12:
        return 'December';
      default:
        return 'Unspecified';
    }
  }
}
