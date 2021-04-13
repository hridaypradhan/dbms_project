import 'package:dbms_project/constants.dart';
import 'package:dbms_project/enums.dart';

class ClubTransaction {
  String payer, payee, description;
  double amount;
  PaymentMethod paymentMethod;
  DateTime dateTime;
  PaymentCategory paymentCategory;
  ClubTransactionDirection transactionDirection;

  ClubTransaction({
    this.payer,
    this.payee,
    this.description,
    this.amount,
    this.paymentMethod,
    this.dateTime,
    this.paymentCategory,
    this.transactionDirection,
  });

  factory ClubTransaction.fromMap(Map<String, dynamic> json) => ClubTransaction(
        payer: json[clubTransactionsPayerColumn],
        payee: json[clubTransactionsPayeeColumn],
        description: json[clubTransactionsDescriptionColumn],
        amount: json[clubTransactionsAmountColumn].toDouble(),
        paymentMethod: json[clubTransactionsPaymentMethodColumn],
        dateTime: DateTime.parse(json[clubTransactionsDateTimeColumn]),
        paymentCategory: json[clubTransactionsPaymentCategoryColumn],
        transactionDirection: json[clubTransactionsTransactionDirectionColumn],
      );

  Map<String, dynamic> toMap() => {
        clubTransactionsPayerColumn: payer,
        clubTransactionsPayeeColumn: payee,
        clubTransactionsDescriptionColumn: description,
        clubTransactionsAmountColumn: amount,
        clubTransactionsPaymentMethodColumn: paymentMethod.toString(),
        clubTransactionsDateTimeColumn: dateTime.toIso8601String(),
        clubTransactionsPaymentCategoryColumn: paymentCategory.toString(),
        clubTransactionsTransactionDirectionColumn:
            transactionDirection.toString(),
      };
}

class CategoryBalance {
    CategoryBalance({
        this.paymentCategory,
        this.amount,
    });

    PaymentCategory paymentCategory;
    double amount;

    factory CategoryBalance.fromMap(Map<String, dynamic> json) => CategoryBalance(
        paymentCategory: json["paymentCategory"],
        amount: json["amount"].toDouble(),
    );

    Map<String, dynamic> toMap() => {
        "paymentCategory": paymentCategory,
        "amount": amount,
    };
}
