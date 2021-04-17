import 'package:dbms_project/global/constants.dart';
import 'package:dbms_project/database_helpers/club_transaction_helper.dart';
import 'package:dbms_project/global/enums.dart';
import 'package:dbms_project/models/club_transaction.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dbms_project/screens/main_screen/widgets/reusable_box.dart';
import 'package:date_time_picker/date_time_picker.dart';

class AddTransactionForm extends StatefulWidget {
  @override
  _AddTransactionFormState createState() => _AddTransactionFormState();
}

class _AddTransactionFormState extends State<AddTransactionForm> {
  String _chosenCategory, _chosenPaymentMethod, _chosenDirection;
  DateTime _chosenDateTime;
  TextEditingController _payerController,
      _payeeController,
      _descController,
      _amountController;
  @override
  void initState() {
    super.initState();
    _payerController = TextEditingController();
    _payeeController = TextEditingController();
    _descController = TextEditingController();
    _amountController = TextEditingController();
  }

  @override
  void dispose() {
    _payerController.dispose();
    _payeeController.dispose();
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
          'Add Transaction',
          style: TextStyle(fontSize: 25.0),
        ),
        TextField(
          textAlign: TextAlign.center,
          keyboardType: TextInputType.name,
          textCapitalization: TextCapitalization.words,
          controller: _payerController,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            hintStyle: TextStyle(color: Colors.grey),
            hintText: 'Enter Payer\'s Name',
          ),
        ),
        TextField(
          textAlign: TextAlign.center,
          keyboardType: TextInputType.name,
          textCapitalization: TextCapitalization.words,
          controller: _payeeController,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            hintStyle: TextStyle(color: Colors.grey),
            hintText: 'Enter Payee\'s Name',
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ReusableBox(
              child: DropdownButton(
                value: _chosenCategory,
                items: <String>[
                  'Transport',
                  'Food',
                  'Misc',
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
                      _chosenCategory = value;
                    },
                  );
                },
                hint: Text(
                  'Category',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            ReusableBox(
              child: DropdownButton(
                value: _chosenPaymentMethod,
                items: <String>[
                  'GPay',
                  'Paytm',
                  'Cash',
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
                      _chosenPaymentMethod = value;
                    },
                  );
                },
                hint: Text(
                  'Payment Via',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            ReusableBox(
              child: DropdownButton(
                value: _chosenDirection,
                items: <String>[
                  'Incoming',
                  'Outgoing',
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
                      _chosenDirection = value;
                    },
                  );
                },
                hint: Text(
                  'Direction',
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
        DateTimePicker(
          type: DateTimePickerType.dateTimeSeparate,
          firstDate: DateTime(2021),
          lastDate: DateTime.now(),
          dateHintText: 'Transaction Date',
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
              var newTransaction = ClubTransaction(
                payer: _payerController.text.length == 0
                    ? 'XYZ'
                    : _payerController.text,
                payee: _payeeController.text.length == 0
                    ? 'XYZ'
                    : _payeeController.text,
                description: _descController.text.length != 0
                    ? _descController.text
                    : 'Unspecified',
                amount: double.parse(_amountController.text),
                dateTime: _chosenDateTime ?? DateTime.now(),
                paymentMethod: getPaymentMethod(_chosenPaymentMethod) ??
                    PaymentMethod.Cash,
                paymentCategory: getPaymentCategory(_chosenCategory) ??
                    PaymentCategory.Transport,
                transactionDirection: getDirection(_chosenDirection) ??
                    ClubTransactionDirection.Incoming,
              );
              Provider.of<ClubTransactionHelper>(
                context,
                listen: false,
              ).insertTransaction(newTransaction);
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
    _chosenCategory = null;
    _chosenDateTime = null;
    _chosenDirection = null;
    _chosenPaymentMethod = null;
    _descController.clear();
    _payeeController.clear();
    _payerController.clear();
  }
}
