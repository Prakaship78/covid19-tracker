import 'package:covid19_tracker/widgets/faq.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Contact Us',
          style: TextStyle(color: Colors.orange),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.orange,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            }),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Center(
              child: Image.asset(
                'assets/icons/contactus2.png',
                height: 250,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Have an issue or querry? \n Feel free to contact us',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, color: Colors.grey[800]),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    launch(
                        'https://www.narayanseva.org/covid-19-relief-fund?gclid=Cj0KCQjws536BRDTARIsANeUZ59afZwhMNIU1R-zYWQXUUkDbKetjHxI9w-1-dlZ6tMzqfpc4yEQJRQaAq6GEALw_wcB');
                  },
                  child: HelpCardSection(
                      title: 'Donate', cardIcon: Icons.account_balance_wallet),
                ),
                GestureDetector(
                  onTap: () {
                    launch(
                        'https://www.who.int/emergencies/diseases/novel-coronavirus-2019/advice-for-public/myth-busters');
                  },
                  child: HelpCardSection(
                    title: 'Myth Busters',
                    cardIcon: Icons.announcement,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => FAQPage()));
                  },
                  child: HelpCardSection(
                    title: 'FAQ',
                    cardIcon: Icons.assignment,
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: HelpCardSection(
                    title: 'prakaship78@gmail.com',
                    cardIcon: Icons.alternate_email,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class HelpCardSection extends StatelessWidget {
  final String title;
  final IconData cardIcon;

  const HelpCardSection({Key key, this.title, this.cardIcon}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Container(
        height: 150,
        width: 150,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 20,
              offset: Offset(0, 10))
        ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              cardIcon,
              color: Colors.orange,
              size: 50,
            ),
            Text(title)
          ],
        ),
      ),
    );
  }
}
