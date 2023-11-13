import 'package:adventure_app/cubit/app_cubit.dart';
import 'package:adventure_app/cubit/app_cubit_states.dart';
import 'package:adventure_app/widgets/app_button.dart';
import 'package:adventure_app/widgets/app_large_text.dart';
import 'package:adventure_app/widgets/app_text.dart';
import 'package:adventure_app/widgets/responsive_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    return BlocBuilder<AppCubit, CubitStates>(
      builder: (context, state) {
        DetailState detail = state as DetailState;
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
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                                'http://mark.bslmeiyu.com/uploads/${detail.place.img}'),
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
                            onPressed: () {
                              BlocProvider.of<AppCubit>(context).goHome();
                            },
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
                                  text: detail.place.name,
                                  color: Colors.black.withOpacity(.8),
                                ),
                                AppLargeText(
                                  text: '\$ ${detail.place.price}',
                                  color: const Color(0xff5D69B3),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.location_on,
                                  color: Color(0xff5D69B3),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                AppText(
                                  text: detail.place.location,
                                  color: const Color(0xff989ACD),
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
                                      color: index < detail.place.stars
                                          ? Colors.yellow[700]
                                          : Colors.grey.withOpacity(.4),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                AppText(text: '(${detail.place.stars})'),
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
                                          : const Color(0xff5D69B3)
                                              .withOpacity(.2),
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
                            AppText(
                              text: detail.place.description,
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
      },
    );
  }
}
