import 'dart:convert';

import 'package:dsc_client/helpers/Social.dart';

class TeamMember {
  String? name;
  String? profile;
  String? bio;
  Social? social;

  TeamMember({this.name, this.profile, this.bio, this.social});

  TeamMember.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    profile = json['profile'];
    bio = json['bio'];
    social = new Social.fromJson(json['social']);
  }
}
