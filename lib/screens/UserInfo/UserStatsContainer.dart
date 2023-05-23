 
import 'package:flutter/material.dart';
import 'package:gtk_flutter/screens/UserInfo/UserInfoPage.dart';
import 'package:intl/intl.dart';

import '../../function/UserRecord.dart';
import '../../model/users.dart';
import '../../state/applicationstate.dart';


class UserStatsContainer extends StatefulWidget {
    final BuildContext context;
    final String userId;

  const UserStatsContainer({required this.context, required this.userId });

  @override
  State<UserStatsContainer> createState() => _UserStatsContainerState();
}

class _UserStatsContainerState extends State<UserStatsContainer> {
  late UserProfile userrecord;
  void asyncMethod(UserProfile userrecord) async {
     userrecord = await userRecord(widget.userId);
  }
   @override
  void initState() {
//    UserProfile userrecord =  userRecord(widget.userId) ;
   // Future<UserProfile> userrecord =  userRecord(widget.userId) ;
   // UserProfile userrecord =  userRecord(widget.userId) as UserProfile ;

    super.initState();
asyncMethod(userrecord);    
    //userRecord(widget.userId).then((value) => {
    //  userrecord = value
    //}
    //);
  }

  Widget build(BuildContext context) {
   // Future<UserProfile> userrecord =  userRecord(widget.userId) ;
   // UserProfile userrecord =  userRecord(widget.userId) as UserProfile ;

    return  Container(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Text(
                          'Statistics',
                          style: TextStyle(
                              fontSize: 24.0, fontWeight: FontWeight.bold),
                        ),
                        Text(
                        //  'Join Date: ${DateFormat('dd MMMM yyyy').format(appState.userProfile!.joinDate!)}',
                          'Join Date: ${DateFormat('dd MMMM yyyy').format(userrecord.joinDate!)}',
                          style: TextStyle(
                              fontSize: 12.0, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 16.0),
                        Row(
                          children: [
                            Expanded(
                                child: buildCard(
                                   // appState.userProfile?.currentstreak,
                                    userrecord.currentstreak,
                                    'Days',
                                    Icons.local_fire_department,
                                    'Current Streak')),
                            SizedBox(width: 16.0),
                            Expanded(
                                child: buildCard(
                                  //  appState.userProfile?.distancetotal,
                                    userrecord.distancetotal,
                                    'Kms',
                                    Icons.run_circle,
                                    'Distance Travelled')),
                          ],
                        ),
                        SizedBox(height: 16.0),
                        Row(
                          children: [
                            Expanded(
                                child: buildCard(
                                   // appState.userProfile?.countrycount,
                                    userrecord.countrycount,
                                    '',
                                    Icons.map_outlined,
                                    'Countries Visted')),
                            SizedBox(width: 16.0),
                            Expanded(
                                child: buildCard(
                                   // appState.userProfile?.placescount,
                                    userrecord.placescount,
                                    '',
                                    Icons.place,
                                    'Check-ins')),
                          ],
                        ),
                      ],
                    ),
                  );
    }
}