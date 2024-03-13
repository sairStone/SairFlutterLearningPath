import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:flutter_first_station/counter/counter_page.dart';

void main() {
=======
import 'package:flutter/services.dart';
import 'package:flutter_first_station/guess/guess_page.dart';
import 'package:flutter_first_station/muyu/muyu_page.dart';
import 'package:flutter_first_station/navigation/app_navigation.dart';
import 'package:flutter_first_station/storage/db_storage/db_storage.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await DbStorage.instance.open();
>>>>>>> 14ab2353996ef1d079d37d1fbaec896b5483e835
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

<<<<<<< HEAD
  // This widget is the root of your application.
=======
>>>>>>> 14ab2353996ef1d079d37d1fbaec896b5483e835
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
<<<<<<< HEAD
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const CounterPage(title: 'Flutter Demo Home Page'),
    );
  }
}
=======
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          centerTitle: true,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark,
            statusBarColor: Colors.transparent,
          ),
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
          iconTheme: IconThemeData(color: Colors.black),
        )
      ),
      home: const AppNavigation(),
    );
  }
}



>>>>>>> 14ab2353996ef1d079d37d1fbaec896b5483e835
