import 'package:flutter/material.dart';
import 'package:social_app/Shared/Components/dimensions.dart';
import 'package:social_app/modules/Screens/View%20Product/view_product.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: getHeight(80),
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.clear,
                color: Colors.white,
              ),
            ),
            actions: [
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
            expandedHeight: Dimensions.screenHeight() * 0.35,
            pinned: true,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(getHeight(35)),
              child: Container(
                width: double.maxFinite,
                alignment: Alignment.center,
                padding: const EdgeInsets.all(12),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    )),
                child: const Text(
                  'Strawberry',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            backgroundColor: Colors.teal,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'assets/Strawberry.jpeg',
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(getWidth(10)),
              child: Text(
                recipe,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(height: 1.8, wordSpacing: 2),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: buildBuyItem(context, 3),
      ),
    );
  }
}

var recipe =
    '''Easy to throw together and made up of simple, classic ingredients, bruschetta was made for chill warm weather snacking. While you can make it all year round, the best time to enjoy this appetizer is summer, when fresh tomatoes are at their peak. It’s also the perfect make-ahead snack: The longer the tomatoes sit in the balsamic-garlic-olive oil mixture, the better the flavors meld and develop. Read on for all of our top tips on acing this classically refreshing side:

The key to making the best bruschetta? It's all in the tomatoes.
Because tomatoes are the focus of this simple recipe, it’s worth it to use ripe, fresh ones. Juicier tomatoes work, but drier varieties like Roma are really what you’re looking for. The ultimate goal is to keep your toast like toast should be: dry. When you use too juicy tomatoes, you will no doubt get a powerful (and delicious) tomato result, but your toast might end up soggy.

The trick: Salt your tomatoes. After they have been diced, add them to a large strainer or colander over a bowl, and toss with some salt. Let sit for 5 minutes, and the liquid will gather at the bottom of your bowl. If you're preparing bruschetta with out-of-season tomatoes, this salting trick drastically improves their quality!

The best bread for bruschetta.
You really want a crisp, sturdy base that will hold up your tomato mixture without falling apart. Ciabatta is a popular option, but we went with a large, sliced baguette in this recipe. We toasted our slices until beautifully golden and just crisp enough to create the perfect base for our tomatoes before rubbing them with halved garlic cloves to really amp up the fresh, bright flavor.

If you’re worried about your tomato mixture sliding off the toasted bread, consider a schmear before you top them (think pureed white beans, cream cheese, or whipped ricotta).

What should I serve with bruschetta?
Bruschetta was made for lazy summer days, so it goes perfectly with other easy, fresh snacks like our melon-prosciutto skewers or classic Caprese salad. If you're serving this up as a crowd-pleasing party app, pair it with our toasted ravioli and baked feta bites to complete your spread. Or, serve this as a side to your Italian dinner (hint: our sheet-pan panzanella or creamy chicken marsala make for dream pairings).

Made this recipe? Let us know what you think in the comments! ''';
