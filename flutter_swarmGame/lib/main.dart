import 'package:flame/util.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_swarmGame/game_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  Util flameUtil = Util();
  WidgetsFlutterBinding.ensureInitialized();
  await flameUtil.fullScreen(); //全屏
  await flameUtil.setOrientation(DeviceOrientation.portraitUp); //设置方向
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences storage = await SharedPreferences.getInstance();

  GameController gameController = GameController(storage);

  runApp(gameController.widget);

  TapGestureRecognizer tapper = TapGestureRecognizer();
  tapper.onTapDown = gameController.onTapDown;
  // ignore: deprecated_member_use
  flameUtil.addGestureRecognizer(tapper);

  // runApp(MyApp());
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Text('hh'),
//     );
//   }
// }
