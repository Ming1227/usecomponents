import 'package:flutter/material.dart';
import 'package:saturn_login/saturn_login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    _configLogin();
  }

  void _configLogin() {
    SCConfig config = SCConfig.instance();
    config.colorConfig = {
      SCConfigConstant.inputBgColor: Colors.white,
    };
    config.textStyleConfig = {
      SCConfigConstant.inputTextStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      ),
    };
    config.api.verifyCode = (Map<String, dynamic> map) {
      if (map['mobile'] as String == "15888888888") return SCResult.success();
      return SCResult.error();
    };
    config.api.login = ((map) {
      if (map['username'] == null || map['password'] == null) {
        return SCResult.errNull();
      }
      return SCResult.success();
    });
    config.api.resetPS = ((map) {
      if (map['confirm'] == null || map['password'] == null) {
        return SCResult.errNull();
      }
      return SCResult.success();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        backgroundColor: Colors.white,
      ),
      home: const SCLoginPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
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
