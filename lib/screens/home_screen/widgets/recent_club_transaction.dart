import 'package:dbms_project/database_helpers/balances_helper.dart';
import 'package:dbms_project/global/constants.dart';
import 'package:dbms_project/database_helpers/club_transaction_helper.dart';
import 'package:dbms_project/global/enums.dart';
import 'package:dbms_project/models/club_transaction.dart';
import 'package:expand_widget/expand_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RecentClubTransaction extends StatelessWidget {
  final ClubTransaction clubTransaction;

  RecentClubTransaction({this.clubTransaction});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: getPaymentCategoryIcon(clubTransaction.paymentCategory),
      title: Text('${clubTransaction.payer} to ${clubTransaction.payee}'),
      subtitle: ExpandText(
        'Date: ${_getDate(clubTransaction)} \nReason: ${clubTransaction.description} \nCategory: ${getCategoryName(clubTransaction)} \nPayment Method: ${getPaymentMethodName(clubTransaction)}',
        maxLines: 1,
        expandWidth: true,
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          clubTransaction.transactionDirection ==
                  ClubTransactionDirection.Incoming
              ? Icon(
                  Icons.arrow_downward_rounded,
                  color: Colors.green,
                )
              : Icon(
                  Icons.arrow_upward_rounded,
                  color: Colors.red,
                ),
          SizedBox(
            width: 10.0,
          ),
          Text(
            '₹${clubTransaction.amount.toString()}',
          ),
          SizedBox(
            width: 10.0,
          ),
          IconButton(
            icon: Icon(
              Icons.delete_rounded,
            ),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Are you sure?'),
                  action: SnackBarAction(
                    label: 'Delete',
                    onPressed: () {
                      Provider.of<ClubTransactionHelper>(
                        context,
                        listen: false,
                      ).deleteTransaction(
                        clubTransaction.id.toString(),
                      );
                      Provider.of<BalancesHelper>(
                        context,
                        listen: false,
                      ).getBalancesFromTable();
                    },
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  String _getDate(ClubTransaction clubTransaction) =>
      '${clubTransaction.dateTime.day}/${clubTransaction.dateTime.month}/${clubTransaction.dateTime.year}';
}
