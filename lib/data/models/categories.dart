import 'package:flutter/material.dart';
import 'package:realm/realm.dart';





class Categories {
  final int id;
  final String title;
  final IconData icon;

  Categories({
    required this.id,
    required this.title,
    required this.icon,
  });

  factory Categories.work(){
    return Categories(id:0, title: "work", icon: Icons.work);
  }

  factory Categories.personal(){
    return Categories(id:1, title: "personal", icon: Icons.person);
  }

  factory Categories.sport(){
    return Categories(id:2, title: "sport", icon: Icons.sports_basketball);
  }
}