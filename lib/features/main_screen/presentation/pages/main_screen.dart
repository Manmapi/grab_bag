import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:grab_bag/core/common/mixins/app_navigator.dart';
import 'package:grab_bag/features/main_screen/presentation/bloc/main_screen_bloc.dart';
import 'package:grab_bag/features/main_screen/presentation/widgets/add_new_group_dialog.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
        value: GetIt.I.get<MainScreenBloc>(), child: const _MainScreen());
  }
}

class _MainScreen extends StatefulWidget with AppNavigator {
  const _MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<_MainScreen> {
  @override
  void initState() {
    GetIt.I.get<MainScreenBloc>().add(GetAllKeyCapGroup());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Grab Bag',
            style: TextStyle(
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
                return current is AllKeyCapGroupState;
              },
              builder: (context, state) {
                if (state is AllKeyCapGroupState) {
                  return Column(
                    children: state.keycapGroups.map((e) {
                      return Container(
                        margin: EdgeInsets.only(top: 3.w),
                        child: ListTile(
                          onTap: () {
                            widget.push(context, '/home/group',
                                routeSettings: RouteSettings(arguments: e), transition: TransitionType.inFromLeft);
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
                return AddNewGroupDialog();
              },
            );
          },
          child: const Icon(
            Icons.add,
          ),
        ));
  }
}
