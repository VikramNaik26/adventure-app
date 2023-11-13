import 'package:adventure_app/cubit/app_cubit.dart';
import 'package:adventure_app/cubit/app_cubit_states.dart';
import 'package:adventure_app/pages/details_page.dart';
import 'package:adventure_app/pages/home_page.dart';
import 'package:adventure_app/pages/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubitLogic extends StatefulWidget {
  const AppCubitLogic({super.key});

  @override
  State<AppCubitLogic> createState() => _AppCubitLogicState();
}

class _AppCubitLogicState extends State<AppCubitLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubit, CubitStates>(
        builder: (context, state) {
          if (state is WelcomeState) {
            return const WelcomePage();
          }
          if (state is LoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is LoadedState) {
            return const HomePage();
          }
          if (state is DetailState) {
            return const DetailsPages();
          }

          return Container();
        },
      ),
    );
  }
}
