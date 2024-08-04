import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      home: time(),
    );
  }
}

class time extends StatefulWidget {
  time({super.key});

  @override
  State<time> createState() => _timeState();
}

class _timeState extends State<time> {
  DateTime data = DateTime.now(); //هذي تسوي التاريخ

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${data.day}/${data.month}/${data.year}",
              style: TextStyle(fontSize: 22),
            ),
            ElevatedButton(
              onPressed: () async {
                DateTime? newData = await showDatePicker(
                    context: context,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100));

                if (newData == null) return; //لو حطيت كنسل  مايعدل شي
                setState(() {
                  data = newData; //وهنا لو حطيت اوك رح يغير التاريخ
                });
              },
              child: Text(
                "select ",
                style: TextStyle(color: Colors.white),
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.purple)),
            ),
          ],
        ),
      ),
    );
  }
}
