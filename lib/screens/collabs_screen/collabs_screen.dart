import 'package:dbms_project/screens/collabs_screen/widgets/collab_unit.dart';
import 'package:flutter/material.dart';
import 'package:dbms_project/global/dummy_data.dart';

class CollabsScreen extends StatefulWidget {
  @override
  _CollabsScreenState createState() => _CollabsScreenState();
}

class _CollabsScreenState extends State<CollabsScreen> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(screenSize.width * 0.2),
              child: Text(
                'Upcoming Club Collabs',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 40.0,
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: ExpansionPanelList(
                  expansionCallback: (index, isExpanded) {
                    setState(
                      () {
                        dummyCollabList[index].toggleExpansion();
                      },
                    );
                  },
                  children: dummyCollabList
                      .map(
                        (collab) => getPanelFromCollab(collab, context),
                      )
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 'https://ecellsnu.com/assets/img/1234.png',
          