import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/view%20model/cubit/news_cubit.dart';
import 'package:news_app/view/shared_widgets/loaded_state.dart';
import 'package:news_app/view/shared_widgets/page_title.dart';
import 'package:sizer/sizer.dart';

class TechNews extends StatefulWidget {
  const TechNews({super.key});

  @override
  State<TechNews> createState() => _TechNewsState();
}

class _TechNewsState extends State<TechNews> {
  @override
  void initState() {
    super.initState();
    context.read<NewsCubit>().techFun();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(children: [
          const PageTitle(title: "Tech News"),
          SizedBox(
            height: 2.h,
          ),
          Expanded(child: BlocBuilder<NewsCubit, NewsState>(
            builder: (context, state) {
              if (state is Loading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is LoadedTech) {
                return LoadedSTate(state: state.tech);
              } else if (state is Error) {
                return Center(
                  child: Text(state.msg),
                );
              } else {
                return const Center(
                  child: Text("Unknown State"),
                );
              }
            },
          ))
        ]),
      ),
    );
  }
}
