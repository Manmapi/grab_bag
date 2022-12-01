import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:grab_bag/core/base/domain/entities/keycap.dart';
import 'package:grab_bag/core/base/domain/entities/keycap_cat.dart';
import 'package:grab_bag/core/base/domain/entities/keycap_set.dart';
import 'package:grab_bag/core/common/mixins/app_navigator.dart';
import 'package:grab_bag/core/constants.dart';
import 'package:grab_bag/features/main_screen/domain/entities/keycap_cat_detail.dart';
import 'package:grab_bag/features/main_screen/presentation/bloc/main_screen_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:uuid/uuid.dart';

class AddNewCatDialog extends StatefulWidget with AppNavigator {
  AddNewCatDialog({Key? key, required this.keycapSet}) : super(key: key);
  final KeycapSet keycapSet;

  @override
  State<AddNewCatDialog> createState() => _AddNewCatDialogState();
}

class _AddNewCatDialogState extends State<AddNewCatDialog> {
  final _nameController = TextEditingController();

  CaterogyList chosenCaterogy = CaterogyList.another;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: EdgeInsets.only(top: 5.w, left: 5.w, right: 5.w),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Form(
            key: _formKey,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Add new category',
                    style:
                        TextStyle(fontSize: 8.w, fontWeight: FontWeight.w600),
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
                            borderSide:
                                BorderSide(width: 2, color: Colors.black)),
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Colors.black)),
                        label: Text('Name'),
                      )),
                  SizedBox(height: 5.w),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Category:',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 4.w)),
                      DropdownButton(
                          value: chosenCaterogy,
                          items: const [
                            DropdownMenuItem(
                              value: CaterogyList.another,
                              child: Text('Another'),
                            ),
                            DropdownMenuItem(
                              value: CaterogyList.alpha,
                              child: Text('Base Alpha'),
                            ),
                            DropdownMenuItem(
                              value: CaterogyList.baseMod68,
                              child: Text('Base Modifier 68'),
                            ),
                            DropdownMenuItem(
                              value: CaterogyList.baseMod75,
                              child: Text('Base Modifier 75'),
                            ),
                            DropdownMenuItem(
                              value: CaterogyList.numpab,
                              child: Text('Base Numpad'),
                            ),
                          ],
                          onChanged: (CaterogyList? value) {
                            if (value != null) {
                              setState(() {
                                chosenCaterogy = value;
                              });
                            }
                          }),
                    ],
                  )
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
                          final KeycapCat keycapCat = KeycapCat(
                              name: _nameController.text,
                              setId: widget.keycapSet.id,
                              timeCreate: DateTime.now().millisecondsSinceEpoch,
                              id: const Uuid().v4());
                          final List<KeyCap> keycaps = chosenCaterogy.value
                              .map((e) => KeyCap(
                                  name: e,
                                  isFinish: false,
                                  catId: keycapCat.id,
                                  id: const Uuid().v4()))
                              .toList();
                          GetIt.I.get<MainScreenBloc>().add(
                              AddNewKeyCapCatDetail(
                                  KeyCapCatDetail(
                                      keycapCat: keycapCat,
                                      keycaps: keycaps,
                                      total: keycaps.length,
                                      totalComplete: 0),
                                  widget.keycapSet));
                          widget.pop(context);
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
