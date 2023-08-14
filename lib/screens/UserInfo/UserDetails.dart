import 'package:flutter/material.dart';
import 'package:gtk_flutter/screens/UserInfo/UserInfoPage.dart';
import 'package:gtk_flutter/state/applicationstate.dart';
import 'package:provider/provider.dart';
class UserDetails extends StatefulWidget {
  const UserDetails({super.key});

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  @override
  Widget 
          build(BuildContext context) {
    return  
    Consumer<ApplicationState>(
        builder: (context, appState, _) =>
      Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: Center(child: 
        Container(child: Row(

                            children: [
                                                     Text(
                            'Statistics for ${appState.userProfile!.nickname}',
                            style: TextStyle(
                                fontSize: 12.0, fontWeight: FontWeight.bold),
                          ),
                              Expanded(
                                  child: buildCard(
                                    appState.userProfile!.countrycount,
                                     // userProfile?['countrycount'],
                                      '',
                                      Icons.map_outlined,
                                      'Countries')),
                             // SizedBox(width: 16.0),
                              Expanded(
                                  child: buildCard(
                                     appState.userProfile!.placescount,
                                    //  userProfile?['placescount'],
                                      '',
                                      Icons.place,
                                      'Check-ins')),
                            ],
                          ),),
    )));
  }
}