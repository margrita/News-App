import 'package:flutter/material.dart';
import 'screens/onboarding.dart';
import 'screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'utilities/app_theme.dart';
main()async{
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  Widget _screen;
  bool seen = prefs.getBool('seen');
  if( seen == null || seen == false ){
    _screen= OnBoarding();
  }else{
    _screen=HomeScreen();
  }
  runApp(NewsApp(_screen));
}
class NewsApp extends StatelessWidget{
  final Widget _screen;
  NewsApp(this._screen);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      theme: AppTheme.appTheme,
      home: this._screen, 
    );
  }

}