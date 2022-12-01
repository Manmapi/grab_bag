import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class InternectConnectionFail extends StatelessWidget {
  const InternectConnectionFail(
      {Key? key, this.onPress, this.callBackText, this.buttonEnable = false})
      : super(key: key);
  final VoidCallback? onPress;
  final Widget? callBackText;
  final bool buttonEnable;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: 100.w,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                  width: 80.w,
                  height: 80.w,
                  child: Image.asset('assets/images/no_internet.png')),
              Column(
                children: [
                  Text(
                    'Opps',
                    style:
                        TextStyle(fontSize: 20.w, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'There is no internet connection',
                    style:
                        TextStyle(fontSize: 5.w, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    'Please check your internet connection',
                    style:
                        TextStyle(fontSize: 5.w, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              buttonEnable
                  ? ElevatedButton(
                      onPressed: onPress ?? () {},
                      child: callBackText ?? const SizedBox.shrink())
                  : const SizedBox.shrink()
            ]),
      ),
    );
  }
}
