import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mozpermutas/Apresentação/views/TelaSplash.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Supabase.initialize(
    url: 'https://vvwmtfesehztwyinqfjq.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZ2d210ZmVzZWh6dHd5aW5xZmpxIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDg2MjU3NjAsImV4cCI6MjA2NDIwMTc2MH0.rVVkFUCanY9F4RsgDyZIqJtaZ1D0wKAW_4Whz03QM0E',
  );
  runApp(MainApp());
}



class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TelaSplash(),
    );
  }
}
