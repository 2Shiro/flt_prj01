import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// 앱화면 구성
class MyHomePage extends StatefulWidget {
  // 생성자 {} 선택적 파라미터 사용하는
  const MyHomePage({super.key, required this.title});
  // required : 필수 생성자 인자

  final String title; // final : 실행할때 초기화 -한번만 초기화가능

  @override
  State<MyHomePage> createState() => _MyHomePageState();
  // _ : private , _ 없으면 public
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); // 부모클래스의 생성자를 실행하라

  @override
  Widget build(BuildContext context) {
    // MaterialApp : 안드로이드용 화면 구성
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black54),
        // black54 : black, opacity 0.54
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter 첫번째 예제'),
    );
  }
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    }); // 익명 함수 : () {}
    // 버튼이 눌러져서 _counter++ 이것이 setState 로 저장
    // state 가 지정된 widget 이 새로 그려진다
  }

  @override
  Widget build(BuildContext context) {
    // BuildContext : 위젯의 위치 정보숫자 - 위젯을 찾는데 사용
    // Scaffold : 구조를 잡아준다
    return Scaffold(
      appBar: AppBar(
        // Theme.of(context) : Theme context 의 부모
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // 방향 Axis(축)
          children: <Widget>[
            const Text(
              '버튼을 누른 숫자:',
            ),
            Text(
              '$_counter', //  $ format 문 역할
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
