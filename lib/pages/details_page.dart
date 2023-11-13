import 'package:adventure_app/widgets/app_button.dart';
import 'package:adventure_app/widgets/app_large_text.dart';
import 'package:adventure_app/widgets/app_text.dart';
import 'package:adventure_app/widgets/responsive_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailsPages extends StatefulWidget {
  const DetailsPages({super.key});

  @override
  State<DetailsPages> createState() => _DetailsPagesState();
}

class _DetailsPagesState extends State<DetailsPages> {
  final int gottenStar = 4;
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SizedBox(
            width: double.maxFinite,
            height: MediaQuery.of(context).size.height + 50,
            child: Stack(
              children: [
                Positioned(
                  child: Container(
                    width: double.maxFinite,
                    height: 330,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/mountain.jpeg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 20,
                  top: 20,
                  child: Row(
                    children: [
                      IconButton(
                        icon: SvgPicture.asset(
                          'assets/icons/menu.svg',
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 280,
                  child: Container(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 30),
                    width: MediaQuery.of(context).size.width,
                    height: 500,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppLargeText(
                              text: 'Yosemite',
                              color: Colors.black.withOpacity(.8),
                            ),
                            const AppLargeText(
                              text: '\$ 250',
                              color: Color(0xff5D69B3),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: Color(0xff5D69B3),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            AppText(
                              text: 'USA, California',
                              color: Color(0xff989ACD),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Wrap(
                              children: List.generate(
                                5,
                                (index) => Icon(
                                  Icons.star,
                                  color: index < gottenStar
                                      ? Colors.yellow[700]
                                      : Colors.grey.withOpacity(.4),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            const AppText(text: '(4.0)'),
                          ],
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        AppLargeText(
                          text: 'People',
                          color: Colors.black.withOpacity(.8),
                          size: 20,
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        const AppText(
                          text: 'Number of people in your group',
                          color: Colors.black54,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Wrap(
                          children: List.generate(
                            5,
                            (index) {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedIndex = index;
                                  });
                                },
                                child: AppButton(
                                  color: selectedIndex == index
                                      ? Colors.white
                                      : const Color(0xff5D69B3),
                                  backgroundColor: selectedIndex == index
                                      ? Colors.black
                                      : const Color(0xff5D69B3).withOpacity(.2),
                                  text: (index + 1).toString(),
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        AppLargeText(
                          text: 'Description',
                          color: Colors.black.withOpacity(.8),
                          size: 20,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const AppText(
                          text:
                              'They usually have steep, sloping sides and sharp or rounded ridges, and a high point, called a peak or summit. Most geologists classify a mountain as a landform that rises at least 1,000 feet (300 meters) or more above its surrounding area.',
                          color: Colors.black54,
                          size: 14,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Row(
                          children: [
                            AppButton(
                              size: 60,
                              backgroundColor: Colors.white,
                              color: const Color(0xff5D69B3),
                              borderColor: const Color(0xff5D69B3),
                              isIcon: true,
                              icon: Icons.favorite_border,
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            const ResponsiveButton(
                              isResponsive: true,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
