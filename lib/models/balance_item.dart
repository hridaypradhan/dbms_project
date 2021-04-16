class BalanceItem {
  BalanceItem({
    this.gpay,
    this.paytm, 
    this.cash,
    this.income,
    this.expense,
    this.totalBalance,
  });

  double gpay, paytm, cash, income, expense, totalBalance;

  factory BalanceItem.fromJson(Map<String, dynamic> json) => BalanceItem(
        gpay: json["gpay"].toDouble(),
        paytm: json["paytm"].toDouble(),
        cash: json["cash"].toDouble(),
        income: json["income"].toDouble(),
        expense: json["expense"].toDouble(),
        totalBalance: json["totalBalance"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "gpay": gpay,
        "paytm": paytm,
        "cash": cash,
        "income": income,
        "expense": expense,
        "totalBalance": totalBalance,
      };
}
