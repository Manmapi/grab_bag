part of 'main_screen_bloc.dart';

abstract class MainScreenEvent extends Equatable {
  const MainScreenEvent();

  @override
  List<Object> get props => [];
}

class GetAllKeyCapGroup extends MainScreenEvent {}

class AddNewKeyCapGroup extends MainScreenEvent {
  final KeycapGroup keycapGroup;
  const AddNewKeyCapGroup(this.keycapGroup);
}

class AddNewKeyCapSet extends MainScreenEvent {
  final KeycapSet keycapSet;
  const AddNewKeyCapSet(this.keycapSet);
}

class GetAllKeyCapSet extends MainScreenEvent {
  final String groupId;
  const GetAllKeyCapSet(this.groupId);
}

class GetKeyCapSetDetail extends MainScreenEvent {
  final KeycapSet keycapSet;
  const GetKeyCapSetDetail(this.keycapSet);
}

class UpdateKeyCapSetDetailEvent extends MainScreenEvent {
  final KeyCapSetDetail keyCapSetDetail;
  const UpdateKeyCapSetDetailEvent(this.keyCapSetDetail);
}

class AddNewKeyCapCatDetail extends MainScreenEvent {
  final KeyCapCatDetail keyCapCatDetail;
  final KeycapSet keycapSet;
  const AddNewKeyCapCatDetail(this.keyCapCatDetail, this.keycapSet);
}

class DeleteKeycapEvent extends MainScreenEvent {
  final KeyCap keyCap;
  final KeycapSet keycapSet;

  const DeleteKeycapEvent(this.keyCap, this.keycapSet);
}
