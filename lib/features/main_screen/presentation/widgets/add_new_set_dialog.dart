import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:grab_bag/core/base/domain/entities/keycap_group.dart';
import 'package:grab_bag/core/base/domain/entities/keycap_set.dart';
import 'package:grab_bag/core/common/mixins/app_navigator.dart';
import 'package:grab_bag/features/main_screen/presentation/bloc/main_screen_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:uuid/uuid.dart';

class AddNewSetDialog extends StatelessWidget with AppNavigator {
  AddNewSetDialog({Key? key, required this.keycapGroup}) : super(key: key);
  final KeycapGroup keycapGroup;
  final _nameController = TextEditingController();
  final _descriptonController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: EdgeInsets.all(5.w),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Form(
            key: _formKey,
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Text(
                'Add new set',
                style: TextStyle(fontSize: 8.w, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 2.w),
              TextFormField(
                  controller: _nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Name can not empty';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2, color: Colors.black)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.black)),
                    label: Text('Name'),
                  )),
              SizedBox(height: 5.w),
              TextFormField(
                controller: _descriptonController,
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2, color: Colors.black)),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.black)),
                  label: Text('Description'),
                ),
              ),
            ]),
          ),
          SizedBox(
            height: 7.h,
            width: double.maxFinite,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  margin: const EdgeInsets.all(4),
                  child: TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('CANCLE',
                        style: TextStyle(fontWeight: FontWeight.w600)),
                  ),
                ),
                const VerticalDivider(
                  width: 20,
                  thickness: 1,
                  indent: 10,
                  endIndent: 10,
                  color: Colors.black,
                ),
                Container(
                  margin: const EdgeInsets.all(4),
                  child: TextButton(
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          GetIt.I
                              .get<MainScreenBloc>()
                              .add(AddNewKeyCapSet(KeycapSet(
                                id: const Uuid().v4(),
                                isComplete: false,
                                groupId: keycapGroup.id,
                                description: _descriptonController.text,
                                name: _nameController.text,
                              )));
                          pop(context);
                        }
                      },
                      child: const Text('CONFIRM',
                          style: TextStyle(fontWeight: FontWeight.w600))),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
