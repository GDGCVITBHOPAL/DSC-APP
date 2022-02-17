import 'dart:convert';

import 'package:dsc_client/helpers/TeamMember.dart';
import 'package:dsc_client/widgets/MemberCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as sv;

class TeamTab extends StatefulWidget {
  final String team;
  final String year;
  const TeamTab({Key? key, required this.team, required this.year})
      : super(key: key);

  @override
  State<TeamTab> createState() => _TeamTabState();
}

class _TeamTabState extends State<TeamTab> {
  Future<List<TeamMember>> readJson(String team) async {
    var json;
    switch (team) {
      case 'Android':
        json =
            await sv.rootBundle.loadString('assets/teamData/android-team.json');
        break;
      case 'Core':
        json = await sv.rootBundle.loadString('assets/teamData/core-team.json');
        break;
      case 'Content':
        json =
            await sv.rootBundle.loadString('assets/teamData/content-team.json');
        break;
      case 'Design':
        json =
            await sv.rootBundle.loadString('assets/teamData/design-team.json');
        break;
      case 'Management':
        json = await sv.rootBundle
            .loadString('assets/teamData/management-team.json');
        break;
      case 'ML':
        json = await sv.rootBundle.loadString('assets/teamData/ml-team.json');
        break;
      case 'Outreach':
        json = await sv.rootBundle
            .loadString('assets/teamData/outreach-team.json');
        break;
      case 'Web':
        json = await sv.rootBundle.loadString('assets/teamData/web-team.json');
        break;
      case 'WTM':
        json = await sv.rootBundle.loadString('assets/teamData/wtm-team.json');
        break;
    }

    final map = jsonDecode(json) as Map<String, dynamic>;

    return List.from(map[widget.year])
        .map((e) => TeamMember.fromJson(e))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: readJson(widget.team),
        builder: (context, data) {
          if (data.hasData) {
            final members = data.data as List<TeamMember>;

            return ListView.builder(
              itemCount: members.length,
              itemBuilder: (context, index) {
                return MemberCard(member: members[index]);
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),
            );
          }
        });
  }
}
