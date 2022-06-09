import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
               Colors.lightBlue,
              Colors.lightBlueAccent ,
            ],
            begin: Alignment.topRight,
          )
        ),
        child: const MainScreen(),
      ),
    );
  }
}


class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List <String> currentPin = ["", "", "", ""];
  TextEditingController pinOneController  = TextEditingController();
  TextEditingController pinOneController1 = TextEditingController();
  TextEditingController pinOneController2 = TextEditingController();
  TextEditingController pinOneController3 = TextEditingController();

  var outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: const BorderSide(color: Colors.transparent),

  );

  int pinIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          buildExitButton(),
          Expanded
            (child:
          Container(
            alignment: const Alignment(0,0.5),
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                buildSecurityText(),
                const SizedBox(height: 40.0,),
                buildPinRow(),
              ],
            ),
          ),
          ),
          buildNumberPad(),
        ],
      ),
    );
  }
  buildNumberPad(){
    return Expanded(
      child: Container(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  KeyBoardNumber(
                    n:1,
                    onPressed:(){
                      pinIndexSetup("1");
                    }
                  ),
                  KeyBoardNumber(
                      n:2,
                      onPressed:(){
                        pinIndexSetup("2");
                      }
                  ),

                  KeyBoardNumber(
                      n:3,
                      onPressed:(){
                        pinIndexSetup("3");
                      }
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  KeyBoardNumber(
                      n:4,
                      onPressed:(){
                        pinIndexSetup("4");
                      }
                  ),
                  KeyBoardNumber(
                      n:5,
                      onPressed:(){
                        pinIndexSetup("5");
                      }
                  ),

                  KeyBoardNumber(
                      n:6,
                      onPressed:(){
                        pinIndexSetup("6");
                      }
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  KeyBoardNumber(
                      n:7,
                      onPressed:(){
                        pinIndexSetup("7");
                      }
                  ),
                  KeyBoardNumber(
                      n:8,
                      onPressed:(){
                        pinIndexSetup("8");
                      }
                  ),

                  KeyBoardNumber(
                      n:9,
                      onPressed:(){
                        pinIndexSetup("9");
                      }
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ElevatedButton
                    (
                      onLongPress: (){
                        showToastC();
                      },
                      onPressed: () {
                        showToastD();
                      },
                      child: const Icon(FontAwesomeIcons.checkCircle,color:Colors.white)
                  ),
                  KeyBoardNumber(
                      n:0,
                      onPressed:(){
                        pinIndexSetup("0");
                      }
                  ),
                  ElevatedButton(
                      onPressed: (){
                        clearPin();
                      },
                      child: const Icon(Icons.backspace,color: Colors.white,),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  void showToastA() => Fluttertoast.showToast(
      msg: "Access Granted",
      fontSize: 22.0,
      gravity: ToastGravity.TOP,
    backgroundColor: Colors.greenAccent,
  );
  void showToastB() => Fluttertoast.showToast(msg: "Access Denied",
      fontSize: 22.0,
      gravity: ToastGravity.TOP,
    backgroundColor: Colors.redAccent,
  );
  void showToastC() => Fluttertoast.showToast(
      msg: "Hint: PSUT :)",
    fontSize: 22.0,
    gravity: ToastGravity.CENTER,
    backgroundColor: Colors.black26,
  );
  void showToastD() => Fluttertoast.showToast(
      msg: "ᛒluetooth is Connected Successfully",
    fontSize: 22.0,
    gravity: ToastGravity.TOP,
    backgroundColor: Colors.blue,
  );
  clearPin(){
    if(pinIndex ==0) {
      pinIndex = 0;
    } else if (pinIndex == 4){
      setPin(pinIndex ,"");
      currentPin[pinIndex-1] = "";
      pinIndex--;
    }else {
      setPin(pinIndex, "");
      currentPin[pinIndex-1] = "";
      pinIndex--;
    }
  }

pinIndexSetup(String text){
  if (pinIndex==0) {
    pinIndex = 1;
  } else if (pinIndex < 4) {
    pinIndex++;
  }
  setPin(pinIndex, text);
  currentPin[pinIndex-1]= text;
  String strPin = "";
  for (var e in currentPin) {
    strPin +=e;
  }
  if (pinIndex == 4 && strPin!="1991") {
    showToastB();
  }
  if(pinIndex == 4 && strPin=="1991"){
    showToastA();
  }
}

setPin(int loki, String text){
    switch(loki){
      case 1:
        pinOneController.text = text;
        break;
      case 2:
        pinOneController1.text =text;
        break;
      case 3:
        pinOneController2.text = text;
        break;
      case 4:
        pinOneController3.text = text;
        break;
    }
}

  buildPinRow(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        PINNumber(
          outlineInputBorder:outlineInputBorder,
          textEditingController: pinOneController,
        ),
        PINNumber(
          outlineInputBorder:outlineInputBorder,
          textEditingController: pinOneController1,
        ),
        PINNumber(
          outlineInputBorder:outlineInputBorder,
          textEditingController: pinOneController2,
        ),
        PINNumber(
          outlineInputBorder:outlineInputBorder,
          textEditingController: pinOneController3,
        ),
      ],
    );
  }
  buildSecurityText(){
    return const Text("Security PIN",
      style: TextStyle(
        color: Colors.white70,
        fontSize: 21.0,
        fontWeight: FontWeight.bold,

      )
      ,);
  }
}
buildExitButton(){
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: MaterialButton(
          onPressed: (){
            SystemNavigator.pop();
          },
          height: 50.0,
          minWidth: 50.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
          child: const Icon(Icons.clear, color: Colors.white,),
        ),
      )
    ],
  );
}

class PINNumber extends StatelessWidget {
  const PINNumber({Key? key, required this.outlineInputBorder, required this.textEditingController}) : super(key: key);
  final OutlineInputBorder outlineInputBorder;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50.0,
      child: TextField(
        controller: textEditingController,
        enabled: false,
        obscureText: true,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(10.0),
          border: outlineInputBorder,
          filled: true,
          fillColor: Colors.white30,
        ),
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30.0,
          color: Colors.white,
        ),
      ),
    );
  }
}

class KeyBoardNumber extends StatelessWidget {
  const KeyBoardNumber({Key? key, required this.n, required this.onPressed}) : super(key: key);
  final int n;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60.0,
      height: 60.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.blueAccent.withOpacity(0.1),
      ),
      alignment: Alignment.center,
      child: MaterialButton(
        padding: const EdgeInsets.all(8.0),
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(60.0),
        ),
        height: 90.0,
        child: Text(
          "$n",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24*MediaQuery.of(context).textScaleFactor,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            ),
        ),
        ),
      );
  }
}

