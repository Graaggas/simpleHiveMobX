import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:simple_hive_mobx/models/counter.dart';

import 'models/model.dart';

final counterMobX = Counter();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Hive.registerAdapter(CounterModelAdapter());
  var dir = await getApplicationDocumentsDirectory();
  Hive.init(dir.path);
  counterMobX.getInit();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          counterMobX.add();
        },
      ),
      appBar: AppBar(
        title: Text("Hive&MobX"),
      ),
      body: Center(
        child: Observer(
          builder: (_) => Text(
            "${counterMobX.value}",
            style: TextStyle(
              fontSize: 36,
            ),
          ),
        ),
      ),
    );
  }
}
