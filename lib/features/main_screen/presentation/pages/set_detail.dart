import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:grab_bag/core/base/domain/entities/keycap_set.dart';
import 'package:grab_bag/core/common/mixins/app_navigator.dart';
import 'package:grab_bag/features/main_screen/domain/entities/keycap_set_detail.dart';
import 'package:grab_bag/features/main_screen/presentation/bloc/main_screen_bloc.dart';
import 'package:grab_bag/features/main_screen/presentation/widgets/add_new_category_dialog.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SetDetail extends StatelessWidget {
  const SetDetail({Key? key, required this.keycapSet}) : super(key: key);
  final KeycapSet keycapSet;
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
        value: GetIt.I.get<MainScreenBloc>(),
        child: _SetDetail(keycapSet: keycapSet));
  }
}

class _SetDetail extends StatefulWidget with AppNavigator {
  const _SetDetail({Key? key, required this.keycapSet}) : super(key: key);
  final KeycapSet keycapSet;

  @override
  _SetDetailState createState() => _SetDetailState();
}

class _SetDetailState extends State<_SetDetail> {
  KeyCapSetDetail? _keyCapSetDetail;

  @override
  void initState() {
    GetIt.I.get<MainScreenBloc>().add(GetKeyCapSetDetail(widget.keycapSet));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_keyCapSetDetail != null) {
          GetIt.I
              .get<MainScreenBloc>()
              .add(UpdateKeyCapSetDetailEvent(_keyCapSetDetail!));
        }
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            widget.keycapSet.name,
            style: const TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
          elevation: 0,
          actions: [
            TextButton(
                onPressed: () {
                  if (_keyCapSetDetail != null) {
                    GetIt.I
                        .get<MainScreenBloc>()
                        .add(UpdateKeyCapSetDetailEvent(_keyCapSetDetail!));
                  }
                },
                child: const Text(
                  'Save',
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
        body: SingleChildScrollView(
            child: Container(
          padding: EdgeInsets.all(5.w),
          child: Column(children: [
            BlocListener<MainScreenBloc, MainScreenState>(
              listener: (context, state) {
                if (state is KeycapSetDetailState) {
                  setState(() {
                    _keyCapSetDetail = state.keyCapSetDetail;
                  });
                }
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: (_keyCapSetDetail != null)
                    ? _keyCapSetDetail!.keycapCatDetails.map((eKeycapCat) {
                        return Container(
                          margin: EdgeInsets.only(top: 3.w),
                          child: ExpansionTile(
                            subtitle: Text(
                                '${eKeycapCat.totalComplete}/${eKeycapCat.total} completed'),
                            backgroundColor:
                                const Color.fromARGB(134, 134, 196, 224),
                            title: Text(eKeycapCat.keycapCat.name),
                            children: eKeycapCat.keycaps.map((eKeyCap) {
                              return ListTile(
                                title: Text(eKeyCap.name),
                                trailing: PopupMenuButton(
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  child: const Icon(Icons.more_vert),
                                  itemBuilder: (context) {
                                    return <PopupMenuEntry>[
                                      PopupMenuItem(
                                        child: const Text('Edit'),
                                        onTap: () {},
                                      ),
                                      PopupMenuItem(
                                        child: const Text('Delete'),
                                        onTap: () {
                                          GetIt.I.get<MainScreenBloc>().add(
                                              DeleteKeycapEvent(
                                                  eKeyCap, widget.keycapSet));
                                        },
                                      )
                                    ];
                                  },
                                ),
                                leading: Checkbox(
                                    activeColor: Colors.greenAccent,
                                    value: eKeyCap.isFinish,
                                    onChanged: (value) {
                                      if (value != null) {
                                        setState(() {
                                          if (eKeyCap.isFinish && !value) {
                                            eKeycapCat.totalComplete -= 1;
                                          } else if (!eKeyCap.isFinish &&
                                              value) {
                                            eKeycapCat.totalComplete += 1;
                                          }
                                          eKeyCap.isFinish = value;
                                        });
                                      }
                                    }),
                              );
                            }).toList(),
                          ),
                        );
                      }).toList()
                    : [
                        Text(
                          'There are something wrong',
                          style: TextStyle(
                              color: Colors.orange,
                              fontSize: 5.w,
                              fontWeight: FontWeight.w600),
                        ),
                        TextButton(
                          child: Text(
                            'Try again?',
                            style: TextStyle(
                                color: Colors.orange,
                                fontSize: 5.w,
                                fontWeight: FontWeight.w500),
                          ),
                          onPressed: () {
                            GetIt.I
                                .get<MainScreenBloc>()
                                .add(GetKeyCapSetDetail(widget.keycapSet));
                          },
                        )
                      ],
              ),
            ),
            SizedBox(
              height: 7.h,
            ),
          ]),
        )),
        floatingActionButton: FloatingActionButton.extended(
          icon: const Icon(Icons.add),
          label: const Text('Add new category'),
          onPressed: () async {
            await showDialog(
              context: context,
              builder: (context) {
                return AddNewCatDialog(keycapSet: widget.keycapSet);
              },
            );
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
