import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HelpCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity,
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(
                // left side padding is 40 percent of total width
                left: MediaQuery.of(context).size.width * .4,
                top: 30,
                right: 20),
            height: 150,
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xFF60BE93), Color(0xFF1B8D59)]),
                borderRadius: BorderRadius.circular(20)),
            child: RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: 'Dial 1075 For Medical Help !\n',
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(color: Colors.white)),
              TextSpan(
                  text: 'If any Symptoms appear',
                  style: TextStyle(color: Colors.white.withOpacity(0.7)))
            ])),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: SvgPicture.asset('assets/icons/nurse.svg'),
          ),
          Positioned(
            child: SvgPicture.asset('assets/icons/virus.svg'),
            top: 5,
            right: 5,
          )
        ],
      ),
    );
  }
}
