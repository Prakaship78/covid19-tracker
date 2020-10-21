import 'package:covid19_tracker/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PreventionCard extends StatelessWidget {
  final String title;
  final String svgSrc;

  const PreventionCard({Key key, this.title, this.svgSrc}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            SvgPicture.asset(svgSrc),
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  .copyWith(color: kPrimaryColor),
            )
          ],
        )
      ],
    );
  }
}

class BuildPreventions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        PreventionCard(
          svgSrc: 'assets/icons/hand_wash.svg',
          title: 'Use Mask',
        ),
        PreventionCard(
          svgSrc: 'assets/icons/use_mask.svg',
          title: 'Use Mask',
        ),
        PreventionCard(
          svgSrc: 'assets/icons/Clean_Disinfect.svg',
          title: 'Clean Disinfect',
        )
      ],
    );
  }
}
