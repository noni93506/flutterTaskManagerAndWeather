
import 'package:flutter/material.dart';


enum Categories {
  work,
  personal,
  sport;

  IconData get iconData {
    switch (this) {
      case Categories.work:
        return  Icons.work;
      case Categories.personal:
        return Icons.person;
      case Categories.sport:
        return Icons.sports_basketball;

    }
  }
}
