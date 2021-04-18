import 'package:dbms_project/database_helpers/collab_helper.dart';
import 'package:dbms_project/screens/collabs_screen/widgets/collab_unit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
              padding: EdgeInsets.all(screenSize.width * 0.15),
              child: Text(
                'Upcoming Club Collabs',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 40.0,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                bottom: screenSize.width * 0.1,
              ),
              child: Text(
                'Required Amount \n₹5000',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30.0,
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Provider.of<CollabHelper>(context).clubCollabs.isNotEmpty
                    ? ExpansionPanelList(
                        expansionCallback: (index, isExpanded) {
                          setState(
                            () {
                              Provider.of<CollabHelper>(
                                context,
                                listen: false,
                              ).clubCollabs[index].toggleExpansion();
                            },
                          );
                        },
                        children: Provider.of<CollabHelper>(context)
                            .clubCollabs
                            .map(
                              (collab) => getPanelFromCollab(collab, context),
                            )
                            .toList(),
                      )
                    : Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'No collabs yet. \nPress the \'Add\' button to enter a new one!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
