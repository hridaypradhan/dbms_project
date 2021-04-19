import 'package:dbms_project/database_helpers/balances_helper.dart';
import 'package:dbms_project/database_helpers/initialization_helper.dart';
import 'package:dbms_project/models/initial_data.dart';
import 'package:dbms_project/screens/main_screen/widgets/reusable_box.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddInitialDataForm extends StatefulWidget {
  @override
  _AddInitialDataFormState createState() => _AddInitialDataFormState();
}

class _AddInitialDataFormState extends State<AddInitialDataForm> {
  TextEditingController _gpayController, _paytmController, _cashController;
  String _clubName;
  @override
  void initState() {
    super.initState();
    _cashController = TextEditingController();
    _gpayController = TextEditingController();
    _paytmController = TextEditingController();
  }

  @override
  void dispose() {
    _cashController.dispose();
    _gpayController.dispose();
    _paytmController.dispose();
    super.dispose();
  }

  final List<String> _clubs = [
    'TEDx',
    'E-Cell',
    'Inspiria',
    'Aura',
    'Feeding India SNU',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ReusableBox(
                child: DropdownButton(
                  value: _clubName,
                  items: _clubs.map<DropdownMenuItem<String>>(
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
                        _clubName = value;
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
              TextField(
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                textCapitalization: TextCapitalization.words,
                controller: _gpayController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  hintStyle: TextStyle(color: Colors.grey),
                  hintText: 'Enter initial GPay balance',
                ),
              ),
              TextField(
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                textCapitalization: TextCapitalization.words,
                controller: _paytmController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  hintStyle: TextStyle(color: Colors.grey),
                  hintText: 'Enter initial Paytm balance',
                ),
              ),
              TextField(
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                textCapitalization: TextCapitalization.words,
                controller: _cashController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  hintStyle: TextStyle(color: Colors.grey),
                  hintText: 'Enter initial cash balance',
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey,
                ),
                onPressed: () async {
                  try {
                    var initialData = InitialData(
                      clubName: _clubName,
                      paytm: double.parse(_paytmController.text),
                      gpay: double.parse(_gpayController.text),
                      cash: double.parse(_cashController.text),
                    );
                    Provider.of<InitializationHelper>(
                      context,
                      listen: false,
                    ).insertInitialData(initialData);
                    Provider.of<BalancesHelper>(
                      context,
                      listen: false,
                    ).initializeBalances(initialData);
                  } catch (e) {
                    print(e);
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
          ),
        ),
      ),
    );
  }
}
