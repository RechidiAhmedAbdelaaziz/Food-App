import 'package:flutter/material.dart';
import 'package:social_app/Shared/Components/dimensions.dart';
import 'package:social_app/Shared/Styles/colors.dart';

Widget buildTopItems(BuildContext context, int index) {
  return Stack(
    children: [
      Container(
        // margin: const EdgeInsets.symmetric(horizontal: 5),
        width: double.infinity,
        height: getHeight(220),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          image: const DecorationImage(
              image: AssetImage(
                'assets/Strawberry.jpeg',
              ),
              fit: BoxFit.cover),
        ),
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          margin: EdgeInsetsDirectional.only(
            start: getHeight(14),
            end: getHeight(14),
            bottom: getHeight(22),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: getWidth(16),
            vertical: getHeight(8),
          ),
          width: double.infinity,
          height: getHeight(122),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25), color: Colors.white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Strawberry',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
              const Spacer(),
              buildRating(context, 3),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildTextWithIcon(context,
                      icon: Icons.circle_sharp,
                      text: 'Normal',
                      color: Colors.orangeAccent),
                  buildTextWithIcon(context,
                      icon: Icons.location_on, text: '2.6km'),
                  buildTextWithIcon(context,
                      icon: Icons.timelapse, color: Colors.red, text: '30min'),
                ],
              ),
              const SizedBox(
                height: 3,
              ),
            ],
          ),
        ),
      )
    ],
  );
}

Row buildRating(BuildContext context, int rate) {
  return Row(
    children: [
      Wrap(
        children: List.generate(
              rate,
              (index) => const Icon(
                Icons.star,
                color: Colors.teal,
                size: 18,
              ),
            ) +
            List.generate(
              5 - rate,
              (index) => const Icon(
                Icons.star_border,
                color: Colors.teal,
                size: 18,
              ),
            ),
      ),
      SizedBox(
        width: getWidth(10),
      ),
      Text(
        '$rate',
        style: Theme.of(context)
            .textTheme
            .bodySmall
            ?.copyWith(fontSize: 16, fontWeight: FontWeight.w500),
      ),
      const Spacer(),
      Text(
        '124 comments',
        style: Theme.of(context)
            .textTheme
            .bodySmall
            ?.copyWith(fontSize: 16, fontWeight: FontWeight.w300),
      ),
    ],
  );
}

Widget indicator(int count, int crrPage) {
  Widget indicatorItem(bool isActive) {
    return AnimatedOpacity(
      opacity: isActive ? 1 : 0.2,
      duration: const Duration(milliseconds: 800),
      child: AnimatedContainer(
        margin: EdgeInsets.symmetric(
            vertical: getHeight(4), horizontal: getWidth(1)),
        duration: const Duration(milliseconds: 350),
        width: isActive ? 22 : 8,
        height: 8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: isActive ? defaultColor : Colors.grey[700],
        ),
      ),
    );
  }

  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      ...List.generate(
        count,
        (index) => indicatorItem(
          crrPage == index,
        ),
      )
    ],
  );
}

Widget buildTextWithIcon(
  context, {
  required IconData icon,
  required String text,
  Color color = Colors.teal,
}) {
  return Row(
    children: [
      Icon(
        icon,
        color: color,
        size: 23,
      ),
      Text(
        ' $text',
        style: Theme.of(context)
            .textTheme
            .bodySmall
            ?.copyWith(fontSize: 14, fontWeight: FontWeight.w400),
      ),
    ],
  );
}
