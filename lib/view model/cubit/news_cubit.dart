  import 'package:bloc/bloc.dart';
  import 'package:flutter/material.dart';
  import 'package:meta/meta.dart';
  import 'package:news_app/data/services/general_data.dart';
  import 'package:news_app/data/services/health_data.dart';
  import 'package:news_app/data/services/science_data.dart';
  import 'package:news_app/data/services/sports_data.dart';
  import 'package:news_app/data/services/tech_data.dart';
  import 'package:news_app/models/news_model.dart';
  part 'news_state.dart';

  class NewsCubit extends Cubit<NewsState> {
    NewsCubit() : super(NewsInitial());


  generalFun() async {
    emit(Loading());
    try {
      List<Articles> general = await getGeneralData();
      emit(LoadedGeneral(general));
    } catch (e) {
      emit(Error(e.toString()));
    }
  }

    healthFun() async {
      emit(Loading());

      try {
        List<Articles> health = await getHealthDAta();
        emit(LoadedHealth(health));
      } catch (e) {
        emit(Error(e));
      }
    }

    scienceFun() async {
      emit(Loading());

      try {
        List<Articles> science = await getScienceDAta();
        emit(LoadedScience(science));
      } catch (e) {
        emit(Error(e));
      }
    }

    sportsFun() async {
      emit(Loading());

      try {
        List<Articles> sports = await getSportsDAta();
        emit(LoadedSports(sports));
      } catch (e) {
        emit(Error(e));
      }
    }

    techFun() async {
      emit(Loading());

      try {
        List<Articles> tech = await getTechDAta();
        emit(LoadedTech(tech));
      } catch (e) {
        emit(Error(e));
      }
    }
  }
