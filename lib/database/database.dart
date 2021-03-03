import 'package:hive/hive.dart';
import 'package:simple_hive_mobx/models/counter.dart';

class Database {
  Future<Box> openBox() async {
    var box = await Hive.openBox("database");
    return box;
  }

  Future<void> addToBox(CounterModel value, int index) async {
    final box = await openBox();
   box.put(index, value);
  }

  Future<void> updateAtBox(CounterModel value, int index) async {
    final box = await openBox();
    box.putAt(index, value);
  }

  Future<int> getInit() async {
    final box = await openBox();
    int r = 0;

    if(box.isNotEmpty) {
      CounterModel counterModel = box.get(1);
      r = counterModel.counter;
      print("database // box is not empty");
    }


   print("database // init counter = $r");
   return r;
  }
}