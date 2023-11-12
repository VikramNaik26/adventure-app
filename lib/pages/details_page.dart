import 'package:adventure_app/widgets/app_button.dart';
import 'package:adventure_app/widgets/app_large_text.dart';
import 'package:adventure_app/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailsPages extends StatefulWidget {
  const DetailsPages({super.key});

  @override
  State<DetailsPages> createState() => _DetailsPagesState();
}

class _DetailsPagesState extends State<DetailsPages> {
  final int gottenStar = 4;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.maxFinite,
          height: double.maxFinite,
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
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
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
                            return AppButton(
                              index: index,
                              color: const Color(0xff5D69B3),
                              backgroundColor:
                                  const Color(0xff5D69B3).withOpacity(.2),
                            );
                          },
                        ),
                      )
                    ],
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
