import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:covid19_tracker/constants.dart';

class InfoCard extends StatelessWidget {
  final String title;
  final String effectedNum;
  final String increase;
  final String percent;
  final Color iconColor;
  final Color expanded_icon_color;

  const InfoCard(
      {Key key,
      this.title,
      this.effectedNum,
      this.iconColor,
      this.increase,
      this.percent,
      this.expanded_icon_color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2.4,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8)),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(5),
            child: Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      color: iconColor.withOpacity(0.12),
                      shape: BoxShape.circle),
                  child: SvgPicture.asset(
                    'assets/icons/running.svg',
                    height: 12,
                    width: 12,
                    color: iconColor,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  title,
                  style: TextStyle(color: Colors.black),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(1),
                  child: RichText(
                      text: TextSpan(
                          style: TextStyle(
                            color: kTextColor,
                          ),
                          children: [
                        TextSpan(
                            text: '$effectedNum \n',
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                .copyWith(fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: 'People',
                            style: TextStyle(fontSize: 12, height: 2))
                      ])),
                ),
                Expanded(
                    child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add,
                          color: expanded_icon_color,
                        ),
                        Text(increase)
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.trending_up,
                          color: expanded_icon_color,
                        ),
                        Text(percent)
                      ],
                    )
                  ],
                ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
