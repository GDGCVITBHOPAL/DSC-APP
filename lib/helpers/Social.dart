class Social {
  String? medium;
  String? linkedin;
  String? github;
  String? twitter;

  Social({this.medium, this.linkedin, this.github, this.twitter});

  Social.fromJson(Map<String, dynamic> json) {
    medium = json['medium'];
    linkedin = json['linkedin'];
    github = json['github'];
    twitter = json['twitter'];
  }
}
