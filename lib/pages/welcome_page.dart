import 'package:adventure_app/cubit/app_cubit.dart';
import 'package:adventure_app/widgets/app_large_text.dart';
import 'package:adventure_app/widgets/app_text.dart';
import 'package:adventure_app/widgets/responsive_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = [
    'assets/images/welcome-one.png',
    'assets/images/welcome-two.png',
    'assets/images/welcome-three.png'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: images.length,
        itemBuilder: (comtext, index) {
          return Container(
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(images[index]),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              margin: const EdgeInsets.only(
                top: 150,
                left: 20,
                right: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AppLargeText(
                        text: 'Trips',
                      ),
                      const AppText(
                        text: 'Mountain',
                        size: 30,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const SizedBox(
                        width: 250,
                        child: AppText(
                          text:
                              'Mountain hikes give you an incredible sense of freedom along with endurance test',
                          color: Colors.black45,
                          size: 14,
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      GestureDetector(
                        onTap: () {
                          BlocProvider.of<AppCubit>(context).getData();
                        },
                        child: const SizedBox(
                          width: 120,
                          child: Row(
                            children: [
                              ResponsiveButton(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: List.generate(
                      3,
                      (indexDots) {
                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: 3),
                          width: 8,
                          height: index == indexDots ? 25 : 8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: index == indexDots
                                ? const Color(0xff5D69B3)
                                : const Color(0xff5D69B3).withOpacity(0.3),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
