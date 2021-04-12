import 'package:dbms_project/constants.dart';
import 'package:dbms_project/enums.dart';

class ClubTransaction {
  String payer, payee, description;
  double amount;
  PaymentMethod paymentMethod;
  DateTime dateTime;
  ClubTransactionDirection transactionDirection;
  // TODO screenshot upload

  ClubTransaction({
    this.payer,
    this.payee,
    this.description,
    this.amount,
    this.paymentMethod,
    this.dateTime,
    this.transactionDirection,
  });

  factory ClubTransaction.fromMap(Map<String, dynamic> json) => ClubTransaction(
        payer: json[clubTransactionsPayerColumn],
        payee: json[clubTransactionsPayeeColumn],
        description: json[clubTransactionsDescriptionColumn],
        amount: json[clubTransactionsAmountColumn].toDouble(),
        paymentMethod: json[clubTransactionsPaymentMethodColumn],
        dateTime: DateTime.parse(json[clubTransactionsDateTimeColumn]),
        transactionDirection: json[clubTransactionsTransactionDirectionColumn],
      );

  Map<String, dynamic> toMap() => {
        clubTransactionsPayerColumn: payer,
        clubTransactionsPayeeColumn: payee,
        clubTransactionsDescriptionColumn: description,
        clubTransactionsAmountColumn: amount,
        clubTransactionsPaymentMethodColumn: paymentMethod.toString(),
        clubTransactionsDateTimeColumn: dateTime.toIso8601String(),
        clubTransactionsTransactionDirectionColumn:
            transactionDirection.toString(),
      };
}
