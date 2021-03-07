import 'dart:convert';
import 'package:dsc_client/constants.dart';
import 'package:dsc_client/helpers/members.dart';
import 'package:http/http.dart' as http;

class Data {
  List<TeamMember> teamMembers = <TeamMember>[];

  Future<void> getTeamData(String teamName) async {
    String coreTeamUri =
        "https://raw.githubusercontent.com/DSCVITBHOPAL/dscvitbhopal.github.io/master/data/team.json";
    String androidTeamUri =
        "https://raw.githubusercontent.com/DSCVITBHOPAL/dscvitbhopal.github.io/master/data/team/android-team.json";
    String contentTeamUri =
        "https://raw.githubusercontent.com/DSCVITBHOPAL/dscvitbhopal.github.io/master/data/team/content-team.json";
    String designTeamUri =
        "https://raw.githubusercontent.com/DSCVITBHOPAL/dscvitbhopal.github.io/master/data/team/design-team.json";
    String managementTeamUri =
        "https://raw.githubusercontent.com/DSCVITBHOPAL/dscvitbhopal.github.io/master/data/team/management-team.json";
    String mlTeamUri =
        "https://raw.githubusercontent.com/DSCVITBHOPAL/dscvitbhopal.github.io/master/data/team/ml-team.json";
    String webTeamUri =
        "https://raw.githubusercontent.com/DSCVITBHOPAL/dscvitbhopal.github.io/master/data/team/web-team.json";

    String url = coreTeamUri;
    if (teamName == ANDROID_TEAM) {
      url = androidTeamUri;
    } else if (teamName == CONTENT_TEAM) {
      url = contentTeamUri;
    } else if (teamName == DESIGN_TEAM) {
      url = designTeamUri;
    } else if (teamName == MANAGEMENT_TEAM) {
      url = managementTeamUri;
    } else if (teamName == ML_TEAM) {
      url = mlTeamUri;
    } else if (teamName == WEB_TEAM) {
      url = webTeamUri;
    } else {
      url = coreTeamUri;
    }

    var response = await http.get(url);
    print(response);
    var jsonData = jsonDecode(response.body);
    print("From Data:  $jsonData");

    jsonData['team'].forEach((element) {
      TeamMember teamMember = TeamMember();

      teamMember.title = element['title'];
      teamMember.name = element['name'];
      teamMember.link = element['link'];
      teamMember.twitter = element['social']['twitter'];
      teamMember.linkedin = element['social']['linkedin'];
      teamMember.medium = element['social']['medium'];
      teamMember.github = element['social']['github'];
      teamMember.profile = element['profile'];

      teamMembers.add(teamMember);
    });
  }
}
