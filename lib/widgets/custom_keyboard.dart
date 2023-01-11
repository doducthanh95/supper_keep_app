import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:supper_keep_money/core/app_export.dart';

class CustomKeyboard extends StatelessWidget {
  CustomKeyboard({
    required this.panelController,
    this.mainFocus,
    this.nextFocus,
    required this.onTextInput,
    required this.onBackspace,
  });
  final PanelController panelController;
  final FocusNode? mainFocus;
  final FocusNode? nextFocus;
  final VoidCallback onBackspace;
  final ValueSetter<String> onTextInput;
  // final Widget page;
  List<TextKey> generatedKeys() {
    List<TextKey> keys = [];
    for (String i in [
      '1',
      '2',
      '3',
      '4',
      '5',
      '6',
      '7',
      '8',
      '9',
      '.',
      '0',
      ''
    ]) {
      keys.add(
        TextKey(
          text: i,
          onTextInput: this.onTextInput,
          onBackspace: this.onBackspace,
        ),
      );
    }
    return keys;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backgroundSecond,
      child: Padding(
          padding: EdgeInsets.only(bottom: 25),
          child: Column(children: [
            SizedBox(
              height: 52,
              child: Padding(
                padding: EdgeInsets.only(left: 5, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        panelController.close();
                        FocusScope.of(context).requestFocus(nextFocus);
                      },
                      child: SizedBox(
                        height: 35,
                        width: 60,
                        child: Icon(Icons.keyboard_arrow_down,
                            size: 25, color: Colors.blueGrey),
                      ),
                    ),
                    // GestureDetector(
                    //   onTap: () {
                    //     panelController.close();
                    //     Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //           builder: (context) => this.page,
                    //         ));
                    //   },
                    //   child: Text(
                    //     'Choose Category',
                    //     style: TextStyle(
                    //         fontSize: 16.sp,
                    //         fontWeight: FontWeight.bold,
                    //         color: Colors.blueGrey),
                    //   ),
                    // ),
                    GestureDetector(
                      onTap: () {
                        panelController.close();
                        this.mainFocus!.unfocus();
                      },
                      child: Text(
                        'Done',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              color: AppColors.backgroundPri,
              child: Wrap(
                children: generatedKeys(),
              ),
            ),
          ])),
    );
  }
}

class TextKey extends StatelessWidget {
  const TextKey({
    required this.text,
    this.onBackspace,
    this.onTextInput,
  });
  final VoidCallback? onBackspace;
  final String text;
  final ValueSetter<String>? onTextInput;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backgroundSecond,
      width: MediaQuery.of(context).size.width / 3,
      height: 60,
      child: Material(
        color: AppColors.backgroundSecond,
        child: InkWell(
          onTap: () {
            this.text.isEmpty
                ? this.onBackspace?.call()
                : this.onTextInput?.call(this.text);
          },
          child: Center(
              child: this.text.isEmpty
                  ? Icon(
                      Icons.backspace_outlined,
                      color: Colors.red,
                    )
                  : Text(
                      this.text,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColors.yellow500),
                    )),
        ),
      ),
    );
  }
}
