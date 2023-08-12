import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DailyStreakTracker extends StatefulWidget {
  @override
  _DailyStreakTrackerState createState() => _DailyStreakTrackerState();
}

class _DailyStreakTrackerState extends State<DailyStreakTracker> {
  int _currentStreak = 0;

  @override
  void initState() {
    super.initState();
    _loadStreakFromFirestore();
  }

  Future<void> _loadStreakFromFirestore() async {
    final docSnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    if (docSnapshot.exists) {
      setState(() {
        _currentStreak = docSnapshot.data()!['currentstreak'];
      });
    }
  }

  Future<void> _incrementStreak() async {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final docRef = FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid);
    final docSnapshot = await docRef.get();

    if (docSnapshot.exists) {
      final lastRecordedDate = docSnapshot.data()!['lastRecordedDate'].toDate();
      if (lastRecordedDate.isBefore(today)) {
        final newStreak = _currentStreak + 1;
        await docRef.update({
          'lastRecordedDate': today,
          'currentstreak': newStreak,
        });
        setState(() {
          _currentStreak = newStreak;
        });
      }
    } else {
      await docRef.set({
        'lastRecordedDate': today,
        'currentstreak': 1,
      });
      setState(() {
        _currentStreak = 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daily Streak Tracker'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Current streak:',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              '$_currentStreak',
              style: TextStyle(fontSize: 48),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: _incrementStreak,
              child: Text('Record Today'),
            ),
          ],
        ),
      ),
    );
  }
}
