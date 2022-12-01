import 'dart:ffi';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grab_bag/core/base/domain/entities/keycap.dart';
import 'package:grab_bag/core/base/domain/entities/keycap_group.dart';
import 'package:grab_bag/core/base/domain/entities/keycap_set.dart';
import 'package:grab_bag/features/main_screen/domain/entities/keycap_cat_detail.dart';
import 'package:grab_bag/features/main_screen/domain/entities/keycap_set_detail.dart';
import 'package:grab_bag/features/main_screen/domain/repositories/keycap_group_repo.dart';
import 'package:grab_bag/features/main_screen/domain/repositories/keycap_set_repo.dart';
import 'package:injectable/injectable.dart';

part 'main_screen_event.dart';
part 'main_screen_state.dart';

@singleton
class MainScreenBloc extends Bloc<MainScreenEvent, MainScreenState> {
  final KeycapGroupRepo keycapGroupRepo;
  final KeyCapSetRepo keyCapSetRepo;
  MainScreenBloc(this.keycapGroupRepo, this.keyCapSetRepo)
      : super(MainScreenInitial()) {
    on<GetAllKeyCapGroup>((event, emit) async {
      final List<KeycapGroup> keycapGroups =
          await keycapGroupRepo.getAllGroup();
      emit(AllKeyCapGroupState(keycapGroups));
    });
    on<AddNewKeyCapGroup>(
      (event, emit) async {
        await keycapGroupRepo.addNewKeycapGroup(event.keycapGroup);
        add(GetAllKeyCapGroup());
      },
    );

    on<GetAllKeyCapSet>((event, emit) async {
      final List<KeycapSet> keycapSets =
          await keyCapSetRepo.getAllSet(event.groupId);
      emit(AllKeyCapSetState(keycapSets));
    });
    on<AddNewKeyCapSet>(
      (event, emit) async {
        await keyCapSetRepo.addNewKeycapSet(event.keycapSet);
        add(GetAllKeyCapSet(event.keycapSet.groupId));
      },
    );
    on<GetKeyCapSetDetail>((event, emit) async {
      final KeyCapSetDetail keyCapSetDetail =
          await keyCapSetRepo.getKeyCapSetDetail(event.keycapSet);
      emit(KeycapSetDetailState(keyCapSetDetail));
    });
    on<UpdateKeyCapSetDetailEvent>((event, emit) async {
      await keyCapSetRepo.updateKeyCapSetDetail(event.keyCapSetDetail);
      add(GetKeyCapSetDetail(event.keyCapSetDetail.keycapSet));
    });
    on<AddNewKeyCapCatDetail>(
      (event, emit) async {
        await keyCapSetRepo.addNewKeyCapCat(event.keyCapCatDetail);
        add(GetKeyCapSetDetail(event.keycapSet));
      },
    );
    on<DeleteKeycapEvent>((event, emit) async {
      await keyCapSetRepo.deleteKeyCap(event.keyCap);
      add(GetKeyCapSetDetail(event.keycapSet));
    });
  }
}
