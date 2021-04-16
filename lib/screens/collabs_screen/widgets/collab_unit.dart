import 'package:dbms_project/models/club_collab.dart';
import 'package:flutter/material.dart';

ExpansionPanel getPanelFromCollab(ClubCollab collab, BuildContext context) {
  return ExpansionPanel(
    isExpanded: collab.isExpanded,
    canTapOnHeader: true,
    headerBuilder: (context, isExpanded) => ListTile(
      contentPadding: EdgeInsets.all(15.0),
      leading: Image.network(
        collab.imageUrl,
      ),
      title: Text(
        collab.eventName,
        style: TextStyle(
          fontSize: 25.0,
        ),
      ),
    ),
    body: Container(
      margin: EdgeInsets.only(
        bottom: 20.0,
        left: 20.0,
        right: 20.0,
      ),
      padding: EdgeInsets.all(30.0),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'Money allocated: ₹${collab.resourcesAllocated} \nTo be held in ${collab.eventMonth}',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          Text(
            '\nContact ${collab.pocOne} from ${collab.clubOne}\nor ${collab.pocTwo} from ${collab.clubTwo}',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
        ],
      ),
    ),
  );
}
