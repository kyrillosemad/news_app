// ignore_for_file: must_be_immutable

part of 'news_cubit.dart';

@immutable
sealed class NewsState {}

final class NewsInitial extends NewsState {}

final class LoadedGeneral extends NewsState {
  late List<Articles> general;
  LoadedGeneral(this.general);
}

class LoadedHealth extends NewsState {
  final List<Articles> health;
  LoadedHealth(this.health);
}

final class LoadedScience extends NewsState {
  late List<Articles> science;
  LoadedScience(this.science);
}

final class LoadedSports extends NewsState {
  late List<Articles> sports;
  LoadedSports(this.sports);
}

final class LoadedTech extends NewsState {
  late List<Articles> tech;
  LoadedTech(this.tech);
}

final class Loading extends NewsState {}

final class Error extends NewsState {
  late String msg;
  Error(msg);
}
