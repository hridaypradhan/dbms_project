import 'package:dbms_project/constants.dart';
import 'package:dbms_project/models/club_transaction.dart';
import 'package:expand_widget/expand_widget.dart';
import 'package:flutter/material.dart';

class RecentClubTransaction extends StatelessWidget {
  final ClubTransaction clubTransaction;

  RecentClubTransaction({this.clubTransaction});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: getPaymentCategoryIconFromEnum(clubTransaction.paymentCategory),
      title: Text('${clubTransaction.payer} to ${clubTransaction.payee}'),
      subtitle: ExpandText(
        'Date: ${_getDate(clubTransaction)} \nReason: ${clubTransaction.description} \nCategory: ${_getCategory(clubTransaction)}',
        maxLines: 1,
        expandWidth: true,
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          getTransactionIcon(clubTransaction.transactionDirection),
          SizedBox(
            width: 10.0,
          ),
          Text(
            clubTransaction.amount.toString(),
          ),
        ],
      ),
    );
  }

  String _getCategory(ClubTransaction clubTransaction) => clubTransaction
      .paymentCategory
      .toString()
      .substring(clubTransaction.paymentCategory.toString().indexOf('.') + 1);

  String _getDate(ClubTransaction clubTransaction)=>'${clubTransaction.dateTime.day}/${clubTransaction.dateTime.month}/${clubTransaction.dateTime.year}';
}
