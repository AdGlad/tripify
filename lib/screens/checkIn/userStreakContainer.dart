import 'package:flutter/material.dart';
import 'package:gtk_flutter/model/users.dart';

Container UserStreakContainer(BuildContext context, UserProfile user   )
   {
    return Container(
                      width: MediaQuery.of(context).size.width - 20,
                      // height: 240,
                      child: Card(
                        color: Color.fromARGB(255, 49, 52, 59),
                        elevation: 8.0,
                        margin: EdgeInsets.all(5.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                                '${user.nickname} streak: ${user.currentstreak} [${user.placescount}]', // _currentStreak',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10.0,
                                  fontWeight: FontWeight.w700,
                                )),
                          ),
                        ),
                      ),
                    );
   }
