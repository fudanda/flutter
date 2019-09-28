import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'pages/splash_screen.dart';
import 'package:provide/provide.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'theme/color.dart';

import 'theme/themeProvide.dart';
// void main() => runApp(new MyApp());

void main() async {
  //初始化
  var theme = ThemeProvide();
  // var favorite = FavoriteProvide();
  var providers = Providers();
  //将theme,favorite加到providers中
  providers..provide(Provider.function((context) => theme));

  int themeIndex = await getTheme();

  runApp(ProviderNode(
    providers: providers,
    child: MyApp(themeIndex),
  ));
}

Future<int> getTheme() async {
  SharedPreferences sp = await SharedPreferences.getInstance();
  int themeIndex = sp.getInt("themeIndex");
  return null == themeIndex ? 0 : themeIndex;
}

class MyApp extends StatelessWidget {
  final SystemUiOverlayStyle _style =
      SystemUiOverlayStyle(statusBarColor: Colors.transparent);
  final int themeIndex;

  MyApp(this.themeIndex);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(_style);
    return Provide<ThemeProvide>(
      builder: (context, child, theme) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'flutter demo',
          theme: ThemeData(
              // This is the theme of your application.
              //除了primaryColor，还有brightness、iconTheme、textTheme等等可以设置
              primaryColor: YColors.themeColor[theme.value != null
                  ? theme.value
                  : themeIndex]["primaryColor"],
              primaryColorDark: YColors.themeColor[theme.value != null
                  ? theme.value
                  : themeIndex]["primaryColorDark"],
              accentColor: YColors.themeColor[
                  theme.value != null ? theme.value : themeIndex]["colorAccent"]

//              primaryColor: YColors.colorPrimary,
//              primaryColorDark: YColors.colorPrimaryDark,
//              accentColor: YColors.colorAccent,
//              dividerColor: YColors.dividerColor,
              ),
          home: SplashScreen(),
        );
      },
    );
  }
}
