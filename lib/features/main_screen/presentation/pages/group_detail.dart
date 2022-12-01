import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:grab_bag/core/base/domain/entities/keycap_group.dart';
import 'package:grab_bag/core/common/mixins/app_navigator.dart';
import 'package:grab_bag/features/main_screen/presentation/bloc/main_screen_bloc.dart';
import 'package:grab_bag/features/main_screen/presentation/widgets/add_new_set_dialog.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class GroupDetail extends StatelessWidget {
  const GroupDetail({Key? key, required this.keycapGroup}) : super(key: key);
  final KeycapGroup keycapGroup;
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
        value: GetIt.I.get<MainScreenBloc>(),
        child: _GroupDetail(keycapGroup: keycapGroup));
  }
}

class _GroupDetail extends StatefulWidget with AppNavigator {
  const _GroupDetail({Key? key, required this.keycapGroup}) : super(key: key);
  final KeycapGroup keycapGroup;
  @override
  _GroupDetailState createState() => _GroupDetailState();
}

class _GroupDetailState extends State<_GroupDetail> {
  @override
  void initState() {
    GetIt.I.get<MainScreenBloc>().add(GetAllKeyCapSet(widget.keycapGroup.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.keycapGroup.name,
            style: const TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
          elevation: 0,
        ),
        body: SingleChildScrollView(
            child: Container(
          padding: EdgeInsets.all(5.w),
          child: Column(children: [
            BlocBuilder<MainScreenBloc, MainScreenState>(
              buildWhen: (previous, current) {
                return current is AllKeyCapSetState;
              },
              builder: (context, state) {
                if (state is AllKeyCapSetState) {
                  return Column(
                    children: state.keycapSets.map((e) {
                      return Container(
                        margin: EdgeInsets.only(top: 3.w),
                        child: ListTile(
                          onTap: () {
                            widget.push(context, '/home/group/set',
                                routeSettings: RouteSettings(arguments: e),
                                transition: TransitionType.inFromLeft);
                          },
                          tileColor: Colors.blueGrey,
                          title: Text(e.name),
                        ),
                      );
                    }).toList(),
                  );
                }
                return const SizedBox.shrink();
              },
            )
          ]),
        )),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await showDialog(
              context: context,
              builder: (context) {
                return AddNewSetDialog(
                  keycapGroup: widget.keycapGroup,
                );
              },
            );
          },
          child: const Icon(
            Icons.add,
          ),
        ));
  }
}
