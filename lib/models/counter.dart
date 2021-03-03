import 'package:hive/hive.dart';
part 'counter.g.dart';

@HiveType(typeId: 1)
class CounterModel extends HiveObject{
  @HiveField(0)
  int counter = 0;
 }