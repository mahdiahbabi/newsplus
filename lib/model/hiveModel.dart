



import 'package:hive/hive.dart';

part 'hiveModel.g.dart';

@HiveType(typeId: 0)
class HiveModel extends HiveObject{

  @HiveField(1)
  String  name = '';
  @HiveField(2)
  String  author = '';
  @HiveField(3)
  String  title = '';
  @HiveField(4)
  String  description = '';
  @HiveField(5)
  String  urlToImage = '';
  @HiveField(6)
  String  publishedAt = '';
  @HiveField(7)
  String  content = '';


}