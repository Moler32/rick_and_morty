import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rick_and_morty/bloc_abservable.dart';

import 'ui/pages/home_page.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  final storage = await HydratedStorage.build(storageDirectory: await getTemporaryDirectory(),);

  HydratedBlocOverrides.runZoned(() => runApp(const MyApp()),
  blocObserver: CharacterBlocAbservable(),
  storage: storage
  );


  // BlocOverrides.runZoned(() => runApp(const MyApp()),
  // blocObserver: CharacterBlocAbservable(),

  // );

}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rick And Morty',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.black,
        fontFamily: 'Georgia',
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontSize: 50, fontWeight: FontWeight.bold, color: Colors.white,
          ),
          headline2: TextStyle(
            fontSize: 30, fontWeight: FontWeight.w700, color: Colors.white,
          ),
          headline3: TextStyle(
            fontSize: 24, color: Colors.white,
          ),
          bodyText2: TextStyle(
            fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white,
          ),
          bodyText1: TextStyle(
            fontSize: 12, fontWeight: FontWeight.w200, color: Colors.white,
          ),
          caption: TextStyle(
            fontSize: 11, fontWeight: FontWeight.w100, color: Colors.grey,
          ),
        ),
      ),
      home: HomePage(title: 'Rick And Morty'),
    );
  }
}