part of 'main_screen_bloc.dart';

abstract class MainScreenState extends Equatable {
  const MainScreenState();

  @override
  List<Object> get props => [];
}

class MainScreenInitial extends MainScreenState {}

class AllKeyCapGroupState extends MainScreenState {
  final List<KeycapGroup> keycapGroups;
  const AllKeyCapGroupState(this.keycapGroups);
  @override
  List<Object> get props => [keycapGroups];
}

class AllKeyCapSetState extends MainScreenState {
  final List<KeycapSet> keycapSets;
  const AllKeyCapSetState(this.keycapSets);
  @override
  List<Object> get props => [keycapSets];
}

class KeycapSetDetailState extends MainScreenState {
  final KeyCapSetDetail keyCapSetDetail;
  const KeycapSetDetailState(this.keyCapSetDetail);
  @override
  List<Object> get props => [keyCapSetDetail];
}
