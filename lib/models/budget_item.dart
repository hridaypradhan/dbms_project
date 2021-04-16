class BudgetItem {
    BudgetItem({
        this.eventName,
        this.amount,
        this.dateTime,
        this.description,
    });
 
    String eventName;
    double amount;
    DateTime dateTime;
    String description;

    factory BudgetItem.fromMap(Map<String, dynamic> json) => BudgetItem(
        eventName: json["eventName"],
        amount: json["amount"].toDouble(),
        dateTime: DateTime.parse(json["dateTime"]),
        description: json["description"],
    );

    Map<String, dynamic> toMap() => {
        "eventName": eventName,
        "amount": amount,
        "dateTime": dateTime.toIso8601String(),
        "description": description,
    };
}
