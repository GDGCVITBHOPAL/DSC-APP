import 'package:dsc_client/helpers/TeamMember.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class MemberCard extends StatelessWidget {
  final TeamMember member;
  const MemberCard({Key? key, required this.member}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final social = member.social!;

    return ListTile(
      title: Text(
        member.name!,
        style: GoogleFonts.rubik(
          fontSize: 15.0,
          fontWeight: FontWeight.w400,
        ),
      ),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(member.profile!),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            if (social.github != null && social.github!.isNotEmpty)
              ElevatedButton(
                onPressed: () async {
                  String link = social.github!;
                  if (await canLaunch(link)) {
                    await launch(link);
                  } else {
                    throw 'Could not launch $link';
                  }
                },
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    //color: Colors.black,
                    image: DecorationImage(
                        image: AssetImage('assets/images/github_logo.png'),
                        fit: BoxFit.contain),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  shape: CircleBorder(),
                ),
              ),
            if (social.medium != null && social.medium!.isNotEmpty)
              ElevatedButton(
                onPressed: () async {
                  String link = social.medium!;
                  if (await canLaunch(link)) {
                    await launch(link);
                  } else {
                    throw 'Could not launch $link';
                  }
                },
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    //color: Colors.black,
                    image: DecorationImage(
                        image: AssetImage('assets/images/medium_logo.jpeg'),
                        fit: BoxFit.cover),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                ),
              ),
            if (social.linkedin != null && social.linkedin!.isNotEmpty)
              ElevatedButton(
                onPressed: () async {
                  String link = social.linkedin!;
                  if (await canLaunch(link)) {
                    await launch(link);
                  } else {
                    throw 'Could not launch $link';
                  }
                },
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    //color: Colors.black,
                    image: DecorationImage(
                        image: AssetImage('assets/images/linkedin_logo.png'),
                        fit: BoxFit.cover),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  shape: CircleBorder(),
                ),
              ),
            if (social.twitter != null && social.twitter!.isNotEmpty)
              ElevatedButton(
                onPressed: () async {
                  String link = social.twitter!;
                  if (await canLaunch(link)) {
                    await launch(link);
                  } else {
                    throw 'Could not launch $link';
                  }
                },
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    //color: Colors.black,
                    image: DecorationImage(
                        image: AssetImage('assets/images/twitter_logo.png'),
                        fit: BoxFit.cover),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
