import 'package:flutter/material.dart';

class Event {
  static const String collectionName = 'Events';

  String id;
  String eventImage;
  String eventName;
  String eventTitle;
  String eventDescription;
  DateTime eventDate;

  TimeOfDay eventTime;
  bool isFavorite;

  Event({
    this.id = '',
    required this.eventName,
    required this.eventDescription,
    required this.eventTitle,
    required this.eventImage,
    required this.eventDate,
    required this.eventTime,
    this.isFavorite = false,
  });

  Event.fromFireStore(Map<String, dynamic> data)
    : this(
        id: data['id'],
        eventName: data['event_name'],
        eventImage: data['event_image'],
        eventTitle: data['event_title'],
        eventDescription: data['event_description'],
        eventDate: DateTime.fromMillisecondsSinceEpoch(data['event_date']),
        eventTime: data['event_time'] as TimeOfDay,
        isFavorite: data['is_favorite'],
      );

  Map<String, dynamic> toFireStore() {
    return {
      'id': id,
      'event_name': eventName,
      'event_image': eventImage,
      'event_title': eventTitle,
      'event_description': eventDescription,
      'event_date': eventDate.millisecondsSinceEpoch,
      'event_time': eventTime.toString(),
      'is_favorite': isFavorite,
    };
  }
}
