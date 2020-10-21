import 'package:covid19_tracker/constants.dart';
import 'package:flutter/material.dart';

class FAQPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FAQs'),
      ),
      body: ListView.builder(
        itemCount: DataSource.questionAnswers.length,
        itemBuilder: (context, index) {
          return ExpansionTile(
            title: Text(
              DataSource.questionAnswers[index]['question'],
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            children: [
              Padding(
                padding: EdgeInsets.all(8),
                child: Text(DataSource.questionAnswers[index]['answer']),
              ),
            ],
          );
        },
      ),
    );
  }
}
