import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mozpermutas/Apresentação/views/TelaSplash.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  runApp( MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: TelaSplash());
  }
}
