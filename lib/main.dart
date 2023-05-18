import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:userapp/controller/logic/internet_cubits/internet_cubits.dart';
import 'package:userapp/controller/logic/user_cubits/user_cubits.dart';
import 'package:userapp/model/user_model.dart';
import 'package:userapp/view/homepage.dart';

late Box box;
void main() async {
  await Hive.initFlutter();
  Directory directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(UserModelAdapter());
  box = await Hive.openBox('box');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserCubit>(
          create: (context) => UserCubit(),
        ),
        BlocProvider<InternetCubit>(
          create: (context) => InternetCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'UserApp',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const Homepage(),
      ),
    );
  }
}
