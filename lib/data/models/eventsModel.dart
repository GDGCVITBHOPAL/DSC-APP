import 'dart:convert';

class EventModel {
  EventModel eventModelFromJson(String str) =>
      EventModel.fromJson(json.decode(str));

  EventModel({
    this.id,
    this.eventType,
    this.eventTitle,
    this.eventDesc,
    this.eventContent,
    this.eventDate,
    this.eventLink,
    this.eventImageUrl,
    this.eventFacebookUrl,
    this.eventLinkedInUrl,
    this.eventTwitterUrl,
    this.eventYoutubeUrl,
    this.rsvp,
  });

  String? id;
  String? eventType;
  String? eventTitle;
  String? eventDesc;
  String? eventContent;
  DateTime? eventDate;
  String? eventLink;
  String? eventImageUrl;
  String? eventFacebookUrl;
  String? eventLinkedInUrl;
  String? eventTwitterUrl;
  String? eventYoutubeUrl;
  List<String>? rsvp;

  factory EventModel.fromJson(Map<String, dynamic> json) => EventModel(
      id: json['id'],
      eventType: json['type'],
      eventTitle: json['title'],
      eventDesc: json['desc'],
      eventContent: json['content'],
      eventDate: DateTime.parse(json['date'].toString()),
      eventLink: json['link'],
      eventImageUrl: json['imageUrl'],
      eventFacebookUrl: json['facebook'],
      eventLinkedInUrl: json['linkedIn'],
      eventTwitterUrl: json['twitter'],
      eventYoutubeUrl: json['youtube'],
      rsvp: List.of(json['rsvp'] as List).map((e) => e as String).toList());
}
