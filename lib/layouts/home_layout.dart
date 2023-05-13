// ignore_for_file: must_be_immutable, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/Shared/Components/Top%20Page%20components/top_pages_components.dart';
import 'package:social_app/Shared/Components/compenents.dart';
import 'package:social_app/Shared/Components/dimensions.dart';
import 'package:social_app/layouts/Cubit/app_cubit.dart';
import 'package:social_app/layouts/Cubit/app_states.dart';
import 'package:social_app/modules/Screens/View%20Product/view_product.dart';

class HomeScreen extends StatelessWidget {
  var pagesController = PageController(
    viewportFraction: 0.8,
  );

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FoodCubit, FoodStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = FoodCubit.get(context);
        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.grey[100],
            body: Column(
              children: [
                appBar(),
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        Banners(cubit),
                        SizedBox(
                          height: getHeight(25),
                        ),
                        Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: getWidth(25)),
                          alignment: Alignment.topCenter,
                          height: getHeight(40),
                          child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return buildTiltleItem(cubit, index);
                              },
                              separatorBuilder: (context, index) => SizedBox(
                                    width: getWidth(12),
                                  ),
                              itemCount: 4),
                        ),
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 5,
                          itemBuilder: (context, index) =>
                              buildListItem(context),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Column buildTiltleItem(FoodCubit cubit, int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            cubit.changeTitle(index);
          },
          child: AnimatedContainer(
            duration: const Duration(seconds: 1),
            curve: Curves.ease,
            child: AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 250),
              style: TextStyle(
                  fontSize: cubit.currTitle == index ? 17 : 13,
                  fontWeight: cubit.currTitle == index
                      ? FontWeight.bold
                      : FontWeight.normal,
                  color: cubit.currTitle == index ? Colors.black : Colors.grey),
              child: Text(
                'Popular'.toUpperCase(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ),
        SizedBox(
          height: getHeight(2),
        ),
        if (cubit.currTitle == index)
          Container(
            color: Colors.grey,
            width: getWidth(35),
            height: 2,
          )
      ],
    );
  }

  Padding buildListItem(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
        bottom: getHeight(8),
        start: getWidth(18),
      ),
      child: Row(
        children: [
          Container(
            height: squarSize(130),
            width: squarSize(130),
            decoration: BoxDecoration(
                image: const DecorationImage(
                    image: AssetImage(
                      'assets/Strawberry.jpeg',
                    ),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(20)),
          ),
          Expanded(
            child: Container(
              height: squarSize(97),
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: getHeight(2),
                  horizontal: getWidth(5),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Strawberry',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style:
                          TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
                    ),
                    const Spacer(),
                    Text(
                      'Description',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
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
                            icon: Icons.timelapse,
                            color: Colors.red,
                            text: '30min'),
                      ],
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding appBar() {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: getHeight(7),
        horizontal: getWidth(18),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Algeria',
                style: TextStyle(fontSize: 25, color: Colors.teal),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text('El Bayadh'),
                  IconButton(
                      onPressed: () {},
                      padding: EdgeInsets.zero,
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        size: 20,
                      ))
                ],
              ),
            ],
          ),
          Container(
            height: 40,
            width: 40,
            margin: const EdgeInsetsDirectional.only(end: 2),
            decoration: BoxDecoration(
                color: Colors.teal, borderRadius: BorderRadius.circular(8)),
            alignment: Alignment.center,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                size: 25,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  SizedBox Banners(FoodCubit cubit) {
    return SizedBox(
      height: getHeight(320),
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              physics: const BouncingScrollPhysics(),
              controller: pagesController,
              onPageChanged: (value) {
                cubit.changeTopPage(value);
              },
              itemCount: 5,
              itemBuilder: (context, index) {
                double scal = cubit.currTopPage == index ? 1 : 0.85;
                return TweenAnimationBuilder(
                    builder: (context, value, child) {
                      return Transform.scale(
                        scale: value,
                        child: child,
                      );
                    },
                    duration: const Duration(milliseconds: 350),
                    tween: Tween(begin: scal, end: scal),
                    child: AnimatedOpacity(
                        opacity: scal == 1 ? 1 : 0.7,
                        duration: const Duration(microseconds: 350),
                        child: InkWell(
                            onTap: () {
                              navigateTo(
                                  context: context,
                                  widget: const ViweProductScreen());
                            },
                            child: buildTopItems(context, index))));
              },
            ),
          ),
          indicator(5, cubit.currTopPage),
        ],
      ),
    );
  }
}
