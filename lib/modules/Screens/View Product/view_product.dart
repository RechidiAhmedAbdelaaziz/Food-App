import 'package:flutter/material.dart';
import 'package:social_app/Shared/Components/Top%20Page%20components/top_pages_components.dart';
import 'package:social_app/Shared/Components/compenents.dart';
import 'package:social_app/Shared/Components/dimensions.dart';
import 'package:social_app/Shared/Styles/colors.dart';
import 'package:social_app/modules/Screens/View%20Product/view_detail.dart';

class ViweProductScreen extends StatefulWidget {
  const ViweProductScreen({super.key});

  @override
  State<ViweProductScreen> createState() => _ViweProductScreenState();
}

class _ViweProductScreenState extends State<ViweProductScreen> {
  var crrNeed = 0;
  bool isReading = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: Dimensions.screenHeight(),
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: Dimensions.screenHeight() * 0.45,
                alignment: AlignmentDirectional.topStart,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/Strawberry.jpeg'),
                )),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.shopping_cart,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  height: isReading
                      ? Dimensions.screenHeight() * 0.85
                      : Dimensions.screenHeight() * 0.585,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadiusDirectional.only(
                      topEnd: Radius.circular(30),
                      topStart: Radius.circular(30),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: getWidth(20),
                      horizontal: getHeight(20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Strawberry',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 23, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: getHeight(15),
                        ),
                        buildRating(context, 3),
                        SizedBox(
                          height: getHeight(18),
                        ),
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
                        SizedBox(
                          height: getHeight(22),
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Text(
                              recipe,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(height: 1.8, wordSpacing: 2),
                            ),
                          ),
                        ),
                        TextButton.icon(
                          onPressed: () {
                            navigateTo(
                                context: context,
                                widget: const ProductDetails());
                          },
                          icon: const Text('Read more'),
                          label: const Icon(Icons.arrow_drop_down),
                        ),
                        SizedBox(
                          height: getHeight(30),
                        ),
                        buildBuyItem(context, crrNeed)
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Row buildBuyItem(BuildContext context, int crrNeed) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Row(
        children: [
          IconButton(
            onPressed: () {
              if (crrNeed > 0) crrNeed -= 1;
            },
            icon: const Icon(
              Icons.remove,
              size: 18,
            ),
          ),
          Text(
            '$crrNeed',
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          IconButton(
            onPressed: () {
              crrNeed += 1;
            },
            icon: const Icon(
              Icons.add,
              size: 18,
            ),
          ),
        ],
      ),
      if (crrNeed > 0)
        ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(defaultColor),
            ),
            onPressed: () {},
            child: Text(
              '\$${crrNeed * 12}  Add to cart'.toUpperCase(),
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.w500, color: Colors.white),
            ))
    ],
  );
}
