import 'package:flutter/material.dart';

class News {
  String title;
  String description;
  String link;
  dynamic datetime;
  dynamic date;
  dynamic time;

  News({
    required this.title,
    required this.description,
    required this.link,
    required this.datetime,
    required this.date,
    required this.time,
  });
}
