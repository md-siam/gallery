import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app/view/photo_list_screen.dart';
import 'app/view_model/photo_list_view_model.dart';
import 'app/core/resource/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<PhotoListViewModel>(
            create: (context) => PhotoListViewModel()),
      ],
      child: MaterialApp(
        title: 'Photo Gallery',
        themeMode: ThemeMode.light,
        theme: AppTheme.primaryTheme,
        builder: BotToastInit(),
        navigatorObservers: [BotToastNavigatorObserver()],
        debugShowCheckedModeBanner: false,
        home: const PhotoListScreen(),
      ),
    );
  }
}
