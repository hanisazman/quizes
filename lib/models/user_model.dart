import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 0)
class UserModel extends HiveObject {
  @HiveField(0)
  String id;
  @HiveField(1)
  String username;
  @HiveField(2)
  String password;
  @HiveField(3)
  String name;
  @HiveField(4)
  String email;

  UserModel({
    required this.id,
    required this.username,
    required this.password,
    required this.name,
    required this.email,
  });
}
