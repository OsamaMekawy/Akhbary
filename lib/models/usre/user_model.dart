import 'package:flutter/material.dart';

class UserModel{
  final int id;
  final String name;
  final String phone;
  UserModel({
    required this.name,
    required this.phone,
    required this.id
  });
}