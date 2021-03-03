import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:simple_hive_mobx/database/database.dart';
import 'package:simple_hive_mobx/models/counter.dart';



part 'model.g.dart';

class Counter = _Counter with _$Counter;

abstract class _Counter with Store {

  final database = Database();


  @observable
  int value = 0;

  @action
  void add() {
    value++;
    CounterModel counterModel = CounterModel();
    counterModel..counter = value;
    print("model.dart // ${value}");
    database.addToBox(counterModel, 1);

  }

  Future<void> getInit() async {
    int r = 0;
    print("1/ model.dart // r = $r, value = $value");
    final future = database.getInit();
    r = await future;
    print("2/ model.dart // r = $r");
    value = r;
  }
 }
