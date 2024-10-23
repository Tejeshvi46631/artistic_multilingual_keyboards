// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../utils/types.dart';
import '../utils/languages_alphabets.dart';

/// keyboard Widget
class KeyboardLayouts extends StatefulWidget {
  /// Current keyboard type
  late KeyboardsTypes currentKeyboardsType;

  /// Current keyboard Language
  KeyboardLanguages currentKeyboardLanguage;

  /// Enable and Disable Language Button
  final bool enableLanguageButton;

  /// Text Editing Controller of TextField
  final TextEditingController textEditingController;

  /// Focus Node for TextField
  final FocusNode focusNode;

  /// Indicator to show Keyboard Status
  bool isKeyboardOpen;

  /// Keys background color
  final Color keysBackgroundColor;

  /// Keyboard background color
  final Color keyboardBackgroundColor;

  /// Key elevation
  final double keyElevation;

  /// Key shadow color
  final Color keyShadowColor;

  /// Key border radius
  BorderRadius? keyBorderRadius;

  /// Key Text Style
  final TextStyle keyTextStyle;

  /// Keyboard Action
  final KeyboardAction keyboardAction;

  /// Keyboard Action Done Event
  Function? keyboardActionDoneEvent;

  /// Keyboard Action Next Event
  Function? keyboardActionNextEvent;
  KeyboardLayouts({
    Key? key,
    required this.textEditingController,
    required this.focusNode,
    required this.isKeyboardOpen,
    this.currentKeyboardLanguage = KeyboardLanguages.english,
    this.enableLanguageButton = false,
    this.keysBackgroundColor = Colors.white,
    this.keyboardBackgroundColor = Colors.white70,
    this.keyElevation = 0,
    this.keyShadowColor = Colors.black,
    this.keyBorderRadius,
    this.keyTextStyle = const TextStyle(color: Colors.black, fontSize: 15),
    this.keyboardAction = KeyboardAction.actionDone,
    this.keyboardActionDoneEvent,
    this.keyboardActionNextEvent,
  }) : super(key: key) {
    /// Setting Keyboard type according to current language
    if (currentKeyboardLanguage == KeyboardLanguages.english) {
      currentKeyboardsType = KeyboardsTypes.englishLowerCase;
    } else if (currentKeyboardLanguage == KeyboardLanguages.urdu) {
      currentKeyboardsType = KeyboardsTypes.urduKeyboard2;
    } else if (currentKeyboardLanguage == KeyboardLanguages.sindhi) {
      currentKeyboardsType = KeyboardsTypes.sindhiKeyboard2;
    } else if (currentKeyboardLanguage == KeyboardLanguages.hindi) {
      currentKeyboardsType = KeyboardsTypes.hindhiKeyboard2;
    } else if (currentKeyboardLanguage == KeyboardLanguages.marathi) {
      currentKeyboardsType = KeyboardsTypes.marathiKeyboard2;
    } else if (currentKeyboardLanguage == KeyboardLanguages.bengali) {
      currentKeyboardsType = KeyboardsTypes.bengaliKeyboard2;
    } else if (currentKeyboardLanguage == KeyboardLanguages.bengali) {
      currentKeyboardsType = KeyboardsTypes.bengaliKeyboard2;
    }
    // languages add
    else if (currentKeyboardLanguage == KeyboardLanguages.gujarati) {
      currentKeyboardsType = KeyboardsTypes.gujaratiKeyboard2;
    } else if (currentKeyboardLanguage == KeyboardLanguages.kannada) {
      currentKeyboardsType = KeyboardsTypes.kannadaKeyboard2;
    } else if (currentKeyboardLanguage == KeyboardLanguages.tamil) {
      currentKeyboardsType = KeyboardsTypes.tamilKeyboard2;
    } else if (currentKeyboardLanguage == KeyboardLanguages.malayalam) {
      currentKeyboardsType = KeyboardsTypes.malayalamKeyboard2;
    } else if (currentKeyboardLanguage == KeyboardLanguages.telugu) {
      currentKeyboardsType = KeyboardsTypes.teluguKeyboard2;
    } else if (currentKeyboardLanguage == KeyboardLanguages.punjabi) {
      currentKeyboardsType = KeyboardsTypes.punjabiKeyboard2;
    } else if (currentKeyboardLanguage == KeyboardLanguages.asame) {
      currentKeyboardsType = KeyboardsTypes.asameKeyboard2;
    } else if (currentKeyboardLanguage == KeyboardLanguages.oriya) {
      currentKeyboardsType = KeyboardsTypes.oriyaKeyboard2;
    } else if (currentKeyboardLanguage == KeyboardLanguages.santali) {
      currentKeyboardsType = KeyboardsTypes.santaliKeyboard2;
    } else if (currentKeyboardLanguage == KeyboardLanguages.maithili) {
      currentKeyboardsType = KeyboardsTypes.maithiliKeyboard2;
    } else if (currentKeyboardLanguage == KeyboardLanguages.nepali) {
      currentKeyboardsType = KeyboardsTypes.nepaliKeyboard2;
    } else if (currentKeyboardLanguage == KeyboardLanguages.symbolic) {
      currentKeyboardsType = KeyboardsTypes.symbolic2;
    }
  }

  @override
  State<KeyboardLayouts> createState() => _KeyboardLayoutsState();
}

class _KeyboardLayoutsState extends State<KeyboardLayouts> {
  List<String> keys = [];
  KeyboardsTypes? previousKeyboardType;
  KeyboardLanguages? previousKeyboardLanguages;
  String numericKeyText = "123";

  @override
  void didUpdateWidget(KeyboardLayouts oldWidget) {
    super.didUpdateWidget(oldWidget);
    previousKeyboardType = null;
    previousKeyboardLanguages = null;
    numericKeyText = "123";
    setKeyboardKeys();
  }

  @override
  void initState() {
    super.initState();
    setKeyboardKeys(inverseKeys: false);
  }

  @override
  Widget build(BuildContext context) {
    /// Keyboard Design
    return widget.isKeyboardOpen
        ? WillPopScope(
            onWillPop: () async {
              if (widget.isKeyboardOpen) {
                setState(() {
                  widget.isKeyboardOpen = false;
                  if (widget.focusNode.hasFocus) {
                    widget.focusNode.unfocus();
                  }
                });
                return false;
              }
              return true;
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * .3,
              color: widget.keyboardBackgroundColor,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),

              /// Checking if keys list is empty then don't show keyboard
              child: keys.isNotEmpty
                  ?

                  /// Checking keyboard types whether its numeric or alphabetic
                  widget.currentKeyboardsType == KeyboardsTypes.numericKeyboard
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            _getKeyboardRow(
                                list: keys.sublist(0, 4),
                                horizontalPadding: 10),
                            _getKeyboardRow(
                                list: keys.sublist(4, 8),
                                horizontalPadding: 10),
                            _getNumericKeyboardThirdRow(),
                            _getNumericKeyboardLastRow(),
                          ],
                        )
                      : Column(
                          children: [
                            _getKeyboardRow(
                                list: keys.sublist(0, 10),
                                horizontalPadding: 10),
                            _getKeyboardRow(
                                list: keys.sublist(10, 19),
                                horizontalPadding: 20),
                            _getKeyboardThirdRow(),
                            _getKeyboardLastRow(),
                          ],
                        )
                  : const Center(child: Text("No alphabet found for keyboard")),
            ),
          )
        : const SizedBox(
            height: 0,
            width: 0,
          );
  }

  /// Setting Keyboard Keys according to selected language
  void setKeyboardKeys({bool inverseKeys = true}) {
    if (widget.currentKeyboardLanguage == KeyboardLanguages.english) {
      if (widget.currentKeyboardsType == KeyboardsTypes.englishLowerCase) {
        widget.currentKeyboardsType = inverseKeys
            ? KeyboardsTypes.englishUpperCase
            : KeyboardsTypes.englishLowerCase;
        keys = inverseKeys
            ? englishLowerCaseAlphabetsQWERTY
            : englishUpperCaseAlphabetsQWERTY;
      } else {
        widget.currentKeyboardsType = inverseKeys
            ? KeyboardsTypes.englishLowerCase
            : KeyboardsTypes.englishUpperCase;
        keys = inverseKeys
            ? englishUpperCaseAlphabetsQWERTY
            : englishLowerCaseAlphabetsQWERTY;
      }
    } else if (widget.currentKeyboardLanguage == KeyboardLanguages.urdu) {
      if (widget.currentKeyboardsType == KeyboardsTypes.urduKeyboard1) {
        keys = inverseKeys ? urduAlphabets2 : urduAlphabets1;
        widget.currentKeyboardsType = inverseKeys
            ? KeyboardsTypes.urduKeyboard2
            : KeyboardsTypes.urduKeyboard1;
      } else {
        keys = inverseKeys ? urduAlphabets1 : urduAlphabets2;
        widget.currentKeyboardsType = inverseKeys
            ? KeyboardsTypes.urduKeyboard1
            : KeyboardsTypes.urduKeyboard2;
      }
    }
    //hindi
    else if (widget.currentKeyboardLanguage == KeyboardLanguages.hindi) {
      if (widget.currentKeyboardsType == KeyboardsTypes.hindhiKeyboard1) {
        keys = inverseKeys ? hindiAlphabets2 : hindiAlphabets1;
        widget.currentKeyboardsType = inverseKeys
            ? KeyboardsTypes.hindhiKeyboard2
            : KeyboardsTypes.hindhiKeyboard1;
      } else {
        keys = inverseKeys ? hindiAlphabets1 : hindiAlphabets2;
        widget.currentKeyboardsType = inverseKeys
            ? KeyboardsTypes.hindhiKeyboard1
            : KeyboardsTypes.hindhiKeyboard2;
      }
    }
    // marathi
    else if (widget.currentKeyboardLanguage == KeyboardLanguages.marathi) {
      if (widget.currentKeyboardsType == KeyboardsTypes.marathiKeyboard1) {
        keys = inverseKeys ? marathiAlphabets2 : marathiAlphabets1;
        widget.currentKeyboardsType = inverseKeys
            ? KeyboardsTypes.marathiKeyboard2
            : KeyboardsTypes.marathiKeyboard1;
      } else {
        keys = inverseKeys ? marathiAlphabets1 : marathiAlphabets2;
        widget.currentKeyboardsType = inverseKeys
            ? KeyboardsTypes.marathiKeyboard1
            : KeyboardsTypes.marathiKeyboard2;
      }
    }
    // BEngali

    else if (widget.currentKeyboardLanguage == KeyboardLanguages.bengali) {
      if (widget.currentKeyboardsType == KeyboardsTypes.bengaliKeyboard1) {
        keys = inverseKeys ? bengaliAlphabets2 : bengaliAlphabets1;
        widget.currentKeyboardsType = inverseKeys
            ? KeyboardsTypes.bengaliKeyboard2
            : KeyboardsTypes.bengaliKeyboard1;
      } else {
        keys = inverseKeys ? bengaliAlphabets1 : bengaliAlphabets2;
        widget.currentKeyboardsType = inverseKeys
            ? KeyboardsTypes.bengaliKeyboard1
            : KeyboardsTypes.bengaliKeyboard2;
      }
    }
    //gujrat
    else if (widget.currentKeyboardLanguage == KeyboardLanguages.gujarati) {
      if (widget.currentKeyboardsType == KeyboardsTypes.gujaratiKeyboard1) {
        keys = inverseKeys ? gujaratiAlphabets2 : gujaratiAlphabets1;
        widget.currentKeyboardsType = inverseKeys
            ? KeyboardsTypes.gujaratiKeyboard2
            : KeyboardsTypes.gujaratiKeyboard1;
      } else {
        keys = inverseKeys ? gujaratiAlphabets1 : gujaratiAlphabets2;
        widget.currentKeyboardsType = inverseKeys
            ? KeyboardsTypes.gujaratiKeyboard1
            : KeyboardsTypes.gujaratiKeyboard2;
      }
    }
    //punjabi
    else if (widget.currentKeyboardLanguage == KeyboardLanguages.punjabi) {
      if (widget.currentKeyboardsType == KeyboardsTypes.punjabiKeyboard1) {
        keys = inverseKeys ? punjabiAlphabets2 : punjabiAlphabets1;
        widget.currentKeyboardsType = inverseKeys
            ? KeyboardsTypes.punjabiKeyboard2
            : KeyboardsTypes.punjabiKeyboard1;
      } else {
        keys = inverseKeys ? punjabiAlphabets1 : punjabiAlphabets2;
        widget.currentKeyboardsType = inverseKeys
            ? KeyboardsTypes.punjabiKeyboard1
            : KeyboardsTypes.punjabiKeyboard2;
      }
    }
    //nepali
    else if (widget.currentKeyboardLanguage == KeyboardLanguages.nepali) {
      if (widget.currentKeyboardsType == KeyboardsTypes.nepaliKeyboard1) {
        keys = inverseKeys ? nepaliAlphabets2 : nepaliAlphabets1;
        widget.currentKeyboardsType = inverseKeys
            ? KeyboardsTypes.nepaliKeyboard2
            : KeyboardsTypes.nepaliKeyboard1;
      } else {
        keys = inverseKeys ? nepaliAlphabets1 : nepaliAlphabets2;
        widget.currentKeyboardsType = inverseKeys
            ? KeyboardsTypes.nepaliKeyboard1
            : KeyboardsTypes.nepaliKeyboard2;
      }
    }
    //mathili
    else if (widget.currentKeyboardLanguage == KeyboardLanguages.maithili) {
      if (widget.currentKeyboardsType == KeyboardsTypes.maithiliKeyboard1) {
        keys = inverseKeys ? maithiliAlphabets2 : maithiliAlphabets1;
        widget.currentKeyboardsType = inverseKeys
            ? KeyboardsTypes.maithiliKeyboard2
            : KeyboardsTypes.maithiliKeyboard1;
      } else {
        keys = inverseKeys ? maithiliAlphabets1 : maithiliAlphabets2;
        widget.currentKeyboardsType = inverseKeys
            ? KeyboardsTypes.maithiliKeyboard1
            : KeyboardsTypes.maithiliKeyboard2;
      }
    }
    //oriya
    else if (widget.currentKeyboardLanguage == KeyboardLanguages.oriya) {
      if (widget.currentKeyboardsType == KeyboardsTypes.oriyaKeyboard1) {
        keys = inverseKeys ? odiaAlphabets2 : odiaAlphabets1;
        widget.currentKeyboardsType = inverseKeys
            ? KeyboardsTypes.oriyaKeyboard2
            : KeyboardsTypes.oriyaKeyboard1;
      } else {
        keys = inverseKeys ? odiaAlphabets1 : odiaAlphabets2;
        widget.currentKeyboardsType = inverseKeys
            ? KeyboardsTypes.oriyaKeyboard1
            : KeyboardsTypes.oriyaKeyboard2;
      }
    }
    //asame
    else if (widget.currentKeyboardLanguage == KeyboardLanguages.asame) {
      if (widget.currentKeyboardsType == KeyboardsTypes.asameKeyboard1) {
        keys = inverseKeys ? assameseAlphabets2 : assameseAlphabets1;
        widget.currentKeyboardsType = inverseKeys
            ? KeyboardsTypes.asameKeyboard2
            : KeyboardsTypes.asameKeyboard1;
      } else {
        keys = inverseKeys ? assameseAlphabets1 : assameseAlphabets2;
        widget.currentKeyboardsType = inverseKeys
            ? KeyboardsTypes.asameKeyboard1
            : KeyboardsTypes.asameKeyboard2;
      }
    }
    //santali
    else if (widget.currentKeyboardLanguage == KeyboardLanguages.santali) {
      if (widget.currentKeyboardsType == KeyboardsTypes.santaliKeyboard1) {
        keys = inverseKeys ? santaliAlphabets2 : santaliAlphabets1;
        widget.currentKeyboardsType = inverseKeys
            ? KeyboardsTypes.santaliKeyboard2
            : KeyboardsTypes.santaliKeyboard1;
      } else {
        keys = inverseKeys ? santaliAlphabets1 : santaliAlphabets2;
        widget.currentKeyboardsType = inverseKeys
            ? KeyboardsTypes.santaliKeyboard1
            : KeyboardsTypes.santaliKeyboard2;
      }
    }

    // telgu
    else if (widget.currentKeyboardLanguage == KeyboardLanguages.telugu) {
      if (widget.currentKeyboardsType == KeyboardsTypes.teluguKeyboard1) {
        keys = inverseKeys ? teluguAlphabets2 : teluguAlphabets1;
        widget.currentKeyboardsType = inverseKeys
            ? KeyboardsTypes.teluguKeyboard2
            : KeyboardsTypes.teluguKeyboard1;
      } else {
        keys = inverseKeys ? teluguAlphabets1 : teluguAlphabets2;
        widget.currentKeyboardsType = inverseKeys
            ? KeyboardsTypes.teluguKeyboard1
            : KeyboardsTypes.teluguKeyboard2;
      }
    }
    //malaylam
    else if (widget.currentKeyboardLanguage == KeyboardLanguages.malayalam) {
      if (widget.currentKeyboardsType == KeyboardsTypes.malayalamKeyboard1) {
        keys = inverseKeys ? malayalamAlphabets2 : malayalamAlphabets1;
        widget.currentKeyboardsType = inverseKeys
            ? KeyboardsTypes.malayalamKeyboard2
            : KeyboardsTypes.malayalamKeyboard1;
      } else {
        keys = inverseKeys ? malayalamAlphabets1 : malayalamAlphabets2;
        widget.currentKeyboardsType = inverseKeys
            ? KeyboardsTypes.malayalamKeyboard1
            : KeyboardsTypes.malayalamKeyboard2;
      }
    }
    //kanada
    else if (widget.currentKeyboardLanguage == KeyboardLanguages.kannada) {
      if (widget.currentKeyboardsType == KeyboardsTypes.kannadaKeyboard1) {
        keys = inverseKeys ? kannadaAlphabets2 : kannadaAlphabets1;
        widget.currentKeyboardsType = inverseKeys
            ? KeyboardsTypes.kannadaKeyboard2
            : KeyboardsTypes.kannadaKeyboard1;
      } else {
        keys = inverseKeys ? kannadaAlphabets1 : kannadaAlphabets2;
        widget.currentKeyboardsType = inverseKeys
            ? KeyboardsTypes.kannadaKeyboard1
            : KeyboardsTypes.kannadaKeyboard2;
      }
    }
    // telgu
    else if (widget.currentKeyboardLanguage == KeyboardLanguages.tamil) {
      if (widget.currentKeyboardsType == KeyboardsTypes.tamilKeyboard1) {
        keys = inverseKeys ? tamilAlphabets2 : tamilAlphabets1;
        widget.currentKeyboardsType = inverseKeys
            ? KeyboardsTypes.tamilKeyboard2
            : KeyboardsTypes.tamilKeyboard1;
      } else {
        keys = inverseKeys ? tamilAlphabets1 : tamilAlphabets2;
        widget.currentKeyboardsType = inverseKeys
            ? KeyboardsTypes.tamilKeyboard1
            : KeyboardsTypes.tamilKeyboard2;
      }
    }
    //sindhi
    else if (widget.currentKeyboardLanguage == KeyboardLanguages.sindhi) {
      if (widget.currentKeyboardsType == KeyboardsTypes.sindhiKeyboard1) {
        keys = inverseKeys ? sindhiAlphabets2 : sindhiAlphabets1;
        widget.currentKeyboardsType = inverseKeys
            ? KeyboardsTypes.sindhiKeyboard2
            : KeyboardsTypes.sindhiKeyboard1;
      } else {
        keys = inverseKeys ? sindhiAlphabets1 : sindhiAlphabets2;
        widget.currentKeyboardsType = inverseKeys
            ? KeyboardsTypes.sindhiKeyboard1
            : KeyboardsTypes.sindhiKeyboard2;
      }
    } else if (widget.currentKeyboardLanguage == KeyboardLanguages.symbolic) {
      if (widget.currentKeyboardsType == KeyboardsTypes.symbolic1) {
        keys = symbolickeyboard2;
        widget.currentKeyboardsType = KeyboardsTypes.symbolic2;
      } else {
        keys = symbolickeyboard1;
        widget.currentKeyboardsType = KeyboardsTypes.symbolic1;
      }
    }
  }

  /// Returns Keyboards Row
  Widget _getKeyboardRow(
      {required List<String> list, required double horizontalPadding}) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
        child: Row(
          children: [
            for (String keyT in list) _getKey(keyText: keyT),
          ],
        ),
      ),
    );
  }

  /// Returns 3rd Row of Keyboards
  Widget _getKeyboardThirdRow() {
    List list = keys.sublist(19, keys.length);
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            _getKey(
                keyText: _getSecondaryKeyboardKeyText(),
                keyType: /*(previousKeyboardType != null)?KeyTypes.symbolic1:*/
                    KeyTypes.changeKeyboardKey,
                buttonFlex: 3),
            for (String keyT in list) _getKey(keyText: keyT, buttonFlex: 2),
            _getKey(keyText: "", keyType: KeyTypes.backSpace, buttonFlex: 3),
          ],
        ),
      ),
    );
  }

  /// Returns Last Row of All Keyboards
  Widget _getKeyboardLastRow() {
    List<String> keyboardLastRow = [numericKeyText, "Languages", "Space"];
    if (widget.keyboardAction == KeyboardAction.actionDone) {
      keyboardLastRow.add("Done");
    } else if (widget.keyboardAction == KeyboardAction.actionNewLine) {
      keyboardLastRow.add("New Line");
    } else if (widget.keyboardAction == KeyboardAction.actionNext) {
      keyboardLastRow.add("Next");
    }
    return Expanded(
      child: Row(
        children: [
          _getKey(
              keyText: keyboardLastRow[0],
              buttonFlex: 2,
              keyType: KeyTypes.numericKeyboard),
          (widget.enableLanguageButton)
              ? _getKey(
                  keyText: keyboardLastRow[1],
                  buttonFlex: 2,
                  keyType: KeyTypes.changeLanguageKey)
              : const SizedBox(
                  height: 0,
                ),
          _getKey(
              keyText: keyboardLastRow[2],
              buttonFlex: 7,
              keyType: KeyTypes.spaceKey),
          _getKey(
            keyText: keyboardLastRow[3],
            buttonFlex: 2,
            keyType: widget.keyboardAction == KeyboardAction.actionNext
                ? KeyTypes.nextKey
                : widget.keyboardAction == KeyboardAction.actionNewLine
                    ? KeyTypes.newLineKey
                    : KeyTypes.doneKey,
          ),
        ],
      ),
    );
  }

  /// Returns 3rd Row of Numeric Keyboards
  Widget _getNumericKeyboardThirdRow() {
    List<String> keyboardLastRow = keys.sublist(8, 11);
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          children: [
            for (var x in keyboardLastRow)
              _getKey(
                keyText: x,
                buttonFlex: 2,
              ),
            _getKey(
              keyText: "",
              keyType: KeyTypes.backSpace,
              buttonFlex: 2,
            ),
          ],
        ),
      ),
    );
  }

  /// Returns Last Row of Numeric Keyboards
  Widget _getNumericKeyboardLastRow() {
    List<String> keyboardLastRow = keys.sublist(11);
    if (widget.keyboardAction == KeyboardAction.actionDone) {
      keyboardLastRow.add("Done");
    } else if (widget.keyboardAction == KeyboardAction.actionNext) {
      keyboardLastRow.add("Next");
    }
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          children: [
            _getKey(
              keyText: numericKeyText,
              keyType: KeyTypes.numericKeyboard,
              buttonFlex: 2,
            ),
            for (var x in keyboardLastRow)
              _getKey(
                keyText: x,
                buttonFlex: 2,
              ),
          ],
        ),
      ),
    );
  }

  /// Returns Single key of all alphabets
  Widget _getKey(
      {required String keyText,
      KeyTypes keyType = KeyTypes.textKey,
      int buttonFlex = 1}) {
    return Expanded(
      flex: buttonFlex,
      child: Container(
        width: double.maxFinite,
        // padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 10),
        margin: const EdgeInsets.symmetric(
          horizontal: 5,
        ),
        // decoration: BoxDecoration(
        //   borderRadius: keyBorderRadius ?? BorderRadius.circular(5),
        //   color: keysBackgroundColor,
        //   boxShadow: keysShadow
        // ),
        child: ElevatedButton(
          child: (keyType == KeyTypes.textKey ||
                  keyType == KeyTypes.spaceKey ||
                  keyType == KeyTypes.numericKeyboard ||
                  (keyText.isNotEmpty &&
                      keyType == KeyTypes.changeKeyboardKey &&
                      widget.currentKeyboardLanguage !=
                          KeyboardLanguages.english))
              ? Text(
                  keyText,
                  textAlign: TextAlign.center,
                  style: widget.keyTextStyle,
                )
              : Icon(
                  keyType == KeyTypes.nextKey
                      ? Icons.arrow_forward
                      : keyType == KeyTypes.newLineKey
                          ? Icons.subdirectory_arrow_left_rounded
                          : keyType == KeyTypes.changeKeyboardKey
                              ? CupertinoIcons.arrow_up_circle
                              : keyType == KeyTypes.changeLanguageKey
                                  ? CupertinoIcons.globe
                                  : keyType == KeyTypes.backSpace
                                      ? CupertinoIcons.delete_left
                                      : Icons.done,
                  size: 22,
                  color: widget.keyTextStyle.color,
                ),
          onPressed: (keyType == KeyTypes.textKey && keyText.isEmpty)
              ? null
              : () {
                  _onKeyPressed(keyText: keyText, keyType: keyType);
                },
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed) &&
                  widget.keyTextStyle.color != null) {
                return widget.keyTextStyle.color!.withAlpha(30);
              }
              return null;
            }),
            backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
              return widget.keysBackgroundColor;
            }),
            shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
                (Set<MaterialState> states) {
              return RoundedRectangleBorder(
                  borderRadius:
                      widget.keyBorderRadius ?? BorderRadius.circular(0));
            }),
            elevation: MaterialStateProperty.resolveWith<double>(
                (Set<MaterialState> states) {
              return widget.keyElevation;
            }),
            shadowColor: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
              return widget.keyShadowColor;
            }),
            // primary: widget.keysBackgroundColor,
            maximumSize: MaterialStateProperty.resolveWith<Size>(
                (Set<MaterialState> states) {
              return Size.infinite;
            }),
            // minimumSize: Size.zero, // Set this
            padding: MaterialStateProperty.resolveWith<EdgeInsetsGeometry>(
                (Set<MaterialState> states) {
              return const EdgeInsets.symmetric(horizontal: 0, vertical: 12);
            }),
            // tapTargetSize: MaterialTapTargetSize.padded// and this
          ),
        ),
      ),
    );
  }

  /// Returns Key Text for secondary keyboard
  String _getSecondaryKeyboardKeyText() {
    if (widget.currentKeyboardLanguage == KeyboardLanguages.urdu &&
        widget.currentKeyboardsType == KeyboardsTypes.urduKeyboard1) {
      return "ژ ڑ ذ";
    } else if (widget.currentKeyboardLanguage == KeyboardLanguages.urdu &&
        widget.currentKeyboardsType == KeyboardsTypes.urduKeyboard2) {
      return "ا ب پ";
    } else if (widget.currentKeyboardLanguage == KeyboardLanguages.sindhi &&
        widget.currentKeyboardsType == KeyboardsTypes.sindhiKeyboard1) {
      return "ڙ ڏ ڊ";
    } else if (widget.currentKeyboardLanguage == KeyboardLanguages.sindhi &&
        widget.currentKeyboardsType == KeyboardsTypes.sindhiKeyboard2) {
      return "ا ب پ";
    }
    //hindhi
    else if (widget.currentKeyboardLanguage == KeyboardLanguages.hindi &&
        widget.currentKeyboardsType == KeyboardsTypes.hindhiKeyboard1) {
      return "कखग";
    } else if (widget.currentKeyboardLanguage == KeyboardLanguages.hindi &&
        widget.currentKeyboardsType == KeyboardsTypes.hindhiKeyboard2) {
      return "कखग";
    }
    //marathi
    else if (widget.currentKeyboardLanguage == KeyboardLanguages.marathi &&
        widget.currentKeyboardsType == KeyboardsTypes.marathiKeyboard1) {
      return "कखग";
    } else if (widget.currentKeyboardLanguage == KeyboardLanguages.marathi &&
        widget.currentKeyboardsType == KeyboardsTypes.marathiKeyboard2) {
      return "कखग";
    }
    //Bengali
    else if (widget.currentKeyboardLanguage == KeyboardLanguages.bengali &&
        widget.currentKeyboardsType == KeyboardsTypes.bengaliKeyboard1) {
      return "কখগ";
    } else if (widget.currentKeyboardLanguage == KeyboardLanguages.bengali &&
        widget.currentKeyboardsType == KeyboardsTypes.bengaliKeyboard2) {
      return "কখগ";
    }
    //guju
    else if (widget.currentKeyboardLanguage == KeyboardLanguages.gujarati &&
        widget.currentKeyboardsType == KeyboardsTypes.gujaratiKeyboard1) {
      return "કખગ";
    } else if (widget.currentKeyboardLanguage == KeyboardLanguages.gujarati &&
        widget.currentKeyboardsType == KeyboardsTypes.gujaratiKeyboard2) {
      return "કખગ";
    }
    //punjabi
    else if (widget.currentKeyboardLanguage == KeyboardLanguages.punjabi &&
        widget.currentKeyboardsType == KeyboardsTypes.punjabiKeyboard1) {
      return "ਅ ਆਇ";
    } else if (widget.currentKeyboardLanguage == KeyboardLanguages.punjabi &&
        widget.currentKeyboardsType == KeyboardsTypes.punjabiKeyboard2) {
      return "ਅ ਆਇ";
    }
    //nepali
    else if (widget.currentKeyboardLanguage == KeyboardLanguages.nepali &&
        widget.currentKeyboardsType == KeyboardsTypes.nepaliKeyboard1) {
      return "औक";
    } else if (widget.currentKeyboardLanguage == KeyboardLanguages.nepali &&
        widget.currentKeyboardsType == KeyboardsTypes.nepaliKeyboard2) {
      return "औक";
    }
    //maithali
    else if (widget.currentKeyboardLanguage == KeyboardLanguages.maithili &&
        widget.currentKeyboardsType == KeyboardsTypes.maithiliKeyboard1) {
      return "अआइ";
    } else if (widget.currentKeyboardLanguage == KeyboardLanguages.maithili &&
        widget.currentKeyboardsType == KeyboardsTypes.maithiliKeyboard2) {
      return "अआइ";
    }
    //oriya
    else if (widget.currentKeyboardLanguage == KeyboardLanguages.oriya &&
        widget.currentKeyboardsType == KeyboardsTypes.oriyaKeyboard1) {
      return "ଅଆଇ";
    } else if (widget.currentKeyboardLanguage == KeyboardLanguages.oriya &&
        widget.currentKeyboardsType == KeyboardsTypes.oriyaKeyboard2) {
      return "ଅଆଇ";
    }
    //ssanath
    else if (widget.currentKeyboardLanguage == KeyboardLanguages.santali &&
        widget.currentKeyboardsType == KeyboardsTypes.santaliKeyboard1) {
      return "ᱚᱛᱜ";
    } else if (widget.currentKeyboardLanguage == KeyboardLanguages.santali &&
        widget.currentKeyboardsType == KeyboardsTypes.santaliKeyboard2) {
      return "ᱚᱛᱜ";
    }
    //asami
    else if (widget.currentKeyboardLanguage == KeyboardLanguages.asame &&
        widget.currentKeyboardsType == KeyboardsTypes.asameKeyboard1) {
      return "অআই";
    } else if (widget.currentKeyboardLanguage == KeyboardLanguages.asame &&
        widget.currentKeyboardsType == KeyboardsTypes.asameKeyboard2) {
      return "অআই";
    }
    //telgu
    else if (widget.currentKeyboardLanguage == KeyboardLanguages.telugu &&
        widget.currentKeyboardsType == KeyboardsTypes.teluguKeyboard1) {
      return "అఆఇ";
    } else if (widget.currentKeyboardLanguage == KeyboardLanguages.telugu &&
        widget.currentKeyboardsType == KeyboardsTypes.teluguKeyboard2) {
      return "అఆఇ";
    }
    //tamil
    else if (widget.currentKeyboardLanguage == KeyboardLanguages.tamil &&
        widget.currentKeyboardsType == KeyboardsTypes.tamilKeyboard1) {
      return "கஙச";
    } else if (widget.currentKeyboardLanguage == KeyboardLanguages.tamil &&
        widget.currentKeyboardsType == KeyboardsTypes.tamilKeyboard2) {
      return "கஙச";
    }
    //malaylam
    else if (widget.currentKeyboardLanguage == KeyboardLanguages.malayalam &&
        widget.currentKeyboardsType == KeyboardsTypes.malayalamKeyboard1) {
      return "കഖഗ";
    } else if (widget.currentKeyboardLanguage == KeyboardLanguages.malayalam &&
        widget.currentKeyboardsType == KeyboardsTypes.malayalamKeyboard2) {
      return "കഖഗ";
    }
    //kanada
    else if (widget.currentKeyboardLanguage == KeyboardLanguages.kannada &&
        widget.currentKeyboardsType == KeyboardsTypes.kannadaKeyboard1) {
      return "ಅಆಇ";
    } else if (widget.currentKeyboardLanguage == KeyboardLanguages.kannada &&
        widget.currentKeyboardsType == KeyboardsTypes.kannadaKeyboard2) {
      return "ಅಆಇ";
    } 
    
    
    else if (widget.currentKeyboardLanguage == KeyboardLanguages.symbolic &&
        widget.currentKeyboardsType == KeyboardsTypes.symbolic1) {
      return "+/-";
    } else if (widget.currentKeyboardLanguage == KeyboardLanguages.symbolic &&
        widget.currentKeyboardsType == KeyboardsTypes.symbolic2) {
      return "!@#";
    }
    return "";
  }

  /// Returns Key Text for numeric key keyboard
  String _getNumericKeyText() {
    if (previousKeyboardLanguages == KeyboardLanguages.urdu &&
        previousKeyboardType == KeyboardsTypes.urduKeyboard1) {
      return "ا ب پ";
    } else if (previousKeyboardLanguages == KeyboardLanguages.urdu &&
        previousKeyboardType == KeyboardsTypes.urduKeyboard2) {
      return "ژ ڑ ذ";
    } else if (previousKeyboardLanguages == KeyboardLanguages.sindhi &&
        previousKeyboardType == KeyboardsTypes.sindhiKeyboard1) {
      return "ا ب پ";
    } else if (previousKeyboardLanguages == KeyboardLanguages.sindhi &&
        previousKeyboardType == KeyboardsTypes.sindhiKeyboard2) {
      return "ڙ ڏ ڊ";
    }
    // hindi
    else if (previousKeyboardLanguages == KeyboardLanguages.hindi &&
        previousKeyboardType == KeyboardsTypes.hindhiKeyboard1) {
      return "ग ख क";
    } else if (previousKeyboardLanguages == KeyboardLanguages.hindi &&
        previousKeyboardType == KeyboardsTypes.hindhiKeyboard2) {
      return "ग ख क";
    }
    // marathi
    else if (previousKeyboardLanguages == KeyboardLanguages.marathi &&
        previousKeyboardType == KeyboardsTypes.marathiKeyboard1) {
      return "ग ख क";
    } else if (previousKeyboardLanguages == KeyboardLanguages.marathi &&
        previousKeyboardType == KeyboardsTypes.marathiKeyboard2) {
      return "ग ख क";
    }
    //Gujrati
    else if (previousKeyboardLanguages == KeyboardLanguages.gujarati &&
        previousKeyboardType == KeyboardsTypes.gujaratiKeyboard1) {
      return "કખગ";
    } else if (previousKeyboardLanguages == KeyboardLanguages.gujarati &&
        previousKeyboardType == KeyboardsTypes.gujaratiKeyboard2) {
      return "કખગ";
    }
    //tamil
    else if (previousKeyboardLanguages == KeyboardLanguages.tamil &&
        previousKeyboardType == KeyboardsTypes.tamilKeyboard1) {
      return "கஙச";
    } else if (previousKeyboardLanguages == KeyboardLanguages.tamil &&
        previousKeyboardType == KeyboardsTypes.tamilKeyboard2) {
      return "கஙச";
    }
    //telegu
    else if (previousKeyboardLanguages == KeyboardLanguages.telugu &&
        previousKeyboardType == KeyboardsTypes.teluguKeyboard1) {
      return "అఆఇ";
    } else if (previousKeyboardLanguages == KeyboardLanguages.telugu &&
        previousKeyboardType == KeyboardsTypes.teluguKeyboard2) {
      return "అఆఇ";
    }
    //kanada
    else if (previousKeyboardLanguages == KeyboardLanguages.kannada &&
        previousKeyboardType == KeyboardsTypes.kannadaKeyboard1) {
      return "ಅಆಇ";
    } else if (previousKeyboardLanguages == KeyboardLanguages.kannada &&
        previousKeyboardType == KeyboardsTypes.kannadaKeyboard2) {
      return "ಅಆಇ";
    }
    //malaylam
    else if (previousKeyboardLanguages == KeyboardLanguages.malayalam &&
        previousKeyboardType == KeyboardsTypes.malayalamKeyboard1) {
      return "കഖഗ";
    } else if (previousKeyboardLanguages == KeyboardLanguages.malayalam &&
        previousKeyboardType == KeyboardsTypes.malayalamKeyboard2) {
      return "കഖഗ";
    }
    //
    //bengali

    else if (previousKeyboardLanguages == KeyboardLanguages.bengali &&
        previousKeyboardType == KeyboardsTypes.bengaliKeyboard1) {
      return "কখগ";
    } else if (previousKeyboardLanguages == KeyboardLanguages.bengali &&
        previousKeyboardType == KeyboardsTypes.bengaliKeyboard2) {
      return "কখগ";
    } 

    //asami1
       else if (previousKeyboardLanguages == KeyboardLanguages.asame &&
        previousKeyboardType == KeyboardsTypes.asameKeyboard1) {
      return "অআই";
    } else if (previousKeyboardLanguages == KeyboardLanguages.asame &&
        previousKeyboardType == KeyboardsTypes.asameKeyboard2) {
      return "অআই";
    } 

    //nepali2
       else if (previousKeyboardLanguages == KeyboardLanguages.nepali &&
        previousKeyboardType == KeyboardsTypes.nepaliKeyboard1) {
      return "औक";
    } else if (previousKeyboardLanguages == KeyboardLanguages.nepali &&
        previousKeyboardType == KeyboardsTypes.nepaliKeyboard2) {
      return "औक";
    } 
       //santali3
       else if (previousKeyboardLanguages == KeyboardLanguages.santali &&
        previousKeyboardType == KeyboardsTypes.santaliKeyboard1) {
      return "ᱚᱛᱜ";
    } else if (previousKeyboardLanguages == KeyboardLanguages.santali &&
        previousKeyboardType == KeyboardsTypes.santaliKeyboard2) {
      return "ᱚᱛᱜ";
    } 
    //punjabi4
       else if (previousKeyboardLanguages == KeyboardLanguages.punjabi &&
        previousKeyboardType == KeyboardsTypes.punjabiKeyboard1) {
      return"ਅ ਆਇ";
    } else if (previousKeyboardLanguages == KeyboardLanguages.punjabi &&
        previousKeyboardType == KeyboardsTypes.punjabiKeyboard2) {
      return "ਅ ਆਇ";
    } 
    //oriya5
       else if (previousKeyboardLanguages == KeyboardLanguages.oriya &&
        previousKeyboardType == KeyboardsTypes.oriyaKeyboard1) {
      return "अआइ";
    } else if (previousKeyboardLanguages == KeyboardLanguages.oriya &&
        previousKeyboardType == KeyboardsTypes.oriyaKeyboard2) {
      return "अआइ";
    } 
    //maithili6
       else if (previousKeyboardLanguages == KeyboardLanguages.maithili &&
        previousKeyboardType == KeyboardsTypes.maithiliKeyboard1) {
      return "ଅଆଇ";
    } else if (previousKeyboardLanguages == KeyboardLanguages.maithili &&
        previousKeyboardType == KeyboardsTypes.maithiliKeyboard2) {
      return "ଅଆଇ";
    } 
    
    
    else if (previousKeyboardLanguages == KeyboardLanguages.english &&
        previousKeyboardType == KeyboardsTypes.englishLowerCase) {
      return "ABC";
    } else if (previousKeyboardLanguages == KeyboardLanguages.english &&
        previousKeyboardType == KeyboardsTypes.englishUpperCase) {
      return "abc";
    }
    return "123";
  }

  /// Listener handles key pressed event
  void _onKeyPressed({
    required String keyText,
    required KeyTypes keyType,
  }) {
    if (keyType == KeyTypes.textKey || keyType == KeyTypes.spaceKey) {
      if (KeyTypes.spaceKey == keyType) {
        keyText = " ";
      }
      _onTextChanged(changedText: keyText);
    } else {
      _onIconKeyPressed(keyType: keyType);
    }
  }

  /// Listener handles text change event
  void _onTextChanged({required String changedText}) {
    String currentText = widget.textEditingController.text;
    int cursorPosition = widget.textEditingController.selection.extentOffset;
    int cursorStartPosition = widget.textEditingController.selection.baseOffset;
    if (cursorStartPosition >= 0 && cursorStartPosition != cursorPosition) {
      currentText =
          currentText.replaceRange(cursorStartPosition, cursorPosition, "");
      cursorPosition = cursorStartPosition;
      if (cursorPosition < 0) {
        cursorPosition = 0;
      }
    }
    String prefix = "";
    if (cursorPosition > 0) {
      prefix = currentText.substring(0, cursorPosition);
    }
    if (cursorPosition < 0) {
      cursorPosition = 0;
    }
    String suffix = currentText.substring(cursorPosition);
    String completeText = prefix + changedText + suffix;
    widget.textEditingController.text = completeText;

    if (currentText.length != widget.textEditingController.text.length) {
      cursorPosition += changedText.length;
    }
    if (cursorPosition > completeText.length) {
      cursorPosition = completeText.length;
    }
    widget.textEditingController.selection =
        TextSelection.fromPosition(TextPosition(
      offset: cursorPosition,
    ));
  }

  /// Listener handles all key events
  void _onIconKeyPressed({required KeyTypes keyType}) {
    if (keyType == KeyTypes.backSpace) {
      _onBackSpacePressed();
    } else if (keyType == KeyTypes.changeKeyboardKey) {
      /// Switch between keyboards of same language
      setState(() {
        setKeyboardKeys();
      });
      // _changeKeyboardOfSameLanguage();
    } else if (keyType == KeyTypes.changeLanguageKey) {
      /// Switch Keyboard Language
      _onKeyboardLanguageChange();
    } else if (keyType == KeyTypes.numericKeyboard) {
      /// Change Keyboard to numeric here
      setState(() {
        if (previousKeyboardType ==
            null /*|| previousKeyboardType != KeyboardsTypes.symbolic1*/) {
          previousKeyboardType = widget.currentKeyboardsType;
          // keys = symbolickeyboard1;
          previousKeyboardLanguages = widget.currentKeyboardLanguage;
          widget.currentKeyboardsType = KeyboardsTypes.symbolic2;
          widget.currentKeyboardLanguage = KeyboardLanguages.symbolic;
          numericKeyText = _getNumericKeyText();
        } else {
          widget.currentKeyboardsType = previousKeyboardType!;
          previousKeyboardType = null;
          // keys = englishUpperCaseAlphabetsQWERTY;
          widget.currentKeyboardLanguage = previousKeyboardLanguages!;
          previousKeyboardLanguages = null;
          numericKeyText = "123";
        }
        setKeyboardKeys(inverseKeys: false);
      });
    } else if (keyType == KeyTypes.newLineKey) {
      _onNewLineKeyPressed();
    } else if (keyType == KeyTypes.doneKey) {
      if (widget.keyboardActionDoneEvent != null) {
        widget.keyboardActionDoneEvent!();
      }
      if (widget.focusNode.hasFocus) {
        widget.focusNode.unfocus();
      }
    } else if (keyType == KeyTypes.nextKey) {
      if (widget.keyboardActionNextEvent != null) {
        widget.keyboardActionNextEvent!();
      }
    }
  }

  /// Handles back pressed from keyboard
  void _onBackSpacePressed() {
    String currentString = widget.textEditingController.text;
    int cursorPosition = widget.textEditingController.selection.extentOffset;
    if (currentString.isNotEmpty) {
      int cursorStartPosition =
          widget.textEditingController.selection.baseOffset;
      if (cursorStartPosition >= 0 && cursorStartPosition != cursorPosition) {
        currentString =
            currentString.replaceRange(cursorStartPosition, cursorPosition, "");
        cursorPosition = cursorStartPosition;
        if (cursorPosition < 0) {
          cursorPosition = 0;
        }
        widget.textEditingController.text = currentString;
        TextSelection textSelection =
            TextSelection.fromPosition(TextPosition(offset: cursorPosition));
        widget.textEditingController.selection = textSelection;
      } else {
        String prefix = "";
        if (cursorPosition > 1) {
          prefix = currentString.substring(0, cursorPosition - 1);
        }
        if (cursorPosition < 0) {
          cursorPosition = 0;
        }
        String suffix = currentString.substring(cursorPosition);
        widget.textEditingController.text = prefix + suffix;
        TextSelection textSelection = TextSelection.fromPosition(
            TextPosition(offset: cursorPosition - 1));
        widget.textEditingController.selection = textSelection;
      }
    }
  }

  /// Handles new line event
  void _onNewLineKeyPressed() {
    String currentString = widget.textEditingController.text;
    int cursorPosition = widget.textEditingController.selection.extentOffset;
    String prefix = "";
    if (cursorPosition > 0) {
      prefix = currentString.substring(0, cursorPosition);
    }
    if (cursorPosition < 0) {
      cursorPosition = 0;
    }
    String suffix = currentString.substring(cursorPosition);
    widget.textEditingController.text = prefix + "\n" + suffix;
    TextSelection textSelection =
        TextSelection.fromPosition(TextPosition(offset: cursorPosition + 1));
    widget.textEditingController.selection = textSelection;
  }

  /// Handles Keyboard language change.
  void _onKeyboardLanguageChange() {
    if (widget.currentKeyboardLanguage == KeyboardLanguages.symbolic &&
        previousKeyboardLanguages != null &&
        previousKeyboardType != null) {
      widget.currentKeyboardsType = previousKeyboardType!;
      widget.currentKeyboardLanguage = previousKeyboardLanguages!;
      previousKeyboardLanguages = null;
      previousKeyboardType = null;
    }

    List languagesList = List.from(KeyboardLanguages.values);
    languagesList.remove(KeyboardLanguages.symbolic);
    int updatedLanguageIndex =
        languagesList.indexOf(widget.currentKeyboardLanguage) + 1;
    setState(() {
      if (updatedLanguageIndex >= languagesList.length) {
        widget.currentKeyboardLanguage = languagesList[0];
      } else {
        widget.currentKeyboardLanguage = languagesList[updatedLanguageIndex];
      }
      setKeyboardKeys();
    });
  }
}
