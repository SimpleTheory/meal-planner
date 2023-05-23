import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:nutrition_app/blocs/navigation/navigation_bloc.dart';
import 'package:nutrition_app/blocs/settings/settings_bloc.dart';
import 'package:nutrition_app/screens/index.dart';
import 'package:nutrition_app/screens/init.dart';
import 'blocs/init/init_bloc.dart';
import 'domain/nutrtion_app_domain.dart';
import 'utils.dart';

void main() async {
  await Hive.initFlutter();
  runApp(MyApp(app: await loadApp()));
}

class MyApp extends StatelessWidget {
  final App? app;

  const MyApp({this.app, super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NavigationBloc()),
        BlocProvider(create: (context) => InitBloc()),
        BlocProvider(create: (context) => SettingsBloc()),
        // BlocProvider(create: (context) => GlobalBloc())
      ],
      child: BlocBuilder<InitBloc, InitState>(
        builder: (context, state) {
          if (state is SuccessfulLoad) {
            return MaterialApp(
              title: 'Nutrition App',
              themeMode: state.app.settings.darkMode ? ThemeMode.dark : ThemeMode
                  .light,
              theme: ThemeData(
                primarySwatch: Colors.green,
              ),
              darkTheme: ThemeData(
                  brightness: Brightness.dark,
                  primarySwatch: Colors.green),
              home: const IndexPage(),
              debugShowCheckedModeBanner: false,
            );
          } else {
            return const InitPage();
          }
        },
      ),
    );
  }
}

// class MyApp extends StatefulWidget {
//   App? app;
//   MyApp({this.app, Key? key}) : super(key: key);
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     if (widget.app != null) {
//       return MultiBlocProvider(
//         providers: [
//           BlocProvider(create: (context) => NavigationBloc()),
//           BlocProvider(create: (context) => InitBloc()),
//           BlocProvider(create: (context) => GlobalBloc(widget.app!))
//         ],
//         child: BlocBuilder<GlobalBloc, GlobalState>(
//           builder: (context, state) {
//             return MaterialApp(
//               title: 'Nutrition App',
//               themeMode: state.darkMode ? ThemeMode.dark : ThemeMode.light,
//               theme: ThemeData(
//                 primarySwatch: Colors.green,
//               ),
//               darkTheme: ThemeData(
//                   brightness: Brightness.dark, primarySwatch: Colors.green),
//               home: const IndexPage(),
//               debugShowCheckedModeBanner: false,
//             );
//           },
//         ),
//       );
//     } else {
//       return BlocProvider(create: (BuildContext context) => InitBloc(),
//       child: BlocListener<InitBloc, InitState>(
//           listener: (context, state){
//             if (state is SuccessfulLoad){
//               setState(() {
//                 widget.app = state.app;
//               });
//             }
//           },
//           child: const InitPage()));
//     }
//   }
// }

