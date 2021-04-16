class ClubCollab {
  ClubCollab({
    this.clubOne,
    this.clubTwo,
    this.eventName,
    this.eventMonth,
    this.pocOne,
    this.pocTwo,
    this.imageUrl,
    this.resourcesAllocated,
    this.isExpanded = false,
  });

  String clubOne;
  String clubTwo;
  String eventName;
  String eventMonth;
  String pocOne;
  String pocTwo;
  String imageUrl;
  double resourcesAllocated;
  bool isExpanded;

  void toggleExpansion() {
    isExpanded = !isExpanded;
  }

  factory ClubCollab.fromMap(Map<String, dynamic> json) => ClubCollab(
        clubOne: json["clubOne"],
        clubTwo: json["clubTwo"],
        eventName: json["eventName"],
        eventMonth: json["eventMonth"],
        pocOne: json["pocOne"],
        pocTwo: json["pocTwo"],
        imageUrl: json["imageUrl"],
        resourcesAllocated: json["resourcesAllocated"].toDouble(),
        isExpanded: json["isExpanded"] == 1,
      );

  Map<String, dynamic> toMap() => {
        "clubOne": clubOne,
        "clubTwo": clubTwo,
        "eventName": eventName,
        "eventMonth": eventMonth,
        "pocOne": pocOne,
        "pocTwo": pocTwo,
        "imageUrl": imageUrl,
        "resourcesAllocated": resourcesAllocated,
        "isExpanded": isExpanded == true ? 1 : 0,
      };
}
