import 'package:clothing_shop/app.styles.dart';
import 'package:clothing_shop/size_config.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: const HomeScreen(),
        floatingActionButtonLocation:
         FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Container(
          padding: const EdgeInsets.symmetric(
            horizontal:8,
          ) ,
          height: 65,
          child: CustomNavigationBar(
            isFloating: false,
            borderRadius: const Radius.circular(40),
            unSelectedColor: kWhite,
            selectedColor: kGrey,
            backgroundColor: kBrown,
            strokeColor: Colors.transparent,
            scaleFactor: 0.1,
            iconSize: 30,
            items: [
              CustomNavigationBarItem(
                icon: _currentIndex == 0
                    ? Image.asset('assets/home-2.png')
                    : Image.asset('assets/home-2.png'),
              ),
              CustomNavigationBarItem(
                icon: _currentIndex == 1
                    ? Image.asset('assets/cart.png')
                    : Image.asset('assets/shopping-cart.png'),
              ),
              CustomNavigationBarItem(
                icon: _currentIndex == 2
                    ? Image.asset('assets/heart-1.png')
                    : Image.asset('assets/heart-1.png'),
              ),
              CustomNavigationBarItem(
                icon: _currentIndex == 3
                    ? Image.asset('assets/profile.png')
                    : Image.asset('assets/profile.png'),
              ),
            ],
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() { _currentIndex = index;});

            },
          ),
        ),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> categories = [
    "All Items",
    "Dress",
    "Hat",
    "Watch",
  ];
  List<String> icons = ['category', 'dress', 'hat', 'watch'];
  List<String> images = [
    'image-01',
    'image-02',
    'image-03',
    'image-04',
    'image-05',
    'image-06',
  ];
  int current = 0;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
        child: ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kPaddinHorizontal),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Hello, Welcome 👋",
                    style: kEncodeSansRagular.copyWith(
                      color: kDarkBrowm,
                      fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                    ),
                  ),
                  Text(
                    "Albert Stevano",
                    style: kEncodeSansBold.copyWith(
                      color: kDarkBrowm,
                      fontSize: SizeConfig.blockSizeHorizontal! * 4,
                    ),
                  ),
                ],
              ),
              const CircleAvatar(
                radius: 20,
                backgroundColor: kGrey,
                backgroundImage: NetworkImage(
                    'https://cdn.pixabay.com/photo/2016/03/31/18/26/coding-1294361__340.png'),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        // Search
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kPaddinHorizontal),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  style: kEncodeSansRagular.copyWith(
                    color: kDarkGrey,
                    fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                  ),
                  controller: TextEditingController(),
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 13),
                      prefixIcon: const IconTheme(
                          data: IconThemeData(
                            color: kDarkGrey,
                          ),
                          child: Icon(Icons.search)),
                      hintText: 'Search clothers ...',
                      border: kInputBorder,
                      errorBorder: kInputBorder,
                      disabledBorder: kInputBorder,
                      focusedBorder: kInputBorder,
                      focusedErrorBorder: kInputBorder,
                      enabledBorder: kInputBorder,
                      hintStyle: kEncodeSansRagular.copyWith(
                        color: kDarkGrey,
                        fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                      )),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Container(
                height: 50,
                width: 50,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(kBorderRadius),
                  color: kBlack,
                ),
                child: Image.asset('assets/Filter.png'),
              )
            ],
          ),
        ),

        const SizedBox(
          height: 24,
        ),

        SizedBox(
          width: double.infinity,
          height: 36,
          child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: categories.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      current = index;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                      left: index == 0 ? kPaddinHorizontal : 15,
                      right: index == categories.length - 1
                          ? kPaddinHorizontal
                          : 0,
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    height: 36,
                    decoration: BoxDecoration(
                      color: current == index ? kBrown : kWhite,
                      borderRadius: BorderRadius.circular(8),
                      border: current == index
                          ? null
                          : Border.all(
                              color: kLightGrey,
                              width: 1,
                            ),
                    ),
                    child: Row(
                      children: [
                        Image.asset(current == index
                            ? 'assets/${icons[index]}.png'
                            : 'assets/${icons[index]}.png'),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          categories[index],
                          style: kEncodeSansMedium.copyWith(
                            color: current == index ? kWhite : kDarkBrowm,
                            fontSize: SizeConfig.blockSizeHorizontal! * 3,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
        ),
        const SizedBox(
          height: 32,
        ),
        MasonryGridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          itemCount: images.length,
          padding: const EdgeInsets.symmetric(
            horizontal: kPaddinHorizontal,
          ),
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Positioned(
                        child: ClipRRect(
                      borderRadius: BorderRadius.circular(kBorderRadius),
                      child: Image.asset(
                        'assets/images/${images[index]}.png',
                        fit: BoxFit.cover,
                      ),
                    )),
                    Positioned(
                        right: 12,
                        top: 12,
                        child: GestureDetector(
                          // opTap: () {},
                          // child: Image.asset('assets/heart.png'),
                          child: const Icon(Icons.favorite_rounded , color: Colors.pink, ),
                        ))
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Text('Modern light clothers',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: kEncodeSansBold.copyWith(
                      color: kDarkBrowm,
                      fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                    )),
                Text('Dress modern',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: kEncodeSansRagular.copyWith(
                      color: kGrey,
                      fontSize: SizeConfig.blockSizeHorizontal! * 3,
                    )),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //dàn đều giữa về 2 phía
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('\$212.99',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: kEncodeSansBold.copyWith(
                          color: kDarkBrowm,
                          fontSize: SizeConfig.blockSizeHorizontal! * 3,
                        )),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: kYellow,
                          size: 16,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text('5.0',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: kEncodeSansMedium.copyWith(
                              color: kDarkBrowm,
                              fontSize: SizeConfig.blockSizeHorizontal! * 3,
                            )),
                      ],
                    )
                  ],
                ),
              ],
            );
          },
        )
      ],
    ));
  }
}
