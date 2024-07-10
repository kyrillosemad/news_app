import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/view%20model/cubit/news_cubit.dart';
import 'package:news_app/view/shared_widgets/HomePageLoadedState.dart';
import 'package:news_app/view/shared_widgets/app_bar.dart';
import 'package:news_app/view/shared_widgets/bottom_bar.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<NewsCubit>().generalFun();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const TopAppBar(),
        bottomNavigationBar: const BottomBar(),
        body: SingleChildScrollView(
          child: SizedBox(
              width: 100.w,
              height: 100.h,
              child: BlocBuilder<NewsCubit, NewsState>(
                builder: (context, state) {
                  if (state is Loading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is LoadedGeneral) {
                    return HomePageLoadedState(state: state);
                  } else if (state is Error) {
                    return Center(
                      child: Text(state.msg),
                    );
                  } else {
                    return const Center(
                      child: Text("unknown state"),
                    );
                  }
                },
              )),
        ));
  }
}
