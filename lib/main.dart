import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrition_app/blocs/navigation/navigation_bloc.dart';
import 'package:nutrition_app/screens/general_settings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>NavigationBloc()),
      ],
      child: MaterialApp(
        title: 'Nutrition App',
        // themeMode: state.isDarkMode ? ThemeMode.dark : ThemeMode.light,
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        darkTheme: ThemeData.dark(),
        home: const IndexPage(),
      ),
    );
  }
}

