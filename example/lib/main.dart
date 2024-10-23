import 'package:artistic_multilingual_keyboards/keyboards_layouts/keyboard_layouts.dart';
import 'package:artistic_multilingual_keyboards/utils/types.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyWidget(),
    );
  }
}

class MyWidget extends StatefulWidget {
  MyWidget({Key? key}) : super(key: key);

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  TextEditingController englishTEController = TextEditingController();
  TextEditingController urduTEController = TextEditingController();
  TextEditingController sindhiTEController = TextEditingController();
  TextEditingController marathiTEController = TextEditingController(); // New
  TextEditingController hindiTEController = TextEditingController(); // New
  TextEditingController bengaliTEController = TextEditingController();
  TextEditingController gujratiTEController = TextEditingController();
  TextEditingController tamilTEController = TextEditingController();
  TextEditingController teleguTEController = TextEditingController();
  TextEditingController kanadaTEController = TextEditingController();
  TextEditingController malaylamTEController = TextEditingController();
  //punjabi
  TextEditingController punjabiTEController = TextEditingController();
  TextEditingController asameTEController = TextEditingController();
  TextEditingController oriyaTEController = TextEditingController();
  TextEditingController santaliTEController = TextEditingController();
  TextEditingController nepaliTEController = TextEditingController();
  TextEditingController maithiliTEController = TextEditingController();
  FocusNode engFocusNode = FocusNode();
  FocusNode urduFocusNode = FocusNode();
  FocusNode sindhiFocusNode = FocusNode();
  FocusNode marathiFocusNode = FocusNode(); // New
  FocusNode hindiFocusNode = FocusNode(); // New
  FocusNode bengaliFocusNode = FocusNode();
  FocusNode gujratiFocusNode = FocusNode();
  FocusNode tamilFocusNode = FocusNode();
  FocusNode teleguFocusNode = FocusNode();
  FocusNode kanadaFocusNode = FocusNode();
  FocusNode malaylamFocusNode = FocusNode();
  //new
  FocusNode punjabiFocusNode = FocusNode();
  FocusNode asameFocusNode = FocusNode();
  FocusNode oriyaFocusNode = FocusNode();
  FocusNode santaliFocusNode = FocusNode();
  FocusNode nepaliFocusNode = FocusNode();
  FocusNode maithiliFocusNode = FocusNode();
  late TextEditingController currentKeyboardTEController;
  late FocusNode currentKeyboardFocusNode;
  KeyboardLanguages currentKeyboardLanguage = KeyboardLanguages.english;
  KeyboardAction currentKeyboardAction = KeyboardAction.actionNext;

  bool _isKeyboardOpen = false;

  @override
  void initState() {
    super.initState();
    currentKeyboardTEController = englishTEController;
    currentKeyboardFocusNode = engFocusNode;

    engFocusNode.addListener(() {
      setState(() {
        if (engFocusNode.hasFocus) {
          currentKeyboardFocusNode = engFocusNode;
          currentKeyboardAction = KeyboardAction.actionNext;
          currentKeyboardTEController = englishTEController;
          currentKeyboardLanguage = KeyboardLanguages.english;
          _isKeyboardOpen = true;
        } else {
          _isKeyboardOpen = false;
        }
      });
    });

    urduFocusNode.addListener(() {
      setState(() {
        if (urduFocusNode.hasFocus) {
          currentKeyboardFocusNode = urduFocusNode;
          currentKeyboardAction = KeyboardAction.actionNext;
          currentKeyboardTEController = urduTEController;
          currentKeyboardLanguage = KeyboardLanguages.urdu;
          _isKeyboardOpen = true;
        } else {
          _isKeyboardOpen = false;
        }
      });
    });

    sindhiFocusNode.addListener(() {
      setState(() {
        if (sindhiFocusNode.hasFocus) {
          currentKeyboardFocusNode = sindhiFocusNode;
          currentKeyboardAction = KeyboardAction.actionDone;
          currentKeyboardTEController = sindhiTEController;
          currentKeyboardLanguage = KeyboardLanguages.sindhi;
          _isKeyboardOpen = true;
        } else {
          _isKeyboardOpen = false;
        }
      });
    });

    marathiFocusNode.addListener(() {
      // New
      setState(() {
        if (marathiFocusNode.hasFocus) {
          currentKeyboardFocusNode = marathiFocusNode;
          currentKeyboardAction = KeyboardAction.actionNext;
          currentKeyboardTEController = marathiTEController;
          currentKeyboardLanguage =
              KeyboardLanguages.marathi; // Update this with your language enum
          _isKeyboardOpen = true;
        } else {
          _isKeyboardOpen = false;
        }
      });
    });
    bengaliFocusNode.addListener(() {
      // New
      setState(() {
        if (bengaliFocusNode.hasFocus) {
          currentKeyboardFocusNode = bengaliFocusNode;
          currentKeyboardAction = KeyboardAction.actionNext;
          currentKeyboardTEController = bengaliTEController;
          currentKeyboardLanguage =
              KeyboardLanguages.bengali; // Update this with your language enum
          _isKeyboardOpen = true;
        } else {
          _isKeyboardOpen = false;
        }
      });
    });
//guju
    gujratiFocusNode.addListener(() {
      // New
      setState(() {
        if (gujratiFocusNode.hasFocus) {
          currentKeyboardFocusNode = gujratiFocusNode;
          currentKeyboardAction = KeyboardAction.actionNext;
          currentKeyboardTEController = gujratiTEController;
          currentKeyboardLanguage =
              KeyboardLanguages.gujarati; // Update this with your language enum
          _isKeyboardOpen = true;
        } else {
          _isKeyboardOpen = false;
        }
      });
    });

    //maithili
     maithiliFocusNode.addListener(() {
      setState(() {
        if (maithiliFocusNode.hasFocus) {
          currentKeyboardFocusNode = maithiliFocusNode;
          currentKeyboardAction = KeyboardAction.actionNext;
          currentKeyboardTEController = maithiliTEController;
          currentKeyboardLanguage = KeyboardLanguages.maithili;
          _isKeyboardOpen = true;
        } else {
          _isKeyboardOpen = false;
        }
      });
    });
    //nepali
     nepaliFocusNode.addListener(() {
      setState(() {
        if (nepaliFocusNode.hasFocus) {
          currentKeyboardFocusNode = nepaliFocusNode;
          currentKeyboardAction = KeyboardAction.actionNext;
          currentKeyboardTEController = nepaliTEController;
          currentKeyboardLanguage = KeyboardLanguages.nepali;
          _isKeyboardOpen = true;
        } else {
          _isKeyboardOpen = false;
        }
      });
    });
    //santali
     santaliFocusNode.addListener(() {
      setState(() {
        if (santaliFocusNode.hasFocus) {
          currentKeyboardFocusNode = santaliFocusNode;
          currentKeyboardAction = KeyboardAction.actionNext;
          currentKeyboardTEController = santaliTEController;
          currentKeyboardLanguage = KeyboardLanguages.santali;
          _isKeyboardOpen = true;
        } else {
          _isKeyboardOpen = false;
        }
      });
    });
    //oriya
     oriyaFocusNode.addListener(() {
      setState(() {
        if (oriyaFocusNode.hasFocus) {
          currentKeyboardFocusNode = oriyaFocusNode;
          currentKeyboardAction = KeyboardAction.actionNext;
          currentKeyboardTEController = oriyaTEController;
          currentKeyboardLanguage = KeyboardLanguages.oriya;
          _isKeyboardOpen = true;
        } else {
          _isKeyboardOpen = false;
        }
      });
    });
    //asame
     asameFocusNode.addListener(() {
      setState(() {
        if (asameFocusNode.hasFocus) {
          currentKeyboardFocusNode = asameFocusNode;
          currentKeyboardAction = KeyboardAction.actionNext;
          currentKeyboardTEController = asameTEController;
          currentKeyboardLanguage = KeyboardLanguages.asame;
          _isKeyboardOpen = true;
        } else {
          _isKeyboardOpen = false;
        }
      });
    });
   // punjabi
    punjabiFocusNode.addListener(() {
      setState(() {
        if (urduFocusNode.hasFocus) {
          currentKeyboardFocusNode = punjabiFocusNode;
          currentKeyboardAction = KeyboardAction.actionNext;
          currentKeyboardTEController = punjabiTEController;
          currentKeyboardLanguage = KeyboardLanguages.punjabi;
          _isKeyboardOpen = true;
        } else {
          _isKeyboardOpen = false;
        }
      });
    });
    //tamil
    tamilFocusNode.addListener(() {
      // New
      setState(() {
        if (tamilFocusNode.hasFocus) {
          currentKeyboardFocusNode = tamilFocusNode;
          currentKeyboardAction = KeyboardAction.actionNext;
          currentKeyboardTEController = tamilTEController;
          currentKeyboardLanguage =
              KeyboardLanguages.tamil; // Update this with your language enum
          _isKeyboardOpen = true;
        } else {
          _isKeyboardOpen = false;
        }
      });
    });
    //telegu
    teleguFocusNode.addListener(() {
      // New
      setState(() {
        if (teleguFocusNode.hasFocus) {
          currentKeyboardFocusNode = teleguFocusNode;
          currentKeyboardAction = KeyboardAction.actionNext;
          currentKeyboardTEController = teleguTEController;
          currentKeyboardLanguage =
              KeyboardLanguages.telugu; // Update this with your language enum
          _isKeyboardOpen = true;
        } else {
          _isKeyboardOpen = false;
        }
      });
    });
    //kanada
    kanadaFocusNode.addListener(() {
      // New
      setState(() {
        if (kanadaFocusNode.hasFocus) {
          currentKeyboardFocusNode = kanadaFocusNode;
          currentKeyboardAction = KeyboardAction.actionNext;
          currentKeyboardTEController = kanadaTEController;
          currentKeyboardLanguage =
              KeyboardLanguages.kannada; // Update this with your language enum
          _isKeyboardOpen = true;
        } else {
          _isKeyboardOpen = false;
        }
      });
    });
    //malaylam
    malaylamFocusNode.addListener(() {
      // New
      setState(() {
        if (malaylamFocusNode.hasFocus) {
          currentKeyboardFocusNode = malaylamFocusNode;
          currentKeyboardAction = KeyboardAction.actionNext;
          currentKeyboardTEController = malaylamTEController;
          currentKeyboardLanguage = KeyboardLanguages
              .malayalam; // Update this with your language enum
          _isKeyboardOpen = true;
        } else {
          _isKeyboardOpen = false;
        }
      });
    });
    hindiFocusNode.addListener(() {
      // New
      setState(() {
        if (hindiFocusNode.hasFocus) {
          currentKeyboardFocusNode = hindiFocusNode;
          currentKeyboardAction = KeyboardAction.actionDone;
          currentKeyboardTEController = hindiTEController;
          currentKeyboardLanguage =
              KeyboardLanguages.hindi; // Update this with your language enum
          _isKeyboardOpen = true;
        } else {
          _isKeyboardOpen = false;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 100),
              const Text("English"),
              TextField(
                controller: englishTEController,
                focusNode: engFocusNode,
                textDirection: TextDirection.ltr,
                readOnly: true,
                showCursor: true,
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: 100),
              const Text("Urdu"),
              TextField(
                controller: urduTEController,
                focusNode: urduFocusNode,
                textDirection: TextDirection.rtl,
                readOnly: true,
                showCursor: true,
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: 100),
              const Text("Sindhi"),
              TextField(
                controller: sindhiTEController,
                focusNode: sindhiFocusNode,
                readOnly: true,
                showCursor: true,
                textAlign: TextAlign.start,
                textDirection: TextDirection.rtl,
              ),
              const SizedBox(height: 100), // Add spacing between sections
              const Text("Marathi"), // New section for Marathi
              TextField(
                controller: marathiTEController,
                focusNode: marathiFocusNode,
                readOnly: true,
                showCursor: true,
                textAlign: TextAlign.start,
                textDirection: TextDirection.ltr, // Update as needed
              ),
              const SizedBox(height: 100), // Add spacing between sections
              const Text("Hindi"), // New section for Hindi
              TextField(
                controller: hindiTEController,
                focusNode: hindiFocusNode,
                readOnly: true,
                showCursor: true,
                textAlign: TextAlign.start,
                textDirection: TextDirection.ltr, // Update as needed
              ),
              const SizedBox(height: 100), // Add spacing between sections
              const Text("Bengali"), // New section for Bengali
              TextField(
                controller: bengaliTEController,
                focusNode: bengaliFocusNode,
                readOnly: true,
                showCursor: true,
                textAlign: TextAlign.start,
                textDirection: TextDirection.ltr, // Update as needed
              ),
              //gujuu
              const SizedBox(height: 100),
              const Text("Gujrati"), // New section for Bengali
              TextField(
                controller: gujratiTEController,
                focusNode: gujratiFocusNode,
                readOnly: true,
                showCursor: true,
                textAlign: TextAlign.start,
                textDirection: TextDirection.ltr, // Update as needed
              ),
              //tamil
              const SizedBox(height: 100),
              const Text("Tamil"), // New section for Bengali
              TextField(
                controller: tamilTEController,
                focusNode: tamilFocusNode,
                readOnly: true,
                showCursor: true,
                textAlign: TextAlign.start,
                textDirection: TextDirection.ltr, // Update as needed
              ),
              //telegu
              const SizedBox(height: 100),
              const Text("Telegu"), // New section for Bengali
              TextField(
                controller: teleguTEController,
                focusNode: teleguFocusNode,
                readOnly: true,
                showCursor: true,
                textAlign: TextAlign.start,
                textDirection: TextDirection.ltr, // Update as needed
              ),
              //kanada
              const SizedBox(height: 100),
              const Text("Kanada"), // New section for Bengali
              TextField(
                controller: kanadaTEController,
                focusNode: kanadaFocusNode,
                readOnly: true,
                showCursor: true,
                textAlign: TextAlign.start,
                textDirection: TextDirection.ltr, // Update as needed
              ),
              //malaylam
              const SizedBox(height: 100),
              const Text("Malaylam"), // New section for Bengali
              TextField(
                controller: malaylamTEController,
                focusNode: malaylamFocusNode,
                readOnly: true,
                showCursor: true,
                textAlign: TextAlign.start,
                textDirection: TextDirection.ltr, // Update as needed
              ),
              //
               const SizedBox(height: 100),
              const Text("Sindhi"),
              TextField(
                controller: sindhiTEController,
                focusNode: sindhiFocusNode,
                readOnly: true,
                showCursor: true,
                textAlign: TextAlign.start,
                textDirection: TextDirection.rtl,
              ),
              //
               const SizedBox(height: 100),
              const Text("maithili"),
              TextField(
                controller: maithiliTEController,
                focusNode: maithiliFocusNode,
                readOnly: true,
                showCursor: true,
                textAlign: TextAlign.start,
                textDirection: TextDirection.rtl,
              ),
               const SizedBox(height: 100),
              const Text("nepali"),
              TextField(
                controller: nepaliTEController,
                focusNode: nepaliFocusNode,
                readOnly: true,
                showCursor: true,
                textAlign: TextAlign.start,
                textDirection: TextDirection.rtl,
              ),
               const SizedBox(height: 100),
              const Text("santali"),
              TextField(
                controller: santaliTEController,
                focusNode: santaliFocusNode,
                readOnly: true,
                showCursor: true,
                textAlign: TextAlign.start,
                textDirection: TextDirection.rtl,
              ),
               const SizedBox(height: 100),
              const Text("oriya"),
              TextField(
                controller: oriyaTEController,
                focusNode: oriyaFocusNode,
                readOnly: true,
                showCursor: true,
                textAlign: TextAlign.start,
                textDirection: TextDirection.rtl,
              ),
               const SizedBox(height: 100),
              const Text("asame"),
              TextField(
                controller: asameTEController,
                focusNode: asameFocusNode,
                readOnly: true,
                showCursor: true,
                textAlign: TextAlign.start,
                textDirection: TextDirection.rtl,
              ),
               const SizedBox(height: 100),
              const Text("punjabi"),
              TextField(
                controller: punjabiTEController,
                focusNode: punjabiFocusNode,
                readOnly: true,
                showCursor: true,
                textAlign: TextAlign.start,
                textDirection: TextDirection.rtl,
              ),

            ],
          ),
        ),
      ),
      bottomSheet: KeyboardLayouts(
        textEditingController: currentKeyboardTEController,
        focusNode: currentKeyboardFocusNode,
        isKeyboardOpen: _isKeyboardOpen,
        enableLanguageButton: false,
        keyShadowColor: Colors.black,
        keyBorderRadius: BorderRadius.circular(8),
        keyboardAction: currentKeyboardAction,
        currentKeyboardLanguage: currentKeyboardLanguage,
        keyboardActionNextEvent: () {
          if (engFocusNode.hasFocus) {
            engFocusNode.unfocus();
            urduFocusNode.requestFocus();
          } else if (urduFocusNode.hasFocus) {
            urduFocusNode.unfocus();
            sindhiFocusNode.requestFocus();
          } else if (sindhiFocusNode.hasFocus) {
            sindhiFocusNode.unfocus();
            marathiFocusNode.requestFocus(); // Move to Marathi
          } else if (marathiFocusNode.hasFocus) {
            marathiFocusNode.unfocus();
            hindiFocusNode.requestFocus(); // Move to Hindi
          } else if (hindiFocusNode.hasFocus) {
            hindiFocusNode.unfocus();
            bengaliFocusNode.requestFocus(); // Move to Bengali
          }
          //sequence
           else if (maithiliFocusNode.hasFocus) {
            maithiliFocusNode.unfocus();
            nepaliFocusNode.requestFocus(); // Move to Bengali
          }
           else if (nepaliFocusNode.hasFocus) {
            nepaliFocusNode.unfocus();
            santaliFocusNode.requestFocus(); // Move to Bengali
          }
           else if (santaliFocusNode.hasFocus) {
            santaliFocusNode.unfocus();
            oriyaFocusNode.requestFocus(); // Move to Bengali
          }
           else if (oriyaFocusNode.hasFocus) {
            oriyaFocusNode.unfocus();
            asameFocusNode.requestFocus(); // Move to Bengali
          }
           else if (asameFocusNode.hasFocus) {
            asameFocusNode.unfocus();
            punjabiFocusNode.requestFocus(); // Move to Bengali
          }
           else if (punjabiFocusNode.hasFocus) {
            punjabiFocusNode.unfocus();
            bengaliFocusNode.requestFocus(); // Move to Bengali
          }
        },
        keyboardActionDoneEvent: () {
          setState(() {
            _isKeyboardOpen = !_isKeyboardOpen;
          });
        },
      ),
    );
  }
}
